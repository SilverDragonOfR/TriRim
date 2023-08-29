import 'package:flutter/material.dart';
import '../components/bmi/textbox.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {

  // State variables
  double _height = 130;
  double _weight = 65;
  double _bmi = 0;
  String _messageText = "";
  Color _messageColor = Colors.black87;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateBMI();
  }

  void decideMessage() {
    if(_bmi<18.5) {
      _messageText = "Underweight";
      _messageColor = Colors.amberAccent;
    }
    else if(_bmi<25) {
      _messageText = "Normal";
      _messageColor = Colors.green;
    }
    else if(_bmi<40) {
      _messageText = "Overweight";
      _messageColor = Colors.orangeAccent;
    }
    else {
      _messageText = "Obese";
      _messageColor = Colors.redAccent;
    }
  }

  void calculateBMI() {
    _bmi = double.parse((_weight/((_height/100)*(_height/100))).toStringAsFixed(1));
    decideMessage();
  }

  void sliderHandler(value, ) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HealthTech - BMI", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white54, //change your color here
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Textbox(textLeft: "Height: ", textRight: _height.toString()+" cm", fontsizeLeft: 20, fontsizeRight: 24),
          Slider(
            value: _height,
            min: 0,
            max: 250,
            onChanged: (height){
              setState(() {
                _height = height;
                calculateBMI();
              });
            },
            divisions: 250,
            activeColor: Colors.black87,
            inactiveColor: Colors.grey,
          ),
          SizedBox(height: 50,),
          Textbox(textLeft: "Weight: ", textRight: _weight.toString()+" kg", fontsizeLeft: 20, fontsizeRight: 24),
          Slider(
            value: _weight,
            min: 0,
            max: 250,
            onChanged: (weight){
              setState(() {
                _weight = weight;
                calculateBMI();
              });
            },
            divisions: 250,
            activeColor: Colors.black87,
            inactiveColor: Colors.grey,
          ),
          SizedBox(height: 100,),
          Textbox(textLeft: "BMI: ", textRight: _bmi.toString(), fontsizeLeft: 30, fontsizeRight: 35),
          SizedBox(height: 20,),
          Text(_messageText, style: TextStyle(fontSize: 20, color: _messageColor),),
        ],
      ),
    );
  }
}