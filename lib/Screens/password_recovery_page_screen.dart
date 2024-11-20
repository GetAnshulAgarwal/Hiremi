import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'otpScreen.dart'; // Import the OTP screen

import '../colors.dart';

class PasswordRecoveryPageScreen extends StatefulWidget {
  const PasswordRecoveryPageScreen({super.key});

  @override
  _PasswordRecoveryPageScreenState createState() =>
      _PasswordRecoveryPageScreenState();

  static const String emailHint = "youremail@gmail.com";
}

class _PasswordRecoveryPageScreenState
    extends State<PasswordRecoveryPageScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = true;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Helper function for responsive text size
    double responsiveFontSize(double baseFontSize) {
      return baseFontSize * screenWidth / 375;
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: screenHeight * 0.05),

              // App Logo
              const AppLogo(),

              SizedBox(height: screenHeight * 0.03),

              // Forget Password Text
              Text(
                "Forget Your Password,",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: responsiveFontSize(22),
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
                  fontSize: responsiveFontSize(22),
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: AppColors.textColor,
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Illustration Image
              _illustrationImage(screenWidth),

              SizedBox(height: screenHeight * 0.03),

              // Email Input Label and Field
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Enter Email Address",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          TextSpan(
                            text: "*",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      hintText: PasswordRecoveryPageScreen.emailHint,
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        color: AppColors.primaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.textFieldBorderColor,
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email cannot be empty';
                      }
                      const pattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      if (!RegExp(pattern).hasMatch(value)) {
                        return 'Invalid email format';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Instruction Text
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: responsiveFontSize(12),
                      color: AppColors.secondaryTextColor,
                    ),
                    children: [
                      const TextSpan(
                          text: "Enter your email address to receive a "),
                      TextSpan(
                        text: "verification code",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            debugPrint("Verification code clicked");
                          },
                      ),
                      const TextSpan(text: " in your mailbox."),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Send OTP Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _sendOtp(context); // Pass context to navigate
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    minimumSize: Size(double.infinity, screenHeight * 0.07),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Send OTP",
                    style: TextStyle(
                      color: AppColors.buttonTextColor,
                      fontSize: responsiveFontSize(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.08),
            ],
          ),
        ),
      ),
    );
  }

  void _sendOtp(BuildContext context) {
    // Disable the button while processing
    setState(() {
      _isButtonEnabled = false;
    });

    Future.delayed(const Duration(seconds: 0), () {
      setState(() {
        _isButtonEnabled = true;
      });

      // Navigate to OTP screen after sending OTP
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OTPVerificationScreen(),
        ),
      );
    });

    debugPrint("OTP sent to ${_emailController.text}");
  }

  Widget _illustrationImage(double screenWidth) {
    return Center(
      child: Image.asset(
        'assets/images/illustration.png',
        width: screenWidth * 0.8,
        height: screenWidth * 0.8,
        fit: BoxFit.contain,
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Image.asset(
      'assets/images/hireme.png',
      width: screenWidth * 0.16,
      height: screenWidth * 0.07,
    );
  }
}
