import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.onStartQuiz, {super.key});

  final void Function() onStartQuiz;

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = Theme.of(context).colorScheme.onPrimary;
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
            icon: const Icon(Icons.arrow_right_alt),
            onPressed: onStartQuiz,
            style: OutlinedButton.styleFrom(
                // foregroundColor: Colors.white,
                elevation: 4,
                backgroundColor: buttonColor),
            label: const Text(
              "Start Quiz",
            ),
          )
        ],
      ),
    );
  }
}
