import 'package:flutter/material.dart';

class MoonboardLayout extends StatefulWidget {
  MoonboardLayout({Key? key}) : super(key: key);

  var circuit = [40, 21];

  @override
  _MoonboardLayoutState createState() => _MoonboardLayoutState();
}

String generateId(circuit, index) {
  var res = <String>[];
  var i = 0;
  for (var i = 0; i < circuit.length; i++) {
    if (circuit[i] == index) {
      res.add(i.toString());
    }
  }
  return "\n" + res.join(" ");
}

class _MoonboardLayoutState extends State<MoonboardLayout> {
  @override
  Widget build(BuildContext context) {
    print("Circuit: ${widget.circuit}");
    return Center(
        child: InteractiveViewer(
            panEnabled: true,
            boundaryMargin: const EdgeInsets.all(100),
            minScale: 0.5,
            maxScale: 2,
            child: Stack(children: [
              Image.asset(
                'mini_2020.png',
                // width: 200,
                // height: 200,
                fit: BoxFit.cover,
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(90, 78, 48, 10),
                  child: GridView.count(
                      crossAxisCount: 11,
                      crossAxisSpacing: 2.0,
                      mainAxisSpacing: 2.0,
                      children: List.generate(12 * 11, (index) {
                        return Center(
                          child: TextButton(
                            onPressed: () {
                              print('Received click');
                              setState(() {
                                widget.circuit.add(index);
                              });
                              print("NEW Circuit: ${widget.circuit}");
                            },
                            child: Text(
                              generateId(widget.circuit, index),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Container(
                            //   // color: Colors.pink,
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(16.0),
                            //       // color: Colors.green,
                            //       border:
                            //           Border.all(color: Colors.blueAccent)),
                            // )
                          ),
                        );
                      }))),
            ])));
  }
}
