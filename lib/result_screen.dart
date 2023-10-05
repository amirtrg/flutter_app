import "package:flutter/material.dart";
import "package:flutter_app/data/questions.dart";
import "package:flutter_app/questions_summery.dart";

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.onReset, required this.list});
  final List<String> list;
  final void Function() onReset;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summery = [];

    for (var i = 0; i < list.length; i++) {
      summery.add({
        'question_index': i,
        'question': questions[i].text,
        "answer": questions[i].answers[0],
        "user_answer": list[i]
      });
    }

    return summery;
  }

  @override
  Widget build(BuildContext context) {
    final summeryData = getSummeryData();
    final numOfTotalQuestions = questions.length;
    final numCorrectQuestions = summeryData.where((data) {
      return data['answer'] == data['user_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            children: [
              Text(
                'you answerd $numCorrectQuestions out of $numOfTotalQuestions questions correctly!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16 * 1.618,
                ),
              ),
              const SizedBox(height: 16),
              QuestionsSummery(summeryData: summeryData),
              TextButton(
                onPressed: onReset,
                child: const Text("restart"),
              )
            ],
          ),
        ));
  }
}
