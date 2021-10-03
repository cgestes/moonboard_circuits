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

const debugLayout = false;

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

class MoonboardBackground extends StatelessWidget {
  const MoonboardBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget img = Image.asset(
      'assets/mini_2020.png',
      fit: BoxFit.fitHeight,
      width: 1018,
      height: 1089,
    );
    if (debugLayout) {
      img = Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2.0, color: const Color(0xFF434F3F))),
          child: img);
    }
    return img;
  }
}

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
          const TextField(
              decoration: InputDecoration(
            // border: OutlineInputBorder(),
            labelText: 'Circuit name',
          )),
          Expanded(
              // width: 600.0,
              child: MoonboardLayout(circuit: circuit, onTapHold: onTapHold))
        ]);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<int> circuit = [];
  String name = "";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void onTapHold(index) {
    setState(() {
      widget.circuit.add(index);
    });
  }

  void onSetName(name) {
    setState(() {
      widget.name = name;
    });
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
              widget.circuit.removeLast();
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.clear),
          tooltip: 'Clear',
          onPressed: () {
            setState(() {
              widget.circuit.clear();
            });

            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Clear')));
          },
        ),
        // IconButton(
        //   icon: const Icon(Icons.save_alt),
        //   tooltip: 'Save',
        //   onPressed: () {
        //     ScaffoldMessenger.of(context)
        //         .showSnackBar(const SnackBar(content: Text('Save')));
        //   },
        // ),
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
          name: widget.name,
          onSetName: onSetName,
          circuit: widget.circuit,
          onTapHold: onTapHold),
    );
  }
}
