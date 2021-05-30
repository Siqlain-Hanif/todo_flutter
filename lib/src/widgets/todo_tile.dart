import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_app/global_bloc.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/repositories/todo_repo.dart';
import 'package:todo_app/src/utils/navigator_helper.dart';

class TodoTile extends StatelessWidget {
  final int todoId;
  TodoTile(this.todoId);
  BehaviorSubject<Todo> get todo$ => todoRepo.todoById(todoId);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Todo>(
        stream: todo$,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return SizedBox(width: 0);
          final todo = snapshot.data;
          return Card(
            elevation: 2,
            color: Colors.grey.shade300,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    todo.text,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ButtonBar(
                  buttonPadding: const EdgeInsets.all(8),
                  buttonHeight: 24,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        NavigatorHelper()
                            .navigateToTodoCreateEditScreen(id: todoId);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        todoRepo.delete(todo);
                        globalBloc.showSnackBar(
                            message: "DELETED ${todo.text}");
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
