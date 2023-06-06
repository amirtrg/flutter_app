import 'package:flutter/material.dart';
import './gradient_container.dart';

const startColor = Color.fromRGBO(70, 0, 150, 1);
const endColor = Color.fromRGBO(60, 20, 200, 1);
void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(body: GradientContainer(startColor, endColor)),
    ),
  );
}
