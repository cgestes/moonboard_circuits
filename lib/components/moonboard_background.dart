import 'package:flutter/material.dart';
import 'package:mb_circuits/debug_options.dart';

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
