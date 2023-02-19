import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_data.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_final.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_first_question.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_second_question.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_home.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_simulation.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';

void main() {
  runApp(const ProbabilityTutor());
}

class ProbabilityTutor extends StatelessWidget {
  const ProbabilityTutor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Probability Tutor',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(
          (Theme.of(context).textTheme).apply(
            bodyColor: darkBlue,
          ),
        ),
      ),
      home: Bayes_Theorem_Example_Final(),
    );
  }
}
