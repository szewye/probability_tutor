import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_home.dart';
import 'package:probability_tutor/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        color: darkBlue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Probability Tutor',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.apply(fontWeightDelta: 20, color: lightBlue),
              ),
              const SizedBox(height: 50),
              Container(
                constraints: BoxConstraints(maxWidth: 550),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: MainPageButton(
                          title: "Monty Hall Problem",
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Monty_Hall()));
                          }),
                    ),
                    const SizedBox(height: buttonsDistance),
                    SizedBox(
                      width: double.infinity,
                      child: MainPageButton(
                          title: "Conditional Probability", onPress: () {}),
                    ),
                    const SizedBox(height: buttonsDistance),
                    SizedBox(
                      width: double.infinity,
                      child: MainPageButton(
                          title: "Bayes\'s Theorem",
                          onPress: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bayes_Theorem()));
                          }),
                    ),
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
