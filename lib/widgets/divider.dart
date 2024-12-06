import 'package:flutter/material.dart';

@override
Widget horizontalLine(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    width: width * 0.9,
    child: Row(
      children: [
        // Starting circle
        Container(
          width: width * 0.01,
          height: height * 0.01,
          decoration: BoxDecoration(
            color: Color(0xFF0F3CC9), // Circle color
            shape: BoxShape.circle,
          ),
        ),
        // Horizontal line
        Expanded(
          child: Container(
            height: height * 0.001, // Thickness of the line
            color: Color(0xFF0F3CC9),
          ),
        ),
        // Ending circle
        Container(
          width: width * 0.01, // Diameter of the circle
          height: height * 0.01,
          decoration: BoxDecoration(
            color: Color(0xFF0F3CC9), // Circle color
            shape: BoxShape.circle,
          ),
        ),
      ],
    ),
  );
}
