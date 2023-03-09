import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/homepage.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({
    Key? key,
    this.title = "home",
    this.textColour = darkBlue,
  }) : super(key: key);

  final String title;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.popUntil(context, (route) => true);
          getNavigation()(context, const Homepage());
        },
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.apply(
                fontWeightDelta: 20,
                color: darkBlue,
                decoration: TextDecoration.underline,
              ),
        ));
  }
}
