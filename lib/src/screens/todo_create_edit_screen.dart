import 'package:flutter/material.dart';
import 'package:todo_app/src/widgets/input_fields.dart';

class TodoCreateEditScreenArguments {
  final int todoId;
  TodoCreateEditScreenArguments(this.todoId);
}

class TodoCreateEditScreen extends StatelessWidget {
  static const String routeName = '/todos/create_edit';
  @override
  Widget build(BuildContext context) {
    TodoCreateEditScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    int todoId = args.todoId;
    return Scaffold(
      appBar: AppBar(
        title: Text(todoId == 0 ? "Create Todo" : "Edit Todo"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          print("On Tap");
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Form(
            child: TextInputField("Todo"),
          ),
        ),
      ),
    );
  }
}
