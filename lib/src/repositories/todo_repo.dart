import 'package:rxdart/rxdart.dart';
import 'package:todo_app/src/models/todo_model.dart';

class TodoRepository {
  Map<int, BehaviorSubject<Todo>> todosMap = Map<int, BehaviorSubject<Todo>>();

  //All the keys of created todos
  final todoList$ = BehaviorSubject<List<int>>.seeded([]);

  BehaviorSubject<List<Todo>> get contentRefsValues =>
      _todosValueSubject(todoList$);
  BehaviorSubject<Todo> todoById(int id) {
    _introduceTodo(id);
    return todosMap[id];
  }

  void _introduceTodo(int id) {
    if (!todosMap.containsKey(id)) {
      todosMap[id] = BehaviorSubject<Todo>.seeded(null);
    }
  }

  void populateTodos(List<Todo> todos) {
    todos.forEach((todo) {
      populateTodo(todo);
    });
  }

  void populateTodo(Todo todo) {
    todoById(todo.id).add(todo);
  }

  BehaviorSubject<List<Todo>> _todosValueSubject(
      BehaviorSubject<List<int>> theirIds) {
    final contents = BehaviorSubject<List<Todo>>();
    contents
        .addStream(theirIds
            .map((ids) => ids
                .map((id) => todoById(id).value)
                .where((i) => i != null)
                .toList())
            .distinct())
        .then((_) => contents.close());
    return contents;
  }

  void addTodoKey(int key, {trailing: true}) {
    final old = todoList$.value ?? [];
    todoList$.add((trailing ? old + [key] : [key] + old).toSet().toList());
  }

  void removeTodoKey(int key, {trailing: true}) {
    final old = todoList$.value ?? [];
    old.remove(key);
    todoList$.add(old);
  }

  create(Todo todo) {
    // final todo = Todo(text: text);
    populateTodo(todo);
    addTodoKey(todo.id);
  }

  delete(Todo todo) {
    populateTodo(todo);
    removeTodoKey(todo.id);
  }

  edit(Todo todo) {
    populateTodo(todo);
  }
}

//Global repo for managing repo data.
final todoRepo = TodoRepository();
