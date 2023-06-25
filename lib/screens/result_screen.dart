import 'package:flutter/material.dart';
import 'package:quiz/constant/questions.dart';
import 'package:quiz/screens/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, this.reset, {super.key});

  final void Function() reset;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getResultSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswers = getResultSummary()
        .where((el) => el['correct_answer'] == el['user_answer'])
        .length;

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'you answered $correctAnswers out of ${chosenAnswers.length} questions correctly!',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
              QuestionsSummary(getResultSummary()),
              OutlinedButton.icon(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: reset,
                style: OutlinedButton.styleFrom(
                    // foregroundColor: Colors.white,
                    elevation: 4,
                    backgroundColor: buttonColor),
                label: const Text("Start Again"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    Color getColor(correctAnswer, userAnswer) {
      return correctAnswer == userAnswer
          ? const Color.fromARGB(255, 108, 255, 113)
          : const Color.fromARGB(255, 255, 168, 118);
    }

    return SingleChildScrollView(
      child: SizedBox(
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: summary.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor:
                          getColor(item['correct_answer'], item['user_answer']),
                      child: Text(
                        ((item['question_index'] as int) + 1).toString(),
                      ),
                    ),
                  ),
                  const Text(
                    ".",
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (item['question'] as String),
                          style: const TextStyle(color: Colors.white),
                          // overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        Text(item['correct_answer'] as String,
                            style: const TextStyle(color: Colors.white)),
                        Text(
                          item['user_answer'] as String,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: getColor(
                                item['correct_answer'], item['user_answer']),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
