import 'dart:ffi';

import 'package:flutter/material.dart';

class ActivityRowWidget extends StatelessWidget {
  final String name;
  final DateTime date;
  final String text;
  final double spaceAfter;
  final double spaceBetween;

  ActivityRowWidget(
      {this.name,
      this.date,
      this.text,
      this.spaceAfter = 10.0,
      this.spaceBetween = 10.0});

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      Flex(direction: Axis.horizontal, children: [
        Expanded(child: Flexible(child: Text(this.name))),
        Container(width: this.spaceBetween),
        Expanded(
            child: Flexible(
                child: Text(
          this.date.toIso8601String(),
        ))),
        Container(width: this.spaceBetween),
        Expanded(
            child: Flexible(
          child: Text(
            this.text,
            maxLines: 10,
          ),
        )),
      ]),
      Container(height: this.spaceAfter),
    ]);
  }
}
