import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minimal Todo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _controller = TextEditingController();
  final List<String> _tasks = [];
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showTutorial());
  }

  void _showTutorial() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Welcome to Minimal Todo!'),
        content: const Text(
          '• Swipe left on a task to delete it.\n'
          '• Tap a task to highlight and edit it.\n'
          '• Tap the edit button on the right to load it.\n'
          '• Enter text and tap + to add or update.'
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it!'),
          ),
        ],
      ),
    );
  }

  void _addTask() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    if (_selectedIndex != null) {
      // update existing
      setState(() {
        _tasks[_selectedIndex!] = text;
        _selectedIndex = null;
      });
    } else {
      final index = _tasks.length;
      _tasks.add(text);
      _listKey.currentState?.insertItem(
        index,
        duration: const Duration(milliseconds: 300),
      );
    }
    _controller.clear();
  }

  void _removeTask(int index) {
    final removed = _tasks.removeAt(index);
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => _buildItem(removed, animation, index),
      duration: const Duration(milliseconds: 300),
    );
    if (_selectedIndex == index) setState(() => _selectedIndex = null);
  }

  Widget _buildItem(String text, Animation<double> animation, int index) {
    final isSelected = _selectedIndex == index;
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: 0.0,
      child: Card(
        color: isSelected ? Colors.teal.shade50 : null,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Dismissible(
          key: ValueKey(text + index.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => _removeTask(index),
          background: Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Text(
              'Delete',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          child: ListTile(
            tileColor: isSelected ? Colors.teal.shade50 : null,
            title: Text(text),
            trailing: isSelected
                ? IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      _controller.text = text;
                    },
                  )
                : const Icon(Icons.drag_handle),
            onTap: () {
              setState(() {
                _selectedIndex = isSelected ? null : index;
                _controller.text = text;
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Minimal Todo'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/wallpaper.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(hintText: 'New task...'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _addTask,
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: AnimatedList(
                    key: _listKey,
                    initialItemCount: _tasks.length,
                    itemBuilder: (context, index, animation) {
                      return _buildItem(_tasks[index], animation, index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
