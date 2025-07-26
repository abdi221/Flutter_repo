import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo.dart';

typedef TodoCallBack = void Function(Todo todo);

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onEdit;

  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    // build the deadline text if there is one
    String deadlineText = '';
    if (todo.deadline != null) {
      final time = TimeOfDay.fromDateTime(todo.deadline!).format(context);
      final date = DateFormat.yMMMd().format(todo.deadline!);
      deadlineText = ' • $time on $date';
    }

    // choose leading icon and color
    IconData leadingIcon;
    Color? iconColor;
    if (todo.isDone) {
      leadingIcon = Icons.check_circle;
      iconColor = Colors.green;
    } else {
      leadingIcon = Icons.radio_button_unchecked;
      iconColor = null;
    }

    // pick text decoration
    TextDecoration decoration =
        todo.isDone ? TextDecoration.lineThrough : TextDecoration.none;

    // then return the ListTile
    return ListTile(
      leading: Icon(leadingIcon, color: iconColor),
      title: Text(
        todo.text + deadlineText,
        style: TextStyle(decoration: decoration),
      ),
      onTap: onToggle,
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: onEdit,
      ),
    );
  }
}
