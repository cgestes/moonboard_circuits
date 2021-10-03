import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mb_circuits/circuit.dart';

class CircuitListener extends StatefulWidget {
  final List<String>? keys;
  final Widget Function(BuildContext, Box<Circuit>) builder;

  const CircuitListener({required this.builder, this.keys, Key? key})
      : super(key: key);

  @override
  _CircuitListenerState createState() => _CircuitListenerState();
}

class _CircuitListenerState extends State<CircuitListener> {
  Box<Circuit>? db;

  @override
  void initState() {
    super.initState();
    db = Hive.box<Circuit>("circuits");
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: db!.listenable(keys: widget.keys),
        builder: (context, Box<Circuit> box, _) =>
            widget.builder(context, box));
  }
}
