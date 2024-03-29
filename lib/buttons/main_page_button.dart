import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

// Button for main page
// e.g. Monty Hall problem, conditional probability, Bayes' theorem
class MainPageButton extends StatelessWidget {
  const MainPageButton({
    Key? key,
    required this.title,
    this.buttonColour = offWhite,
    this.textColour = darkBlue,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final Color buttonColour;
  final Color textColour;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColour,
            padding: const EdgeInsets.all(25),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(mainPageRoundedButton))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.apply(color: textColour)),
        ));
  }
}
