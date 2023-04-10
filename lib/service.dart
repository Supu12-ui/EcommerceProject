import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // BoxDecoration takes the image
      decoration: const BoxDecoration(
        // Image set to background of the body
        image: DecorationImage(
            image: AssetImage("assets/frame1.png"), fit: BoxFit.cover),
      ),
    ));
    ;
  }
}
