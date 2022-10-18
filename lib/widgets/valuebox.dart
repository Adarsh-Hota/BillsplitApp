import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValueBox extends StatelessWidget {
  //variable for storing the friends value
  final double friends;
  //variable for storing the tax value
  final String tax;
  //variable for storing the tip value
  final double tip;
  //variable for storing the finalAmount value
  final String finalAmount;

  const ValueBox(
      {Key? key,
      required this.friends,
      required this.tax,
      required this.tip,
      required this.finalAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //function for returning the style for Text widget
    TextStyle fontStyle(
        {double size = 22,
        Color color = Colors.white,
        FontWeight weight = FontWeight.w600}) {
      return GoogleFonts.raleway(
          fontSize: size, color: color, fontWeight: weight);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          gradient: const LinearGradient(
            colors: [
              Colors.purple,
              Colors.deepPurple,
            ],
          )),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Equally Divided", style: fontStyle(size: 20)),
                  Text("\$$finalAmount", style: fontStyle()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Friends", style: fontStyle()),
                  Text("Tax", style: fontStyle()),
                  Text("Tip", style: fontStyle()),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  friends.round().toString(),
                  style: fontStyle(),
                ),
                Text(
                  "$tax%",
                  style: fontStyle(),
                ),
                Text(
                  "\$${tip.round().toString()}",
                  style: fontStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    
  }
}
