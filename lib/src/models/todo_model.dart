class Todo {
  int id;
  String text;
  Todo({this.text}) : id = Todo.generateId();
  static int generateId() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
