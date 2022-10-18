import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaxBox extends StatelessWidget {
  //variable for storing tax value
  final String tax;
  //variable for storing function that sets tax value
  final Function setTaxValue;

  //Constructor
  const TaxBox({Key? key, required this.tax, required this.setTaxValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 3,
        height: 70,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: "Tax in %",
                labelStyle: GoogleFonts.montserrat(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            onChanged: (value) {
              setTaxValue(value);
            },
          ),
        )
      );
  }
}
