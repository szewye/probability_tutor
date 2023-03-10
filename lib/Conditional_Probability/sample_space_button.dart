import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

// Sample spaces as buttons so users can click on it
// while selecting sub sample space for other events
class SampleSpaceButton extends StatelessWidget {
  const SampleSpaceButton({
    Key? key,
    required this.text,
    this.textColour = darkBlue,
    this.onPress,
  }) : super(key: key);

  final String text;
  final Color textColour;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPress,
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.apply(color: textColour)));
  }
}
