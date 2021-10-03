import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mb_circuits/circuit.dart';
import 'package:mb_circuits/components/circuit_listener.dart';

class CircuitItem extends StatelessWidget {
  final Circuit circuit;
  const CircuitItem({required this.circuit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(circuit.name),
      subtitle: Text(circuit.uid),
      onTap: () => AutoRouter.of(context)
          .pushNamed("/${circuit.boardVersion}/${circuit.uid}"),
      trailing: const Icon(Icons.perm_device_information_sharp),
    );
  }
}

class MoonboardCircuits extends StatelessWidget {
  final String boardVersion;

  const MoonboardCircuits({required this.boardVersion, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircuitListener(builder: (context, Box<Circuit> box) {
      return ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, listIndex) {
          final circuit = box.getAt(listIndex);
          if (circuit == null) return const SizedBox();
          return CircuitItem(circuit: circuit);
        },
      );
    });
  }
}

class CircuitsPage extends StatelessWidget {
  const CircuitsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Moonboard circuits"), actions: <Widget>[]),
      body: const MoonboardCircuits(boardVersion: "mini2020"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).pushNamed("/mini2020/add");
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
