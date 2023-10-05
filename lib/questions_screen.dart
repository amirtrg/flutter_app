import 'package:flutter/material.dart';

import "package:flutter_app/answer_button.dart";

import 'package:flutter_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onChooseAnswer});

  final void Function(String answer) onChooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      if (currentQuestionIndex == questions.length) {
      } else {
        currentQuestionIndex++;
        widget.onChooseAnswer(answer);
      }
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentQuestion.text,
                style: const TextStyle(color: Colors.white54, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...currentQuestion
                  .getShuffledAnswers()
                  .map((item) => AnswerButton(
                      answerText: item,
                      onTab: () {
                        answerQuestion(item);
                      }))
            ],
          )),
    );
  }
}
