import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/global_bloc.dart';
import 'package:todo_app/routes.dart';
import 'package:todo_app/src/utils/navigator_helper.dart';
import 'package:todo_app/theme.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'TODO APP',
      builder: (context, child) => DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyText1,
        child: Scaffold(
          appBar: null,
          key: globalBloc.scaffoldKey,
          body: child,
        ),
      ),
      navigatorKey: NavigatorHelper.navigatorKey,
      initialRoute: Routes.todos,
      routes: Routes.appRoutes,
      theme: AppTheme.getThemeData(),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
