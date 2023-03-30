import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

// The page where users can use the sliders to play around with the values
// and see how the slight changes affects the probability
class Bayes_Theorem_Simulation extends StatefulWidget {
  const Bayes_Theorem_Simulation({super.key});

  @override
  State<Bayes_Theorem_Simulation> createState() => _SliderState();
}

class _SliderState extends State<Bayes_Theorem_Simulation> {
  double _sliderTGivenD = 0.99;
  double _sliderD = 0.00001;
  double _sliderTGivenNotD = 0.005;

  @override
  Widget build(BuildContext context) {
    return Container();

    String TgivenD = _sliderTGivenD.toStringAsFixed(3);
    String D = _sliderD.toStringAsFixed(5);
    String TgivenNotD = _sliderTGivenNotD.toStringAsFixed(3);
    String notD = (1 - _sliderD).toStringAsFixed(3);

    String formula =
        '= \\frac{$TgivenD × $D}{($TgivenD × $D) + ($TgivenNotD × $notD)}';

    double top = _sliderTGivenD * _sliderD;
    double bottom =
        (_sliderTGivenD * _sliderD) + (_sliderTGivenNotD * (1 - _sliderD));
    double bayes = top / bottom;

    return Scaffold(
      backgroundColor: lightYellow,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: darkBlue),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    getNavigation()(context, Bayes_Theorem_Example_Quiz_One());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: offWhite,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "example",
                    style: TextStyle(color: darkBlue),
                  )),
            )
          ]),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(pagePadding),
            constraints: const BoxConstraints(maxWidth: pageConstraint),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Heading(title: "Bayes' Theorem Simulation"),
                const SizedBox(height: 30),
                Container(
                  decoration: const BoxDecoration(color: offWhite),
                  padding: const EdgeInsets.all(15),
                  child: Text(
                      "With the example from the 2nd section of Bayes' theorem, we know that P(D) = 0.00001, P(T | D) = 0.99, P(¬T | ¬D) = 0.995, the probability that someone actually has the disease given that the test is positive. \n\n What is going to happen when the values are different? Is the probability of getting a false positive or false negative higher? How can you make P(D | T) higher or lower? ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 30),
                const Title_Caption(
                    caption:
                        "Play around with the sliders to see how the values affect the end result!"),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pOfTGivenD,
                              style: Theme.of(context).textTheme.headlineSmall),
                          SliderTheme(
                            data: const SliderThemeData(
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
                          Text(pOfD,
                              style: Theme.of(context).textTheme.headlineSmall),
                          SliderTheme(
                            data: const SliderThemeData(
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
                          Text(pOfTGivenNotD,
                              style: Theme.of(context).textTheme.headlineSmall),
                          SliderTheme(
                            data: const SliderThemeData(
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
                    const SizedBox(width: 50),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Math.tex(
                          pOfDGivenT,
                          textStyle: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(width: 10),
                        const SizedBox(height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Math.tex(
                                "= \\frac{$pOfTGivenD $pOfD}{$pOfTGivenD $pOfD + $pOfTGivenNotD $pOfNotD}",
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(height: 50),
                            Math.tex(formula,
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(height: 50),
                            Math.tex("= ${bayes.toStringAsFixed(5)}",
                                textStyle:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 110),
                const BackHomeButton(
                  title: "back to home page",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
