import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';
import 'package:probability_tutor/title_caption.dart';
import 'package:probability_tutor/titles.dart';

class Bayes_Theorem_Simulation extends StatefulWidget {
  const Bayes_Theorem_Simulation({super.key});

  @override
  State<Bayes_Theorem_Simulation> createState() => _SliderState();
}

class _SliderState extends State<Bayes_Theorem_Simulation> {
  double _sliderValue1 = 0.01;
  double _sliderValue2 = 0.01;
  double _sliderValue3 = 0.01;

  @override
  Widget build(BuildContext context) {
    String TgivenD = "${_sliderValue1}";
    String D = "${_sliderValue1}";
    String TgivenNotD = "${_sliderValue1}";

    return Scaffold(
      backgroundColor: lightYellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Titles(title: "Bayes' Theorem Simulation"),
          const SizedBox(height: 30),
          Container(
            decoration: BoxDecoration(color: offWhite),
            padding: EdgeInsets.all(15),
            constraints: BoxConstraints(maxWidth: 1000),
            child: Text(
              "With the example from the 2nd section of Bayes' theorem, we know that P(D) = 0.00001, P(T | D) = 0.99, P(¬T | ¬D) = 0.995, the probability that someone actually has the disease given that the test is positive. \n\n What is going to happen when the values are different? Is the probability of getting a false positive or false negative higher? How can you make P(D | T) higher or lower? ",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 30),
          Title_Caption(
              caption:
                  "Play around with the sliders to see how the values affect the end result!"),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("P(T | D) = "),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: darkBlue,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8),
                        activeTrackColor: darkBlue),
                    child: Slider(
                      value: _sliderValue1,
                      max: 1,
                      divisions: 1000,
                      label: _sliderValue1.toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue1 = value;
                        });
                      },
                    ),
                  ),
                  Text("P(D) = "),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: darkBlue,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8),
                        activeTrackColor: darkBlue),
                    child: Slider(
                      value: _sliderValue2,
                      max: 1,
                      divisions: 1000,
                      label: _sliderValue2.toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue2 = value;
                        });
                      },
                    ),
                  ),
                  Text("P(¬D) = "),
                  SliderTheme(
                    data: SliderThemeData(
                        thumbColor: darkBlue,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 8),
                        activeTrackColor: darkBlue),
                    child: Slider(
                      value: _sliderValue3,
                      max: 1,
                      divisions: 1000,
                      label: _sliderValue3.toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue3 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Math.tex(r"P(D | T) = \frac{TgivenD}{2}"),
            ],
          ),
          SizedBox(height: 120),
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
    );
  }
}
