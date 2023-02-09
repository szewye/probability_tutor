import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

class Title_Caption extends StatelessWidget {
  const Title_Caption({
    Key? key,
    required this.caption,
    this.captionColour = orangyRed,
  }) : super(key: key);

  final String caption;
  final Color captionColour;

  @override
  Widget build(BuildContext context) {
    return Text(
      caption,
      style:
          Theme.of(context).textTheme.labelLarge?.apply(color: captionColour),
      textAlign: TextAlign.center,
    );
  }
}
