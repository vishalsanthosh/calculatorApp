import 'package:flutter/material.dart';

class ButtonS extends StatelessWidget {
 final color;
 final textColor;
 final String buttonText;
 final buttonTapped;

 const ButtonS(
  {
    super.key,
    required this.color,
    required this.textColor,
    required this.buttonText,
    required this.buttonTapped,
  }
 );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
 onTap: buttonTapped,
 child: Container(
  alignment: Alignment.center,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: color),
  child: Text(buttonText,style: TextStyle(color: textColor,fontSize: 20),),
 ),
    );
  }
}