import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

// Caption for pages in the application
class Title_Caption extends StatelessWidget {
  const Title_Caption({
    Key? key,
    required this.caption,
    this.captionColour = darkBlue,
  }) : super(key: key);

  final String caption;
  final Color captionColour;

  @override
  Widget build(BuildContext context) {
    return Text(
      caption,
      style:
          Theme.of(context).textTheme.titleLarge?.apply(color: captionColour),
      textAlign: TextAlign.center,
    );
  }
}
