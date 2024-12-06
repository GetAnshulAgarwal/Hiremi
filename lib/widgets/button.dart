import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget button(BuildContext context, String title, Function() onPressed) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      minimumSize: Size(width * 0.6, height * 0.05),

      backgroundColor: const Color(0xFF0F3CC9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    ),
    child: Text(title,
        style: GoogleFonts.poppins(
            fontSize: width * 0.03,
            fontWeight: FontWeight.w600,
            color: Colors.white)),
  );
}
