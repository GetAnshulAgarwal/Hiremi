import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Import for TapGestureRecognizer
import '../colors.dart'; // Ensure this file defines required colors

class PasswordRecoveryPageScreen extends StatefulWidget {
  @override
  _PasswordRecoveryPageScreenState createState() =>
      _PasswordRecoveryPageScreenState();

  // Static constants for strings
  static const String emailHint = "youremail@gmail.com";

  const PasswordRecoveryPageScreen({super.key}); // Correct usage
}

class _PasswordRecoveryPageScreenState
    extends State<PasswordRecoveryPageScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isButtonEnabled = true; // Button state

  @override
  void dispose() {
    _emailController.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

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
            const SizedBox(height: 32),

            // App Logo
            const AppLogo(),

            const SizedBox(height: 20),

            // Forget Password Text
            const Text(
              "Forget Your Password,", // Direct strings (constant-like)
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w500,
                height: 1.5,
                color: AppColors.textColor,
              ),
            ),
            const Text(
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

            const SizedBox(height: 20),

            // Illustration Image
            _illustrationImage(),

            const SizedBox(height: 20),

            // Email Input Label
            const Text(
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

            // Email Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: EmailInputField(
                formKey: _formKey,
                emailController: _emailController,
                hintText: PasswordRecoveryPageScreen.emailHint, // Fixed usage
              ),
            ),

            const SizedBox(height: 20),

            // Instruction Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
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

            const SizedBox(height: 30),

            // Send OTP Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ElevatedButton(
                onPressed: _isButtonEnabled
                    ? () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _sendOtp();
                        }
                      }
                    : null, // Disable button if invalid
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Send OTP",
                  style: TextStyle(
                    color: AppColors.buttonTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Helper to send OTP
  void _sendOtp() {
    setState(() {
      _isButtonEnabled = false;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isButtonEnabled = true;
      });
    });
    debugPrint("OTP sent to ${_emailController.text}");
  }

  // Illustration Image Widget
  Widget _illustrationImage() {
    return Center(
      child: Image.asset(
        'assets/images/illustration.png',
        width: 380,
        height: 380,
      ),
    );
  }
}

// Email Input Field with validation
class EmailInputField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final String hintText; // Passed as a parameter

  const EmailInputField({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.hintText, // Ensure proper hint text is passed
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldFillColor,
          hintText: hintText, // Use parameter for hint
          prefixIcon: const Icon(
            Icons.account_circle,
            color: AppColors.primaryColor,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.textFieldBorderColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email cannot be empty';
          }
          const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
          if (!RegExp(pattern).hasMatch(value)) {
            return 'Invalid email format';
          }
          return null;
        },
      ),
    );
  }
}

// App Logo Widget
class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/hireme.png',
        width: 124.61,
        height: 56,
      ),
    );
  }
}
