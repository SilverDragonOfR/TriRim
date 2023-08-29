import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';
import 'package:tri_rim/screens/bmiScreen.dart';
import 'package:tri_rim/screens/flashcardScreen.dart';
import 'package:tri_rim/screens/rainfallScreen.dart';

class SliderToAction extends StatelessWidget {

  String sliderName = "";
  int code = 0;

  SliderToAction({required this.sliderName, required this.code});

  void goToApp(context, code) {
    var newScreen;
    if(code==1) newScreen = RainfallScreen();
    else if(code==2) newScreen = BmiScreen();
    else if(code==3) newScreen = FlashcardScreen();

    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => newScreen));

      Navigator.push(
        context,
        PageRouteBuilder(
          transitionsBuilder:
              (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return newScreen;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: SlideAction(
        trackBuilder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Center(
              child: Text(
                  sliderName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
        thumbBuilder: (context, state) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Center(
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ),
          );
        },
        action: () {
          goToApp(context,code);
        },
      ),
    );
  }
}
