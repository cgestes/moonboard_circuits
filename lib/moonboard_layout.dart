import 'package:flutter/material.dart';

const mbColor = Color(0xFFEEE050);

List<int> getHolds(List<int> circuit, int index) {
  var res = <int>[];
  for (var i = 0; i < circuit.length; i++) {
    if (circuit[i] == index) {
      res.add(i);
    }
  }
  return res;
}

// String generateId(List<int> circuit, int index) {
//   var res = <String>[];
//   for (var i = 0; i < circuit.length; i++) {
//     if (circuit[i] == index) {
//       if (i >= 2) res.add((i - 1).toString());
//     }
//   }
//   return res.join(" ");
// }
String holdId(int index) {
  if (index < 2) return "S${index + 1}";
  return "${index - 1}";
}

class MoonboardHold extends StatelessWidget {
  final List<int> circuit;
  final int index;

  const MoonboardHold({required this.circuit, required this.index, Key? key})
      : super(key: key);

  Widget text(int index) {
    return Text(
      holdId(index),
      style: TextStyle(
          color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
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
            padding: EdgeInsets.all(4),
            color: Colors.blue[800]?.withOpacity(0.7),
            child: Wrap(
                spacing: 4, children: holds.map((i) => text(i)).toList())));
  }
}

const offset = 44.0;

class MoonboardHolds extends StatelessWidget {
  final List<int> circuit;

  const MoonboardHolds({required this.circuit, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(90, 78 + offset, 48, 10 + offset),
        child: GridView.count(
            crossAxisCount: 11,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            children: List.generate(12 * 11, (index) {
              return MoonboardHold(circuit: circuit, index: index);
            })));
  }
}

class MoonboardButtons extends StatelessWidget {
  final List<int> circuit;
  final void Function(int) onTapHold;

  const MoonboardButtons(
      {required this.circuit, required this.onTapHold, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(90, 78, 48, 10),
        child: GridView.count(
            crossAxisCount: 11,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            children: List.generate(12 * 11, (index) {
              return Material(
                type: MaterialType.transparency,
                child: InkWell(
                  onTap: () => onTapHold(index),
                  // child: Material(,
                ),
              );
            })));
  }
}

class MoonboardLayout extends StatefulWidget {
  MoonboardLayout({Key? key}) : super(key: key);

  final List<int> circuit = [21, 21, 23, 45];

  @override
  _MoonboardLayoutState createState() => _MoonboardLayoutState();
}

class _MoonboardLayoutState extends State<MoonboardLayout> {
  void onTapHold(index) {
    setState(() {
      widget.circuit.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InteractiveViewer(
            panEnabled: true,
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 0.5,
            maxScale: 2,
            child: Stack(children: [
              Image.asset(
                'assets/mini_2020.png',
                // width: 200,
                // height: 200,
                fit: BoxFit.cover,
              ),
              MoonboardHolds(circuit: widget.circuit),
              MoonboardButtons(circuit: widget.circuit, onTapHold: onTapHold),
            ])));
  }
}
