class Todo {
  String text;
  bool isDone;
  DateTime? deadline;

  Todo({
    required this.text,
    this.isDone = false,
    this.deadline,
  });
}
