import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quiz/constant/questions.dart';

Random randomize = Random();

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void onAnswer() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ...currentQuestion.getShuffledAnswerList().map(
              (item) {
                return AnswerButton(item, onAnswer);
              },
            )
          ],
        ),
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
          shape:
              const StadiumBorder(side: BorderSide(color: Colors.transparent)),
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 83, 13, 103),
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          minimumSize: const Size(200, 40),
          maximumSize: const Size(400, 80),
        ),
        onPressed: onTap,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
