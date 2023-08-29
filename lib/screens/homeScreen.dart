import 'package:flutter/material.dart';
import 'package:slide_action/slide_action.dart';
import 'package:tri_rim/components/home/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tri Rim - A triadic symphony", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w500),),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white54, //change your color here
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SliderToAction(sliderName: "AgriTech", code: 1),
          SliderToAction(sliderName: "HealthTech", code: 2),
          SliderToAction(sliderName: "EdTech", code: 3)
        ],
      ),
    );
  }
}
