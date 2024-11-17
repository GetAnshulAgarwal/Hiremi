import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import for TapGestureRecognizer
import '../colors.dart';

class PasswordRecoveryPageScreen extends StatefulWidget {
  @override
  _PasswordRecoveryPageScreenState createState() =>
      _PasswordRecoveryPageScreenState();
}

class _PasswordRecoveryPageScreenState
    extends State<PasswordRecoveryPageScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isEmailValid = true; // Track email validity

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 32),

            // Hiremi Logo Image (centered at top)
            Center(
              child: Image.asset(
                'assets/images/hireme.png',
                width: 124.61,
                height: 56,
              ),
            ),

            SizedBox(height: 20),

            // Forget Password Text
            Text(
              "Forget Your Password,",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: AppColors.textColor,
              ),
            ),
            Text(
              "No worries, it happens!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: AppColors.textColor,
              ),
            ),

            SizedBox(height: 20),

            // Illustration Image
            Center(
              child: Image.asset(
                'assets/images/illustration.png',
                width: 380,
                height: 380,
              ),
            ),

            SizedBox(height: 2),

            Text(
              "Enter Email Address*",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: AppColors.textColor,
              ),
            ),

            // Email Input Field (TextFormField for validation)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors
                        .textFieldFillColor, // Keeps fill color the same
                    hintText: "youremail@gmail.com",
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.textColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _isEmailValid
                            ? AppColors.textFieldBorderColor
                            : Colors.red, // Only change border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _isEmailValid = false; // Set email as invalid
                      });
                      return 'Invalid email or empty';
                    }
                    // Regular expression for basic email validation
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regExp = RegExp(pattern);
                    if (!regExp.hasMatch(value)) {
                      setState(() {
                        _isEmailValid = false; // Set email as invalid
                      });
                      return 'Invalid email or empty';
                    }
                    setState(() {
                      _isEmailValid = true; // Set email as valid
                    });
                    return null;
                  },
                ),
              ),
            ),

            SizedBox(height: 10),

            // Instruction Text with clickable "verification code"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: AppColors.secondaryTextColor,
                  ),
                  children: [
                    TextSpan(
                      text: "Enter your email address to receive a ",
                    ),
                    TextSpan(
                      text: "verification code",
                      style: TextStyle(
                        color: Colors.blue, // Blue color for clickable text
                        fontWeight: FontWeight.bold,
                        decoration:
                            TextDecoration.underline, // Optional underline
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle the click event for the "verification code" text
                          print("Verification code clicked");
                        },
                    ),
                    TextSpan(
                      text: " in your mailbox.",
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Send OTP Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Proceed with OTP sending
                    // Handle OTP send action here
                  } else {
                    // Show error if form is invalid
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Send OTP",
                  style: TextStyle(
                    color: AppColors.buttonTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
