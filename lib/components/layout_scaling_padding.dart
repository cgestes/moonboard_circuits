import 'package:flutter/material.dart';
import 'package:mb_circuits/debug_options.dart';

class LayoutScalingPadding extends StatelessWidget {
  final double scale;
  final double offsetY;
  final Widget child;

  const LayoutScalingPadding(
      {required this.scale, required this.child, this.offsetY = 0.0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget w = child;
    if (debugLayout) {
      w = Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: const Color(0xFF494F9F))),
          child: child);
    }

    return Padding(
        padding: EdgeInsets.fromLTRB(
            (108 * scale), (94 + offsetY) * scale, 52 * scale, 0),
        child: w);
  }
}
