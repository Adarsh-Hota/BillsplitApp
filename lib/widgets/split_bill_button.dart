import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some_app/resultpage/resultpage.dart';

class SplitBillButton extends StatelessWidget {
  //variable for storing slider value
  final double friends;
  //variable for storing tip value
  final double tip;
  //variable for storing tax value
  final String tax;
  //variable for storing bill value
  final String bill;

  const SplitBillButton(
      {Key? key,
      required this.friends,
      required this.tax,
      required this.tip,
      required this.bill})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultPage(
                      friends: friends, tax: tax, tip: tip, bill: bill)));
        },
        child: Center(
          child: Text("Split Bill",
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700)),
        ));
  }
}
