import 'package:flutter/material.dart';
import 'package:hireme/Screens/personal_details_screen(3).dart';

import 'Screens/personal_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Settings app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PersonalDetailsScreen5());
  }
}
