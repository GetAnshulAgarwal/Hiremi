import 'package:flutter/material.dart';

// Reusable Section Title Widget with customizable style
class SectionTitle extends StatelessWidget {
  final String title;
  final double screenWidth;
  final TextStyle textStyle;

  const SectionTitle({
    super.key,
    required this.title,
    required this.screenWidth,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.001), // Reduced vertical padding
      child: Text(
        title,
        style: textStyle,
      ),
    );
  }
}
