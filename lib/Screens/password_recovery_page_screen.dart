import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

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
              const SizedBox(height: 32),

              // App Logo
              const AppLogo(),

              const SizedBox(height: 20),

              // Forget Password Text
              const Text(
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

              // Email Input Label and Field
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Enter Email Address*",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.textFieldFillColor,
                      hintText: PasswordRecoveryPageScreen.emailHint,
                      prefixIcon: const Icon(
                        Icons.account_circle, // Email Ico
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
                      : null,
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
      ),
    );
  }

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

  Widget _illustrationImage() {
    return Center(
      child: Image.asset(
        'assets/images/illustration.png',
        width: 350,
        height: 350,
        fit: BoxFit.contain,
      ),
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/hireme.png',
      width: 60.08,
      height: 27,
    );
  }
}
