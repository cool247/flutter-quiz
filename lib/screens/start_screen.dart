import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onStartQuiz, {super.key});

  final void Function() onStartQuiz;

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Theme.of(context).colorScheme.primary;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: buttonColor,
            width: 280,
          ),
          const SizedBox(height: 80),
          const Text(
            "Learn Flutter Fun way!",
            style: TextStyle(
              fontSize: 24,
              // color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: onStartQuiz,
            style: OutlinedButton.styleFrom(
              elevation: 1.0,
              shape: const StadiumBorder(side: BorderSide()),
              side: const BorderSide(
                width: 2,
                strokeAlign: 3.0,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              "Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
