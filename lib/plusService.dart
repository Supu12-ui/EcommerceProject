import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PlusService extends StatefulWidget {
  const PlusService({super.key});

  @override
  State<PlusService> createState() => _PlusServiceState();
}

class _PlusServiceState extends State<PlusService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // BoxDecoration takes the image
      decoration: const BoxDecoration(
        // Image set to background of the body
        image: DecorationImage(
            image: AssetImage("assets/Plus.png"), fit: BoxFit.cover),
      ),
    ));
  }
}
