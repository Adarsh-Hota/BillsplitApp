import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some_app/widgets/valuebox.dart';

class ResultPage extends StatefulWidget {
  //variable for storing the friends value
  final double friends;
  //variable for storing the tax value
  final String tax;
  //variable for storing the tip value
  final double tip;
  //variable for storing the total value
  final String bill;

  //Constructor
  const ResultPage(
      {Key? key,
      required this.friends,
      required this.tax,
      required this.tip,
      required this.bill})
      : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  //variable for storing the finalAmount
  String finalAmount = '';

  @override
  void initState() {
    super.initState();
    calculateAmount();
  }

  //function for calculating the finalAmount value
  void calculateAmount() {
    double taxAmount =
        double.parse(widget.bill) * (double.parse(widget.tax) / 100);
    double finalBill =
        (double.parse(widget.bill) + taxAmount + widget.tip) / widget.friends;
    setState(() {
      finalAmount = finalBill.toStringAsFixed(2);
    });
  }

  //function for returning the style for Text widget
  TextStyle fontStyle(
      {double size = 22,
      Color color = Colors.white,
      FontWeight weight = FontWeight.w600}) {
    return GoogleFonts.raleway(
        fontSize: size, color: color, fontWeight: weight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Result'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Everyone should pay \$$finalAmount",
                style: fontStyle(size: 22, color: Colors.black),
              ),
              ValueBox(
                  friends: widget.friends,
                  tax: widget.tax,
                  tip: widget.tip,
                  finalAmount: finalAmount),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Calculate Again ?'))
            ],
          ),
        ));
  }
}
