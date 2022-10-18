import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalBox extends StatelessWidget {
  // variable storing the value of bill
  final String bill;
  // variable storing the value of friendsValue
  final double friendsValue;
  // variable storing the value of tax
  final String tax;
  // variable storing the value of tip
  final double tip;

  //Constructor for TotalBox widget
  const TotalBox({
    Key? key,
    required this.bill,
    required this.friendsValue,
    required this.tax,
    required this.tip,
  }) : super(key: key);

  TextStyle fontStyle(
      {double size = 22,
      Color color = Colors.white,
      FontWeight weight = FontWeight.w600}) {
    return GoogleFonts.raleway(
        fontSize: size, color: color, fontWeight: weight);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Total", style: fontStyle(size: 30)),
                Text(bill, style: fontStyle()),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Friends", style: fontStyle()),
                    const Spacer(),
                    Text("Tax", style: fontStyle()),
                    const Spacer(),
                    Text("Tip", style: fontStyle()),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(friendsValue.round().toString(), style: fontStyle()),
                    const Spacer(),
                    Text("$tax%", style: fontStyle()),
                    const Spacer(),
                    Text("\$${tip.round().toString()}", style: fontStyle()),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
