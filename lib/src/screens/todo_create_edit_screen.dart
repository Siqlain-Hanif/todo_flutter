import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_app/global_bloc.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/screens/todo_create_edit_screen_bloc.dart';
import 'package:todo_app/src/utils/bloc_provider.dart';
import 'package:todo_app/src/utils/navigator_helper.dart';
import 'package:todo_app/src/widgets/input_fields.dart';

class TodoCreateEditScreenArguments {
  final int todoId;
  TodoCreateEditScreenArguments(this.todoId);
}

class TodoCreateEditScreen extends StatefulWidget {
  static const String routeName = '/todos/create_edit';

  @override
  _TodoCreateEditScreenState createState() => _TodoCreateEditScreenState();
}

class _TodoCreateEditScreenState extends State<TodoCreateEditScreen> {
  final _formKey = GlobalKey<FormState>(debugLabel: 'todo:create-edit');

  int todoId = 0;
  String todoText;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    TodoCreateEditScreenArguments args =
        ModalRoute.of(context).settings.arguments;
    todoId = args.todoId;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCreateEditScreenBloc>(
      create: (context) => TodoCreateEditScreenBloc(todoId),
      builder: (context, bloc) => Scaffold(
        appBar: AppBar(
          title: Text(todoId == 0 ? "Create Todo" : "Edit Todo"),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  bloc.mode == "create" ? bloc.create() : bloc.update();
                  NavigatorHelper().maybePop();
                  globalBloc.showSnackBar(
                      message: bloc.mode == "create" ? "CREATED" : "UPDATED");
                }
              },
              child: bloc.mode == "create" ? Text("SAVE") : Text("UPDATE"),
            )
          ],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            print("On Tap");
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Form(
              key: _formKey,
              child: TextInputField(
                "Todo",
                value: bloc.todo.text,
                validator: (String value) {
                  if (value == null || value.length == 0) {
                    return 'This field is required';
                  }
                  return null;
                },
                onSaved: (String text) {
                  bloc.todo.text = text;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
