import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_simulation.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';

class Bayes_Theorem extends StatelessWidget {
  const Bayes_Theorem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        color: lightYellow,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bayes' Theorem",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.apply(fontWeightDelta: 20, color: darkBlue),
              ),
              const SizedBox(height: 50),
              Container(
                constraints: BoxConstraints(maxWidth: 500),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: MainPageButton(
                        title: "Formula",
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Bayes_Theorem_Formula()));
                        },
                        buttonColour: darkBlue,
                        textColour: offWhite,
                      ),
                    ),
                    const SizedBox(height: buttonsDistance),
                    SizedBox(
                      width: double.infinity,
                      child: MainPageButton(
                        title: "Example",
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Bayes_Theorem_Example_Quiz_One()));
                        },
                        buttonColour: darkBlue,
                        textColour: offWhite,
                      ),
                    ),
                    const SizedBox(height: buttonsDistance),
                    SizedBox(
                      width: double.infinity,
                      child: MainPageButton(
                        title: "Simulation",
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Bayes_Theorem_Simulation()));
                        },
                        buttonColour: darkBlue,
                        textColour: offWhite,
                      ),
                    ),
                    const SizedBox(height: 20),
                    BackHomeButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
