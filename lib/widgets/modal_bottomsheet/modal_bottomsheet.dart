import 'package:flutter/material.dart';

class ModalBottomSheet extends StatefulWidget {
  final Widget child;
  ModalBottomSheet({Key key, @required this.child}) : super(key: key);

  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: widget.child,
    );
  }
}
