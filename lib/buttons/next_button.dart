import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    Key? key,
    this.title = "next",
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
    return TextButton(
        onPressed: onPress,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.apply(
                fontWeightDelta: 20,
                color: darkBlue,
                decoration: TextDecoration.underline,
              ),
        ));
  }
}
