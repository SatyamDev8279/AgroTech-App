import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello,",
      style: GoogleFonts.caveat(
          color: Colors.white, fontSize: 60, fontWeight: FontWeight.bold),
    );
  }
}
