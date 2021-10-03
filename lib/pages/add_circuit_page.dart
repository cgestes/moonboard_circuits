import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mb_circuits/circuit.dart';
import 'package:mb_circuits/components/moonboard_layout.dart';

const mbColor = Color(0xFFEEE050);

class AddCircuitPage extends StatefulWidget {
  const AddCircuitPage(
      {@PathParam('boardVersion') required this.boardVersion, Key? key})
      : super(key: key);

  final String boardVersion;

  @override
  _AddCircuitPageState createState() => _AddCircuitPageState();
}

class _AddCircuitPageState extends State<AddCircuitPage> {
  final List<int> circuit = [];
  String name = "";

  void onTapHold(index) {
    setState(() {
      circuit.add(index);
    });
  }

  void onSetName(val) {
    // setState(() {
    name = val;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Moonboard circuits"), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.undo),
          tooltip: 'Undo',
          onPressed: () {
            setState(() {
              circuit.removeLast();
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.clear),
          tooltip: 'Clear',
          onPressed: () {
            setState(() {
              circuit.clear();
            });

            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Clear')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.save_alt),
          tooltip: 'Save',
          onPressed: () async {
            final db = Hive.box<Circuit>("circuits");
            final c =
                Circuit(boardVersion: "mini2020", name: name, circuit: circuit);
            await db.add(c);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Save')));
            AutoRouter.of(context).pop();
          },
        ),
        // IconButton(
        //   icon: const Icon(Icons.share),
        //   tooltip: 'Share',
        //   onPressed: () {
        //     ScaffoldMessenger.of(context)
        //         .showSnackBar(const SnackBar(content: Text('Share')));
        //   },
        // ),
      ]),
      // body: ImagePaintPage(),
      body: MoonboardLayoutWithName(
          name: name,
          onSetName: onSetName,
          circuit: circuit,
          onTapHold: onTapHold),
    );
  }
}
