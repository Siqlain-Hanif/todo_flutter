// @dart=2.11

import 'package:flutter/material.dart';
import 'package:todo_app/theme.dart';

class NoDataCard extends StatelessWidget {
  final String text;
  final String title;

  const NoDataCard({
    Key key,
    @required this.title,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 320,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTheme.getGreyTextStyle(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
