// @dart=2.11

import 'package:flutter/material.dart';
import 'package:todo_app/routes.dart';
import 'package:todo_app/src/screens/todo_create_edit_screen.dart';

// Singleton
class NavigatorHelper {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'global:navigator');
  static final NavigatorHelper _instance = NavigatorHelper._internal();

  factory NavigatorHelper() {
    return _instance;
  }

  NavigatorHelper._internal();

  Future<void> navigateTo(String route,
      [Object arguments, bool force = false]) async {
    await navigatorKey.currentState.pushNamed(route, arguments: arguments);
  }

  //This will trigger willpopscope
  maybePop() {
    return navigatorKey.currentState.maybePop();
  }

  canPop() {
    return navigatorKey.currentState.canPop();
  }

  clearAllAndNavigateTo(String route, {arguments}) async {
    await navigatorKey.currentState.pushNamedAndRemoveUntil(
      route,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  Future<void> navigateToTodoListScreen() {
    return navigateTo(Routes.todos);
  }

  Future<void> navigateToTodoCreateEditScreen({int id = 0}) {
    return navigateTo(
      Routes.todo_create_edit,
      TodoCreateEditScreenArguments(id),
    );
  }
}
