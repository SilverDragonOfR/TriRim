import 'package:flutter/material.dart';

class FlashCardView extends StatelessWidget {
  final String? text;
  final bool? isAnswer;

  FlashCardView({this.text, this.isAnswer});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: isAnswer! ? Colors.tealAccent : Colors.redAccent,
      elevation: 4,
      child: Center(
        child: Text(text!,textAlign: TextAlign.center, style: TextStyle(fontSize: 15,),),
      ),
    );
  }
}
