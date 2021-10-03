import 'package:flutter/material.dart';
import 'package:mb_circuits/components/layout_scaling_padding.dart';

List<int> getHolds(List<int> circuit, int index) {
  var res = <int>[];
  for (var i = 0; i < circuit.length; i++) {
    if (circuit[i] == index) {
      res.add(i);
    }
  }
  return res;
}

String holdId(int index) {
  if (index < 2) return "S${index + 1}";
  return "${index - 1}";
}

class MoonboardHold extends StatelessWidget {
  final List<int> circuit;
  final int index;
  final double scale;

  const MoonboardHold(
      {required this.circuit, required this.index, this.scale = 1.0, Key? key})
      : super(key: key);

  Widget text(int index) {
    return Text(
      holdId(index),
      style: TextStyle(
          color: Colors.white,
          fontSize: 19 * scale,
          fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    final holds = getHolds(circuit, index);
    if (holds.isEmpty) {
      return Container();
    }
    return Align(
        alignment: FractionalOffset.topCenter,
        child: Container(
            padding: EdgeInsets.all(4 * scale),
            color: Colors.blue[800]?.withOpacity(0.7),
            child: Wrap(
                spacing: 4, children: holds.map((i) => text(i)).toList())));
  }
}

class MoonboardHolds extends StatelessWidget {
  final List<int> circuit;
  final double scale;

  const MoonboardHolds({required this.circuit, this.scale = 1.0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutScalingPadding(
        scale: scale,
        offsetY: 44.0,
        child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 11,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            children: List.generate(12 * 11, (index) {
              return MoonboardHold(
                  circuit: circuit, index: index, scale: scale);
            })));
  }
}
