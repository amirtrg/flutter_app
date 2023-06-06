import 'package:flutter/material.dart';
import "./dicer_oller.dart";

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

const startColor = Color.fromRGBO(70, 0, 150, 1);
const endColor = Color.fromRGBO(60, 20, 200, 1);

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.startColor, this.endColor, {super.key});

  final Color startColor;
  final Color endColor;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: startAlignment,
          end: endAlignment,
          colors: [startColor, endColor],
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}
