import 'package:flutter/material.dart';
import '../Screens/helpsupport_screen.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
    title: Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: MediaQuery.of(context).size.width * 0.042,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpAndSupport(),
                )),
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ],
  );
}
