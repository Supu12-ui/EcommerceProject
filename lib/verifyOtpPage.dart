import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'allowAccess.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key, required this.number});
  final String number;
  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  @override
  String otpCode = "";
  String otp = "";
  bool isLoaded = false;
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 69, 122),
        title: Text(
          "Login / SignUp",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 36, vertical: 48),
          children: [
            Column(mainAxisSize: MainAxisSize.min, children: [
              Center(
                child: Text(
                  ' Enter verification code',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400,
                      fontSize: 26),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: Text(
                  'We have sent you a 4 digit verification code on',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  widget.number,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                // shrinkWrap: true,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //mainAxisSize: MainAxisSize.min,
                //     scrollDirection: Axis.horizontal,
                children: [contttt(), contttt(), contttt(), contttt()],
              ),
              SizedBox(
                height: 150,
              ),
            ]),
            Container(
                height: 40.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 4, 69, 122),
                      elevation: 2,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => allowAccess()));
                    },
                    child: Text('Log In'))),
          ]),
    );
  }

  Widget contttt() {
    return Align(
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Center(
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
