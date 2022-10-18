import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  const Heading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 40),
      child: Text("Split Bill",
          style: GoogleFonts.montserrat(
              fontSize: 25, fontWeight: FontWeight.w700)),
    );
  }
}