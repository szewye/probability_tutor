import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_simulation.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

// The homepage for the Bayes' theorem part
// Users can select which part they want to explore
// e.g. formula, example, simulation
class Bayes_Theorem extends StatelessWidget {
  const Bayes_Theorem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: lightYellow,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  pagePadding, 200, pagePadding, pagePadding),
              constraints: const BoxConstraints(maxWidth: pageConstraint),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bayes' Theorem",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.apply(fontWeightDelta: 20, color: darkBlue),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 450),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: MainPageButton(
                            title: "Formula",
                            onPress: () {
                              getNavigation()(context, Bayes_Theorem_Formula());
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
                              getNavigation()(
                                  context, Bayes_Theorem_Example_Quiz_One());
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
                              getNavigation()(
                                  context, const Bayes_Theorem_Simulation());
                            },
                            buttonColour: darkBlue,
                            textColour: offWhite,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const BackHomeButton(title: "back to home page"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
