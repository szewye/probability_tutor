import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

class BayesNextButton extends StatelessWidget {
  const BayesNextButton({
    Key? key,
    this.title = "next",
    this.buttonColour = offWhite,
    this.textColour = darkBlue,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final Color buttonColour;
  final Color textColour;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        // style: ElevatedButton.styleFrom(
        //     backgroundColor: offWhite,
        //     padding: const EdgeInsets.all(10),
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10)),),
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
