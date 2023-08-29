import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:hive/hive.dart';
import 'package:tri_rim/components/flashcard/changebutton.dart';
import 'package:tri_rim/components/flashcard/flashcardview.dart';
import 'dart:math';
import 'package:flutter_flushbar/flutter_flushbar.dart';

import '../models/flashcardmodel.dart';

class FlashcardScreen extends StatefulWidget {
  const FlashcardScreen({super.key});

  @override
  State<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardScreen> {

  // State variables
  var _flashcardBox;
  List Flashcards = [["Question","Answer"]];
  List _history = [];
  int _cardIndex = 0;
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  @override
  void initState() {
    myInitState();
  }

  void myInitState() async {
    _flashcardBox = await Hive.openBox<FlashcardModel>("_flashcardBox");
    await getAllFlashcards();
    _cardIndex = Random().nextInt(Flashcards.length);
    _history.add(_cardIndex);
  }

  Future getAllFlashcards() async {
    for(int i=0;i<_flashcardBox.length;i++){
      var item = await _flashcardBox.getAt(i);
      Flashcards.add(item.flashcard);
    }
  }

  Future createNewFlashcard(newCardData) async {
    await _flashcardBox.put(
        'key_${questionController.text}',
        FlashcardModel(flashcard: newCardData)
    );
  }

  void previousClickHandler() {
    setState(() {
      _cardIndex = _history[_history.length-1];
      _history.removeLast();
    });
  }

  void nextClickHandler() {
    setState(() {
      var _newCardIndex = Random().nextInt(Flashcards.length);
      while (Flashcards.length > 1 && _cardIndex==_newCardIndex) {
        _newCardIndex = Random().nextInt(Flashcards.length);
      }
      _cardIndex = _newCardIndex;
      _history.add(_cardIndex);
    });
  }

  void submit() {
    Navigator.of(context).pop([questionController.text,answerController.text]);
  }

  Future addClickHandler() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Flashcard"),
        content: SizedBox(
          height: 150,
          child: Column(
            children: [
              SizedBox(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(hintText: "Question"),
                  controller: questionController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(hintText: "Answer"),
                  controller: answerController,
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: submit,
              child: Text("Submit")
          )
        ],
      )
  );

  void showConfirmation(message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
      titleText: Text(
        message,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
        ),
      ),
      messageText: Text(""),
    ).show(context);
  }

  void FloatingActionButtonHandler() async {
    final newCardData = await addClickHandler();
    if(newCardData == null || (newCardData[0].length==0 || newCardData[1].length==0)) return;
    setState(() {
      createNewFlashcard(newCardData);
      getAllFlashcards();
      questionController.text = "";
      answerController.text = "";
    });
    showConfirmation("Added Question");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EdTech - FlashCards", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white54, //change your color here
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: FlipCard(
                front: FlashCardView(text: Flashcards[_cardIndex][0], isAnswer: false,),
                back: FlashCardView(text: Flashcards[_cardIndex][1], isAnswer: true,),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ChangeButton(buttonText: "Prev", buttonIcon: Icons.chevron_left, handler: previousClickHandler,),
                ChangeButton(buttonText: "Next", buttonIcon: Icons.chevron_right, handler: nextClickHandler,)
              ],
            )
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.black,
        onPressed: FloatingActionButtonHandler,
      ),
    );
  }
}
