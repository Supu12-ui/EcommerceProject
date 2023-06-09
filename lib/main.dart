import 'package:flutter/material.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/verifyOtpPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          child: signup(),
        ));
  }
}
