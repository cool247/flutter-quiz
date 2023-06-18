import 'package:flutter/material.dart';

const Color buttonColor = Color.fromARGB(255, 253, 255, 188);

class StartScreen extends StatelessWidget {
  const StartScreen(this.onStartQuiz, {super.key});

  final void Function() onStartQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            color: const Color.fromARGB(150, 255, 255, 255),
            width: 280,
          ),
          const SizedBox(height: 80),
          const Text(
            "Learn Flutter Fun way!",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: onStartQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              elevation: 1.0,
              shape: const StadiumBorder(side: BorderSide()),
              side: const BorderSide(
                width: 2,
                color: buttonColor,
                strokeAlign: 3.0,
              ),
              backgroundColor: buttonColor,
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
