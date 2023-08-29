import 'package:flutter/material.dart';

class ChangeButton extends StatelessWidget {
  final String? buttonText;
  final buttonIcon;
  final handler;

  ChangeButton({this.buttonText, this.buttonIcon, this.handler});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: handler,
      icon: Icon(buttonIcon, color: Colors.black,),
      label: Text(buttonText!, style: TextStyle(color: Colors.black),),
    );
  }
}