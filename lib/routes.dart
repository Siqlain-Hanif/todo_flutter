// @dart=2.11

import 'package:flutter/material.dart';
import 'package:todo_app/src/screens/todo_create_edit_screen.dart';
import 'package:todo_app/src/screens/todos_screen.dart';

/// MaterialApp will use this for routing
class Routes {
  static const String todos = TodosScreen.routeName;
  static const String todo_create_edit = TodoCreateEditScreen.routeName;

  static Map<String, Widget Function(BuildContext)> appRoutes = {
    //Login Sequence
    todos: (context) => TodosScreen(),
    todo_create_edit: (context) => TodoCreateEditScreen(),
  };
}
