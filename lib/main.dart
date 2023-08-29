import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tri_rim/screens/bmiScreen.dart';
import 'package:tri_rim/screens/flashcardScreen.dart';
import 'package:tri_rim/screens/homeScreen.dart';
import 'package:tri_rim/screens/rainfallScreen.dart';
import 'models/flashcardmodel.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(FlashcardModelAdapter());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
