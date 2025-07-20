class Todo {
  String text;
  DateTime? deadline;
  bool isDone;

  Todo({
    required this.text,
    this.deadline,
    this.isDone = false,
  });
}