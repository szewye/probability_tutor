import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_event.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

class Conditional_Probability_Home extends StatelessWidget {
  const Conditional_Probability_Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Conditional_Probability_Template(
        samples: Row(
          children: coinsSampleSpace
              .map<Widget>((String sample) => SampleSpaceButton(text: sample))
              .toList(),
        ),
        content: Column(
          children: [
            Title_Caption(
              caption: "Ready to proceed?",
            ),
            SizedBox(height: 20),
            NextButton(
              onPress: () {
                getNavigation()(context, Conditional_Probability_Main_Event());
              },
            ),
          ],
        ),
      );
    });
  }
}
