import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';
import 'package:probability_tutor/titles.dart';

class Bayes_Theorem_Example extends StatelessWidget {
  const Bayes_Theorem_Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
          color: lightYellow,
          child: Center(
            child: Column(
              children: [
                Titles(title: "Bayes' Theorem Example"),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    child: Text(
                      "back to home page",
                      style: Theme.of(context).textTheme.bodySmall?.apply(
                            fontWeightDelta: 20,
                            color: darkBlue,
                            decoration: TextDecoration.underline,
                          ),
                    )),
              ],
            ),
          ));
    });
  }
}
