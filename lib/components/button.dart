import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String txt;

  const Button({Key? key, required this.txt,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){

        },
        child: Text(txt,style: TextStyle(color: Colors.white,fontSize: 15.0),),
    style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(color: Colors.orange)
          )
        ),
      // foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
       ),
    );
  }
}
