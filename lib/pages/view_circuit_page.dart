import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mb_circuits/circuit.dart';
import 'package:mb_circuits/components/circuit_listener.dart';
import 'package:mb_circuits/components/moonboard_layout.dart';

class ViewMoonboard extends StatelessWidget {
  final String uid;
  final String boardVersion;
  final Circuit? circuit;

  const ViewMoonboard(
      {required this.boardVersion,
      required this.uid,
      required this.circuit,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = circuit;
    if (c == null) {
      return MoonboardLayout(circuit: <int>[], onTapHold: (_) => null);
    }

    return MoonboardLayout(circuit: c.circuit, onTapHold: (_) => null);
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
    return CircuitListener(
        keys: [uid],
        builder: (context, Box<Circuit> box) {
          final circuit = box.get(uid);
          return Scaffold(
              appBar: AppBar(title: Text("Circuit: ${circuit?.name}")),
              body: ViewMoonboard(
                  boardVersion: boardVersion, uid: uid, circuit: circuit));
        });
  }
}
