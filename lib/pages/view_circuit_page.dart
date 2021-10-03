import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mb_circuits/circuit.dart';
import 'package:mb_circuits/components/circuit_listener.dart';
import 'package:mb_circuits/components/moonboard_layout.dart';

class ViewMoonboard extends StatelessWidget {
  final String uid;
  final String boardVersion;

  const ViewMoonboard({required this.boardVersion, required this.uid, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MoonboardLayout(circuit: <int>[], onTapHold: (_) => null);
    return CircuitListener(builder: (context, Box<Circuit> box) {
      Circuit? circuit;
      for (int i = 0; i < box.length; i++) {
        final c = box.getAt(i);
        if (c != null && c.uid == uid) {
          circuit = c;
          break;
        }
      }

      if (circuit == null) {
        return MoonboardLayout(circuit: <int>[], onTapHold: (_) => null);
      }

      return MoonboardLayout(circuit: circuit.circuit, onTapHold: (_) => null);
    });
  }
}

class ViewCircuitsPage extends StatelessWidget {
  final String boardVersion;
  final String uid;

  const ViewCircuitsPage(
      {@PathParam('boardVersion') required this.boardVersion,
      @PathParam('uid') required this.uid,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("board: ${boardVersion}, ${uid}");
    return Scaffold(
        appBar: AppBar(title: const Text("Circuit: ")),
        body: ViewMoonboard(boardVersion: boardVersion, uid: uid));
  }
}
