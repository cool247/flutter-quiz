import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/constant/questions.dart';
//
import 'package:quiz/screens/questions_screen.dart';
import 'package:quiz/screens/result_screen.dart';
import 'package:quiz/screens/start_screen.dart';
import 'package:quiz/theme/color_schemes.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  late Future googleFontsPending;
  //
  String activeScreen = "start_screen";
  List<String> answeredQuestions = [];

  @override
  void initState() {
    super.initState();

    googleFontsPending = GoogleFonts.pendingFonts([
      GoogleFonts.ptMono(),
      GoogleFonts.comicNeue(),
    ]);
  }

  void onChooseAnswer(String answer) {
    answeredQuestions.add(answer);
    if (answeredQuestions.length == questions.length) {
      // answeredQuestions = [];
      setState(() {
        activeScreen = "result_screen";
      });
    }
  }

  void onStartQuiz() {
    setState(() {
      activeScreen = "question_screen";
    });
  }

  void onRestartScreen() {
    setState(() {
      activeScreen = "start_screen";
      answeredQuestions = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = QuestionScreen(onChooseAnswer);

    if (activeScreen == "start_screen") {
      screenWidget = StartScreen(onStartQuiz);
    }
    if (activeScreen == "result_screen") {
      screenWidget = ResultScreen(answeredQuestions, onRestartScreen);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: screenWidget,
        backgroundColor:
            Theme.of(context).colorScheme.background.withOpacity(0.9),
      ),
    );
  }
}
