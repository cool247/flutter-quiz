import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/constant/questions.dart';
import 'package:quiz/model/quiz_question.dart';

Random randomize = Random();

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {
  int questionIndex = 0;

  void onAnswer() {
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            questions[questionIndex].text,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          const SizedBox(
            height: 40,
          ),
          ...questions[questionIndex].answers.map(
            (e) {
              return AnswerButton(e, onAnswer);
            },
          ).toList()
        ],
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(side: BorderSide()),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 90, 34, 173),
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          minimumSize: const Size(200, 40),
          maximumSize: const Size(200, 40),
        ),
        onPressed: onTap,
        child: Text(
          answerText,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}
