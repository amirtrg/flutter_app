import "package:flutter/material.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Image.asset(
          width: 200,
          height: 200,
          "assets/images/quiz-logo.png",
          color: Colors.white38,
        ),
        const SizedBox(height: 64),
        const Text(
          "welcome to Quzito!",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: const BorderSide(
              color: Colors.white30,
              width: 0.8,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(9),
              ),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "start",
                style: TextStyle(fontSize: 16 ),
              ),
              Icon(
                Icons.chevron_right,
                size: 18,
              )
            ],
          ),
        )
      ]),
    );
  }
}
