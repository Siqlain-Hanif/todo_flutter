import 'package:flutter/material.dart';

class GlobalBloc {
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'global:scaffold');
}

final globalBloc = GlobalBloc();
