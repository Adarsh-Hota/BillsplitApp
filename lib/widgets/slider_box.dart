import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderBox extends StatelessWidget {
  // variable storing the value of friendsValue
  final double friendsValue;
  // variable storing the slider function
  final Function setSliderValue;

  //Constructor for SliderBox
  const SliderBox(
      {Key? key, required this.friendsValue, required this.setSliderValue})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("How many friends?",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700)),
        Slider(
          min: 0,
          max: 15,
          divisions: 15,
          value: friendsValue,
          activeColor: Colors.orange,
          inactiveColor: Colors.grey,
          onChanged: (value) {
            setSliderValue(value);
          },
        )
      ],
    );
  }
}
