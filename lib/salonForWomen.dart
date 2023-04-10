import 'package:flutter/material.dart';

class SalonForWomen extends StatefulWidget {
  final int type;
  const SalonForWomen({super.key, required this.type});

  @override
  State<SalonForWomen> createState() => _SalonForWomenState();
}

class _SalonForWomenState extends State<SalonForWomen> {
  String? text;

  getText() {
    print(widget.type);
    switch (widget.type) {
      case 0:
        text = 'assets/frame1.png';
        break;
      case 1:
        text = 'assets/frame2.png';
        break;
      case 2:
        text = 'assets/frame4.png';
        break;
      case 3:
        text = 'assets/2.png';
        break;

      default:
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(getText())),
        ),
      ),
    );
  }
}
