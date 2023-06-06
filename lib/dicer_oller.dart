import 'package:flutter/material.dart';
import "dart:math";

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    return _diceRollerState();
  }
}

class _diceRollerState extends State<DiceRoller> {
  var activeDiceImage = "assets/images/dice-2.png";

  void rollDice() {
    var diceRoll = Random().nextInt(6) + 1;
    setState(() {
      activeDiceImage = "assets/images/dice-$diceRoll.png";
    });
  }

  @override
  build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 250,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
              backgroundColor: Colors.black12,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 18)),
          child: const Text("roll dice"),
        ),
      ],
    );
  }
}
