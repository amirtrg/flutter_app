import 'package:flutter/material.dart';
import 'package:flutter_app/data/questions.dart';
import 'package:flutter_app/start_screen.dart';
import "package:flutter_app/questions_screen.dart";
import "package:flutter_app/result_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = "start-screen";
  List<String> selectedList = [];

  void switchScreen() {
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer) {
    selectedList.add(answer);
    if (selectedList.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void backToStart() {
    setState(() {
      selectedList = [];
      activeScreen = "start-screen";
    });
  }

  @override
  Widget build(context) {
    var screenWidget = activeScreen == "start-screen"
        ? StartScreen(switchScreen)
        : activeScreen == "result-screen"
            ? ResultScreen(onReset: backToStart, list: selectedList)
            : QuestionsScreen(onChooseAnswer: chooseAnswer);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        drawer: activeScreen != "start-screen"
            ? Drawer(
                backgroundColor: Colors.black26,
                child: Container(
                    padding: const EdgeInsets.all(80),
                    child: Column(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white24),
                          onPressed: backToStart,
                          child: const Text(
                            "hello",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              )
            : null,
        appBar: activeScreen != "start-screen"
            ? AppBar(
                backgroundColor: Colors.black26,
              )
            : null,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 9, 22, 38),
                Color.fromARGB(255, 2, 32, 70),
                Color.fromARGB(255, 132, 0, 155),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
