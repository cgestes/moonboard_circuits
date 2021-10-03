import 'package:flutter/material.dart';
import 'package:mb_circuits/components/moonboard_background.dart';
import 'package:mb_circuits/components/moonboard_buttons.dart';
import 'package:mb_circuits/components/moonboard_holds.dart';

class MoonboardLayout extends StatelessWidget {
  final List<int> circuit;
  final void Function(int index) onTapHold;

  const MoonboardLayout(
      {required this.circuit, required this.onTapHold, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InteractiveViewer(
            panEnabled: true,
            // boundaryMargin: const EdgeInsets.all(100),
            minScale: 1,
            maxScale: 2,
            child: AspectRatio(
                aspectRatio: 1018.0 / 1089.0,
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  // constraints.maxHeight
                  // constraints.maxWidth
                  final scale = constraints.maxHeight / 1089.0;

                  return Stack(fit: StackFit.passthrough, children: [
                    const Positioned.fill(child: MoonboardBackground()),
                    Positioned.fill(
                        child: MoonboardHolds(circuit: circuit, scale: scale)),
                    Positioned.fill(
                        child: MoonboardButtons(
                            circuit: circuit,
                            onTapHold: onTapHold,
                            scale: scale)),
                  ]);
                }))));
  }
}

class MoonboardLayoutWithName extends StatelessWidget {
  final List<int> circuit;
  final String name;
  final void Function(String name) onSetName;
  final void Function(int index) onTapHold;

  const MoonboardLayoutWithName(
      {required this.circuit,
      required this.onTapHold,
      required this.name,
      required this.onSetName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
              onChanged: (val) => onSetName(val),
              decoration: const InputDecoration(
                // border: OutlineInputBorder(),
                labelText: 'Circuit name',
              )),
          Expanded(
              // width: 600.0,
              child: MoonboardLayout(circuit: circuit, onTapHold: onTapHold))
        ]);
  }
}
