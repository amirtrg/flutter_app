import 'package:flutter/material.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery({super.key, required this.summeryData});

  final List<Map<String, Object>> summeryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summeryData
              .map((data) => Row(
                    children: [
                      Text(
                        style: TextStyle(
                            color: data['user_answer'] == data['answer']
                                ? Colors.green
                                : Colors.red),
                        ((data['question_index'] as int) + 1).toString(),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(color: Colors.white60),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(
                              data['user_answer'] as String,
                              style: TextStyle(
                                  color: data['user_answer'] == data['answer']
                                      ? Colors.green
                                      : Colors.red),
                            ),
                            Text(
                              data['answer'] as String,
                              style: const TextStyle(color: Colors.green),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}
