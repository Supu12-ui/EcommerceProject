import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/homepage.dart';

class allowAccess extends StatefulWidget {
  const allowAccess({super.key});

  @override
  State<allowAccess> createState() => _allowAccessState();
}

class _allowAccessState extends State<allowAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
                child: Image.asset(
                  "assets/logo.jpeg",
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              ' Hi, nice to meet you!',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Center(
              child: Text(
            'See services around',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                child: Image.asset(
                  "assets/allow_access.png",
                ),
              ),
            ],
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color.fromARGB(255, 4, 69, 122)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.location_city,
                  color: Colors.white,
                ),
                SizedBox(width: 16),
                Container(
                    height: 40.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 4, 69, 122),
                          elevation: 2,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        },
                        child: Text(
                          'Your Current Location',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
                        ))),
              ]),
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 18,
                ),
                SizedBox(width: 16),
                Text(
                  'Some other location',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Colors.grey[800]),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
