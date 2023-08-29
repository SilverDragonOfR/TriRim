import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {

  String textLeft;
  String textRight;
  double fontsizeLeft;
  double fontsizeRight;

  Textbox({required this.textLeft, required this.textRight, required this.fontsizeLeft, required this.fontsizeRight});

  @override
  Widget build(BuildContext context) {
    return Row (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(textLeft, style: TextStyle(fontSize: fontsizeLeft),),
          Text(textRight, style: TextStyle(fontSize: fontsizeRight, fontWeight: FontWeight.bold),)
        ],
    );
  }
}