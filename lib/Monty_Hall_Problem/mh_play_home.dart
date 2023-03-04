import 'package:flutter/material.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_template.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Monty_Hall_Play_Home extends StatelessWidget {
  Monty_Hall_Play_Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Monty_Hall_Template(
          content: Column(
            children: [Text("data")],
          ),
          instruction: "Select a door to start the game!");
    });
  }
}
