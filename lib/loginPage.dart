import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/signup.dart';
import 'package:flutter_application_1/verifyOtpPage.dart';

import 'allowAccess.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              // Image set to background of the body
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 12 / 100),
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.asset(
                    "assets/logo.png",
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 36,
                  // constraints: BoxConstraints.tightFor(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color.fromARGB(255, 4, 69, 122)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _numberController,
                          //textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              //contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                              hintText: 'Phone Numxxber',
                              hintStyle:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              border: InputBorder.none)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 40.0,
                        width: 200.0,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 4, 69, 122),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              //////// HERE
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VerifyOtpPage(
                                      number: _numberController.text)));
                            },
                            child: Text('Log In'))),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up as',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => signup()));
                      },
                      child: Text(
                        ' Guest',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w900,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }
}
