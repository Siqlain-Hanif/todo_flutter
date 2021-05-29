import 'package:flutter/material.dart';
import 'package:todo_app/src/utils/navigator_helper.dart';

class TodosScreen extends StatelessWidget {
  static const String routeName = '/todos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //opens in create mode
          NavigatorHelper().navigateToTodoCreateEditScreen();
        },
      ),
    );
  }
}
