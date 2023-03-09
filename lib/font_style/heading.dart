import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.title,
    this.textColour = darkBlue,
  }) : super(key: key);

  final String title;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineLarge
          ?.apply(fontWeightDelta: 20, color: textColour),
      textAlign: TextAlign.center,
    );
  }
}
