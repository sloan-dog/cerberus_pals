import 'package:flutter/material.dart';

class NewActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.horizontal, children: [
      FormField(
          builder: null,
          onSaved: (dynamic val) {
            // do stuff with value
          }),
      FormField(
          builder: null,
          onSaved: (dynamic val) {
            // do stuff with value
          }),
      FormField(
          builder: null,
          onSaved: (dynamic val) {
            // do stuff with value
          }),
    ]);
  }
}
