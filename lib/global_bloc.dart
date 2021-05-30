import 'package:flutter/material.dart';

class GlobalBloc {
  final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>(debugLabel: 'global:scaffold');

  showSnackBar({
    String message,
    Widget content,
    SnackBarAction action,
    Duration duration,
    SnackBar snackbar,
  }) {
    //if snackBar is provided it will override everything
    assert(!(message != null && content != null), 'Mutually exclusive');
    // Duration Material spec: min 4s, max 10s
    // This works OK for notifications
    if (duration == null && action == null)
      duration = const Duration(milliseconds: 4000);
    // Actionable snackbars should stick around for a bit
    if (duration == null && action != null)
      duration = const Duration(milliseconds: 6000);

    if (message != null) {
      content = Text(message);
    }

    if (snackbar != null)
      snackbar = SnackBar(
        content: snackbar.content,
        duration: snackbar.duration,
        action: snackbar.action,
      );
    final snack = snackbar ??
        SnackBar(
          content: content,
          duration: duration,
          action: action,
        );

    scaffoldKey.currentState.showSnackBar(snack);
  }
}

final globalBloc = GlobalBloc();
