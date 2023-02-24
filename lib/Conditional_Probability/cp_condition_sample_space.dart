import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/sub_sample_space_helper.dart';
import 'package:probability_tutor/models/prob_query.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

class Conditional_Probability_Condition_Sample_Space extends StatefulWidget {
  Conditional_Probability_Condition_Sample_Space(
      {super.key, required this.probQuery});

  @override
  _Conditional_Probability_Condition_Sample_Space createState() =>
      _Conditional_Probability_Condition_Sample_Space();

  ProbQuery probQuery;
}

class _Conditional_Probability_Condition_Sample_Space
    extends State<Conditional_Probability_Condition_Sample_Space> {
  Set<String> subSampleSpace = {};

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Conditional_Probability_Template(
        samples: Row(
          children: coinsSampleSpace
              .map<Widget>((String sample) => SampleSpaceButton(
                  text: sample, onPress: () => sampleOnPress(sample, context)))
              .toList(),
        ),
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Title_Caption(
                  caption: "select all the sub sample spaces for the ",
                  captionColour: darkBlue,
                ),
                Text("condition event (${widget.probQuery.conditionEvent})",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.apply(color: Colors.orange)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: 350, minHeight: 55),
              decoration: BoxDecoration(
                // color: lightBlue,
                border: Border.all(color: darkBlue),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: subSampleSpace.map<Widget>(
                  (String element) {
                    return SampleSpaceButton(text: element);
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }

  // sample space button is clickable in this page
  void sampleOnPress(String sample, BuildContext context) {
    if (widget.probQuery.conditionEvent != null) {
      if (rightSample(sample, widget.probQuery.conditionEvent!)) {
        setState(() {
          subSampleSpace.add(sample);

          if (completeSubSampleSpace(
              subSampleSpace, widget.probQuery.conditionEvent!)) {
            getNavigation(duration: 800)(
                context, Conditional_Probability_Home());
          }
        });
      }
    }
  }
}
