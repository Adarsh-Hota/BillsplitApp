import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipBox extends StatelessWidget {
  final double tip;
  final Function tipIncrement;
  final Function tipDecrement;
  const TipBox(
      {Key? key,
      required this.tip,
      required this.tipIncrement,
      required this.tipDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: [
        Text("TIP",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w700)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 40,
              height: 40,
              child: FloatingActionButton(
                  onPressed: () {
                    tipDecrement();
                  },
                  backgroundColor: Colors.grey[400],
                  child: const Icon(Icons.remove, color: Colors.black)),
            ),
            Text("\$${tip.round().toString()}",
                style: GoogleFonts.montserrat(
                    fontSize: 27,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            Container(
              width: 40,
              height: 40,
              child: FloatingActionButton(
                  onPressed: () {
                    tipIncrement();
                  },
                  backgroundColor: Colors.grey[400],
                  child: const Icon(Icons.add, color: Colors.black)),
            ),
          ],
        )
      ]),
    );
  }
}
