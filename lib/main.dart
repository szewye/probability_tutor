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
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_sample_space.dart';
import 'package:probability_tutor/Conditional_Probability/cp_venn_diagram.dart';
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
      home: Conditional_Probability_Home(),
    );
  }
}
