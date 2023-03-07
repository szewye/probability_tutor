import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

class MontyHallButton extends StatelessWidget {
  const MontyHallButton({
    Key? key,
    required this.title,
    this.buttonColour = orangyRed,
    this.textColour = offWhite,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final Color buttonColour;
  final Color textColour;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColour,
            padding: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.apply(color: textColour)),
        ));
  }
}
