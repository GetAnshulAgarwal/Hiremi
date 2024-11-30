import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:hireme/Screens/settings_screen.dart';
=======
import 'package:hiremi/Screens/password_recovery_page_screen.dart';
>>>>>>> 5ab99a3666819a5e9fb703eb44f915f369c7de0d

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

<<<<<<< HEAD
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SettingsScreen(
        userName: 'Anshul',
        isVerified: false,
      ),
=======
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
>>>>>>> 5ab99a3666819a5e9fb703eb44f915f369c7de0d
    );
  }
}
