import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_template.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_simulation.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/bayes_next_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class Bayes_Theorem_Example_Data extends StatelessWidget {
  Bayes_Theorem_Example_Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Bayes_Theorem_Example_Template(
        content: Column(
          children: [
            Title_Caption(caption: "How do we get P(T | ¬D) and P(¬D)?"),
            SizedBox(height: 10),
            Text(
              "Click next to compute a tree using the data given from the scenario!",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        onPress: () {},
      );
    });
  }
}
