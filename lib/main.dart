import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/monty_hall.dart';

void main() {
  runApp(const ProbabilityTutor());
}

class ProbabilityTutor extends StatelessWidget {
  const ProbabilityTutor({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      home: const Monty_Hall(),
    );
  }
}
