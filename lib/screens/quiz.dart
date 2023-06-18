import 'package:flutter/material.dart';
//
import 'package:quiz/screens/questions_screen.dart';
import 'package:quiz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  String activeScreen = "start_screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question_screen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);
    print(activeScreen + '==>>');

    if (activeScreen == "question_screen") {
      screenWidget = const QuestionScreen();
      print(activeScreen + '==>>1');
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 173, 42, 206),
                Color.fromARGB(255, 65, 7, 64)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
