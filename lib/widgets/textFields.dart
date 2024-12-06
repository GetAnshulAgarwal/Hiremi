import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // For input formatters

class CustomTextField extends StatefulWidget {
  final String title;
  final String hText;
  final List<TextInputFormatter>? inputFormatters; // Input formatters
  final TextInputType? keyboardType; // Keyboard type
  final String? Function(String?)? validator; // Validator function
  final TextEditingController? controller; // Optional controller

  const CustomTextField({
    Key? key,
    required this.title,
    required this.hText,
    this.inputFormatters,
    this.keyboardType,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isEditable = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.06),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: width * 0.04,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        SizedBox(
          width: width * 0.9,
          child: TextFormField(
            controller: widget.controller,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.inputFormatters,
            decoration: InputDecoration(
              hintText: widget.hText,
              hintStyle: GoogleFonts.poppins(
                fontSize: width * 0.03,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isEditable = true; // Enable editing
                  });
                  _focusNode.requestFocus();
                },
                child: const Icon(
                  Icons.edit_outlined,
                  color: Color(0xFF0F3CC9),
                ),
              ),
              border: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color(0xFF0F3CC9)), // Underline color
              ),
            ),
            style: GoogleFonts.poppins(
              fontSize: width * 0.04,
              color: Colors.black,
            ),
            validator: widget.validator, // Add validation support
          ),
        ),
      ],
    );
  }
}
