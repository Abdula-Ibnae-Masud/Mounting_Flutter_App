import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLargeText extends StatelessWidget {
  double size;
  final String text;     // First page large text details
  final Color color;
  AppLargeText({ Key? key, 
  this.size = 20,
  required this.text, 
  this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
        //backgroundColor: Colors.white
      ),
    );
  }
}


