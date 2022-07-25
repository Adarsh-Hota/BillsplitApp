import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeyboardPad extends StatelessWidget {
  //variable for storing function
  final Function buildButton;

  //Constructor
  const KeyboardPad({Key? key, required this.buildButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            buildButton("1"),
            buildButton("2"),
            buildButton("3"),
          ],
        ),
        Row(
          children: [
            buildButton("4"),
            buildButton("5"),
            buildButton("6"),
          ],
        ),
        Row(
          children: [
            buildButton("7"),
            buildButton("8"),
            buildButton("9"),
          ],
        ),
        Row(
          children: [
            buildButton("."),
            buildButton("0"),
            buildButton("-"),
          ],
        ),
      ],
    );
  }
}
