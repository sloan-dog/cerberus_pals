import 'package:flutter/material.dart';

class ActivityRowWidget extends StatelessWidget {
  final String name;
  final DateTime date;
  final String text;

  ActivityRowWidget({this.name, this.date, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(this.name),
      Text(this.date.toIso8601String()),
      Text(this.text),
    ]);
  }
}
