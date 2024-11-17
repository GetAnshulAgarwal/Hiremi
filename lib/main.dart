import 'package:flutter/material.dart';
import 'package:hiremi/Screens/password_recovery_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      title: 'Password Recovery',
      theme: ThemeData(
        primaryColor: Colors.red, // Set the app's primary color
        scaffoldBackgroundColor: Colors.white, // App background color
      ),
      home:
          PasswordRecoveryPageScreen(), // Set the PasswordRecoveryPage as the initial screen
    );
  }
}
