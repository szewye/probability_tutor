import 'package:flutter/material.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_template.dart';

class Monty_Hall_Play_Home extends StatelessWidget {
  Monty_Hall_Play_Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Monty_Hall_Template(
          // content: Column(
          //   children: [Text("")],
          // ),
          instruction: "Select a door to start the game!");
    });
  }
}
