//import 'dart:html';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final  Color color;
   AppLargeText({Key? key,
   this.size=30,
   this.color= CupertinoColors.black,
   required this.text,
   }) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      )
    );
  }
}
