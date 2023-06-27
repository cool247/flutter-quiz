import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
//
import 'package:flutter/material.dart';
import 'package:quiz/constant/questions.dart';

Random randomize = Random();

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(this.onSelectAnswer, {super.key});
  final void Function(String) onSelectAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionScreen();
}

class _QuestionScreen extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void onAnswer(String answeredText) {
    widget.onSelectAnswer(answeredText);

    if ((questions.length - 1) > currentQuestionIndex) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    final questionTextStyle = GoogleFonts.ptMono(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.primary,
      fontSize: 16,
    );

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
                style: questionTextStyle,
              ),
            ),
            const SizedBox(height: 20),
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
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    // final Color buttonColor = Theme.of(context).colorScheme.primary;
    final answerTextStyle = GoogleFonts.comicNeue(
      fontSize: 14,
      fontWeight: FontWeight.w900,
      letterSpacing: 1.5,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(
            side: BorderSide(),
          ),
          // foregroundColor: Colors.black87,
          // backgroundColor: buttonColor.withOpacity(0.97),
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          minimumSize: const Size(300, 40),
          // maximumSize: const Size(400, 60),
        ),
        onPressed: () {
          onTap(answerText);
        },
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: answerTextStyle,
        ),
      ),
    );
  }
}
