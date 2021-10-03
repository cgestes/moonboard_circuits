import 'package:flutter/material.dart';
import 'package:mb_circuits/components/layout_scaling_padding.dart';
import 'package:mb_circuits/debug_options.dart';

class MoonboardButtons extends StatelessWidget {
  final List<int> circuit;
  final void Function(int) onTapHold;
  final double scale;

  const MoonboardButtons(
      {required this.circuit,
      required this.onTapHold,
      this.scale = 1.0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? content;
    if (debugLayout) {
      content = Container(
        decoration: BoxDecoration(
            color: Colors.red[600]?.withOpacity(0.5),
            border: Border.all(width: 2.0, color: const Color(0xFF003355))),
      );
    }

    return LayoutScalingPadding(
        scale: scale,
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 11,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            children: List.generate(12 * 11, (index) {
              return Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () => onTapHold(index),
                  child: content,
                ),
              );
            })));
  }
}
