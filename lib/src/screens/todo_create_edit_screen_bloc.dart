import 'package:flutter/src/widgets/framework.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/repositories/todo_repo.dart';
import 'package:todo_app/src/utils/base_bloc.dart';

class TodoCreateEditScreenBloc extends BaseBloc {
  final int todoId;
  final BehaviorSubject<Todo> todo$;
  Todo todo = Todo();
  String get mode => todoId == 0 ? "create" : "edit";
  TodoCreateEditScreenBloc(this.todoId) : todo$ = todoRepo.todoById(todoId) {
    initState();
  }
  initState() {
    final todoValue = todo$.value;
    if (todoValue == null) return;
    todo = todoValue;
  }

  create() {
    todoRepo.create(todo);
  }

  update() {
    todoRepo.edit(todo);
  }

  @override
  void dispose(BuildContext context) {
    // TODO: implement dispose
  }
}
