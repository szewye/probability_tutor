import 'package:flutter/material.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_game.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_simulation.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

// The homepage for the Monty Hall problem
// Users can select which topic they want to explore
// e.g. play the game, try the interactive simulation
class Monty_Hall extends StatelessWidget {
  const Monty_Hall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: lightBlue,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  pagePadding, 220, pagePadding, pagePadding),
              constraints: const BoxConstraints(maxWidth: pageConstraint),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Monty Hall Problem',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.apply(fontWeightDelta: 20, color: darkBlue),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: MainPageButton(
                              title: "Play",
                              onPress: () {
                                getNavigation()(context, Monty_Hall_Game());
                              }),
                        ),
                        const SizedBox(height: buttonsDistance),
                        SizedBox(
                          width: double.infinity,
                          child: MainPageButton(
                            title: "Simulate",
                            onPress: () {
                              getNavigation()(context, Monty_Hall_Simulation());
                            },
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
