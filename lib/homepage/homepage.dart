import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some_app/homepage/total_box.dart';
import 'package:some_app/homepage/slider_box.dart';
import 'package:some_app/homepage/tip_box.dart';
import 'package:some_app/homepage/tax_box.dart';
import 'package:some_app/homepage/keyboard_pad.dart';
import 'package:some_app/resultpage/resultpage.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({Key? key}) : super(key: key);

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  //variable for storing slider value
  double friendsValue = 0.0;
  //variable for storing tip value
  double tip = 0.0;
  //variable for storing tax value
  String tax = '0';
  //variable for storing bill value
  String bill = '';

  //function for setting the value of Slider
  void setSliderValue(value) {
    setState(() {
      friendsValue = value;
    });
  }

  //function for increasing the tip
  void tipIncrement() {
    setState(() {
      tip++;
    });
  }

  //function for decreasing the tip
  void tipDecrement() {
    setState(() {
      tip--;
    });
  }

  //function for setting tax value
  void setTaxValue(value) {
    setState(() {
      tax = value;
    });
  }

  //function for navigating to result page
  void navigateToResultPage(BuildContext context, double friendsValue, String tax, double tip, String bill) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            ResultPage(friends: friendsValue, tax: tax, tip: tip, bill: bill)));
  }

  //function for building buttons
  buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
          onPressed: () {
            if (text == '-') {
              setState(() {
                bill = '';
              });
            } else {
              setState(() {
                bill += text;
              });
            }
          },
          style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(20)),
          child: Text(text,
              style: GoogleFonts.montserrat(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w700))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TotalBox(
              bill: bill,
              friendsValue: friendsValue,
              tax: tax,
              tip: tip,
            ),
            const SizedBox(
              height: 15,
            ),
            SliderBox(
                friendsValue: friendsValue, setSliderValue: setSliderValue),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              TipBox(
                  tip: tip,
                  tipIncrement: tipIncrement,
                  tipDecrement: tipDecrement),
              const SizedBox(width: 10),
              TaxBox(tax: tax, setTaxValue: setTaxValue),
            ]),
            const SizedBox(
              height: 10,
            ),
            KeyboardPad(buildButton: buildButton),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  navigateToResultPage(context, friendsValue, tax, tip, bill);
                },
                child: Center(
                  child: Text("Split Bill",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ))
          ],
        ),
      ),
    ));
  }
}
