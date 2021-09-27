import 'package:flutter/material.dart';

class descriptions extends StatelessWidget {
  const descriptions({Key? key,required this.text, required this.size, required this.color}) : super(key: key);

  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      fontSize: size,
      fontFamily: "Roboto",
      color: color
    ),);
  }
}
