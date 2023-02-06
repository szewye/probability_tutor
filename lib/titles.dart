import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

class Titles extends StatelessWidget {
  const Titles({
    Key? key,
    required this.title,
    this.textColour = darkBlue,
  }) : super(key: key);

  final String title;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .headline2
            ?.apply(fontWeightDelta: 20, color: textColour));
  }
}
