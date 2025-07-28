import 'package:flutter/material.dart';
import 'models/todo.dart';
import 'widgets/todo_item.dart';
import 'screen/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My ToDo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> _todos = [];
  final TextEditingController _controller = TextEditingController();
  final Settings _settings = Settings();

  void _addTodo([Todo? editing]) {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      if (editing != null) {
        editing.text = text;
      } else {
        _todos.add(Todo(text: text));
      }
      _controller.clear();
    });
  }

  void _editTodo(Todo todo) {
    _controller.text = todo.text;
    _addTodo(todo);
  }

  void _goToSettings() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SettingsPage(settings: _settings),
      ),
    );
    setState(() {}); // rebuild with new settings
  }

  List<Todo> get _visibleTodos {
    List<Todo> list = _settings.hideCompleted
        ? _todos.where((t) => !t.isDone).toList()
        : List.from(_todos);

    if (_settings.sortOrder == SortOrder.alphabetical) {
      list.sort((a, b) => a.text.compareTo(b.text));
    } else if (_settings.sortOrder == SortOrder.deadline) {
      list.sort((a, b) {
        if (a.deadline == null && b.deadline == null) return 0;
        if (a.deadline == null) return 1;
        if (b.deadline == null) return -1;
        return a.deadline!.compareTo(b.deadline!);
      });
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = _settings.darkMode;

    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My ToDo App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: _goToSettings,
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Add a new task...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _addTodo(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _visibleTodos.isEmpty
                  ? const Center(child: Text('No tasks yet'))
                  : ListView.builder(
                      itemCount: _visibleTodos.length,
                      itemBuilder: (context, index) {
                        final todo = _visibleTodos[index];
                        return Dismissible(
                          key: Key(todo.text + index.toString()),
                          direction: DismissDirection.endToStart,
                          onDismissed: (_) {
                            setState(() {
                              _todos.remove(todo);
                            });
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: TodoItem(
                            todo: todo,
                            onToggle: () {
                              setState(() {
                                todo.isDone = !todo.isDone;
                              });
                            },
                            onEdit: () {
                              _controller.text = todo.text;
                              setState(() {
                                _todos.remove(todo); // Remove and re-add
                              });
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
