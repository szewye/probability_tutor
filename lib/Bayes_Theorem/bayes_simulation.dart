// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/font_style/heading.dart';

class Bayes_Theorem_Simulation extends StatefulWidget {
  const Bayes_Theorem_Simulation({super.key});

  @override
  State<Bayes_Theorem_Simulation> createState() => _SliderState();
}

class _SliderState extends State<Bayes_Theorem_Simulation> {
  double _sliderTGivenD = 0.99;
  double _sliderD = 0.01;
  double _sliderTGivenNotD = 0.005;

  @override
  Widget build(BuildContext context) {
    String TgivenD = "${_sliderTGivenD.toStringAsFixed(3)}";
    String D = "${_sliderD.toStringAsFixed(3)}";
    String TgivenNotD = "${_sliderTGivenNotD.toStringAsFixed(3)}";
    String notD = "${(1 - _sliderD).toStringAsFixed(3)}";

    String formula =
        '= \\frac{${TgivenD} × ${D}}{(${TgivenD} × ${D}) + (${TgivenNotD} × ${notD})}';

    double top = _sliderTGivenD * _sliderD;
    double bottom =
        (_sliderTGivenD * _sliderD) + (_sliderTGivenNotD * (1 - _sliderD));
    double bayes = top / bottom;

    return Scaffold(
      backgroundColor: lightYellow,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            constraints: BoxConstraints(maxWidth: 1200),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Heading(title: "Bayes' Theorem Simulation"),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(color: offWhite),
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "With the example from the 2nd section of Bayes' theorem, we know that P(D) = 0.00001, P(T | D) = 0.99, P(¬T | ¬D) = 0.995, the probability that someone actually has the disease given that the test is positive. \n\n What is going to happen when the values are different? Is the probability of getting a false positive or false negative higher? How can you make P(D | T) higher or lower? ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 30),
                Title_Caption(
                    caption:
                        "Play around with the sliders to see how the values affect the end result!"),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("P(T | D) = ",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SliderTheme(
                            data: SliderThemeData(
                                thumbColor: darkBlue,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8),
                                activeTrackColor: darkBlue),
                            child: Slider(
                              value: _sliderTGivenD,
                              max: 1,
                              divisions: 1000,
                              label: _sliderTGivenD.toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _sliderTGivenD = value;
                                });
                              },
                            ),
                          ),
                          Text("P(D) = ",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SliderTheme(
                            data: SliderThemeData(
                                thumbColor: darkBlue,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8),
                                activeTrackColor: darkBlue),
                            child: Slider(
                              value: _sliderD,
                              max: 1,
                              divisions: 1000,
                              label: _sliderD.toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _sliderD = value;
                                });
                              },
                            ),
                          ),
                          Text("P(T | ¬D) = ",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SliderTheme(
                            data: SliderThemeData(
                                thumbColor: darkBlue,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 8),
                                activeTrackColor: darkBlue),
                            child: Slider(
                              value: _sliderTGivenNotD,
                              max: 1,
                              divisions: 1000,
                              label: _sliderTGivenNotD.toString(),
                              onChanged: (double value) {
                                setState(() {
                                  _sliderTGivenNotD = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "P (D | T) ",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Math.tex(
                                "= \\frac{P(T \\vert D) P(D)}{P(T | D) P(D) + P(T | ¬D)P(¬D)}",
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall),
                            SizedBox(height: 50),
                            Math.tex(formula,
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall),
                            SizedBox(height: 50),
                            Math.tex("= ${bayes.toStringAsFixed(4)}",
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 150),
                BackHomeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
