import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/verifyOtpPage.dart';

import 'loginPage.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        // appbat sets the title of the app

        // Decoratedbox which takes the
        // decoration and child property
        body: Container(

            // BoxDecoration takes the image
            decoration: const BoxDecoration(
              // Image set to background of the body
              image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 12 / 100),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Image.asset(
                      "assets/logo.jpeg",
                    ),
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
                            //textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                hintText: 'Name',
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                border: InputBorder.none)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
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
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                border: InputBorder.none)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
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
                            //textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                border: InputBorder.none)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
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
                            //textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                //contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Colors.white),
                                border: InputBorder.none)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 40.0,
                          width: 200.0,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 4, 69, 122),
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
                              child: Text('Sign Up'))),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                    Text("OR"),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 15.0, right: 10.0),
                          child: Divider(
                            color: Colors.black,
                            height: 50,
                          )),
                    ),
                  ]),
                  // SizedBox(
                  //   height: ,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I have an account! ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: Text(
                          ' Log In',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                      child: Text(
                    'Terms & Conditions',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )),
                ],
              ),
            )));
  }
}
