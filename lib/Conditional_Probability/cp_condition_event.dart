import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_sample_space.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/models/prob_query.dart';

class Conditional_Probability_Condition_Event extends StatefulWidget {
  Conditional_Probability_Condition_Event({super.key, required this.probQuery});

  @override
  State<Conditional_Probability_Condition_Event> createState() =>
      _Conditional_Probability_Condition_EventState();

  ProbQuery probQuery;
}

class _Conditional_Probability_Condition_EventState
    extends State<Conditional_Probability_Condition_Event> {
  int? selected;

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
              caption: "select the condition event",
              captionColour: darkBlue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("hint: P(${widget.probQuery.mainEvent} | "),
                Text(
                  "Y",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: Colors.orange, fontWeightDelta: 3),
                ),
                Text(")"),
              ],
            ),
            SizedBox(height: 10),
            Container(
              constraints: BoxConstraints(maxWidth: 100),
              child: Column(
                children: [
                  EventCheckBox(
                    id: 0,
                    selection: selected,
                    onSelected: onSelection,
                    page: Conditional_Probability_Main_Sample_Space(
                      probQuery: widget.probQuery,
                    ),
                    value: "E",
                    circleColour: Colors.orange,
                  ),
                  EventCheckBox(
                    id: 1,
                    selection: selected,
                    onSelected: onSelection,
                    page: Conditional_Probability_Main_Sample_Space(
                      probQuery: widget.probQuery,
                    ),
                    value: "F",
                    circleColour: Colors.orange,
                  ),
                  EventCheckBox(
                    id: 2,
                    selection: selected,
                    onSelected: onSelection,
                    page: Conditional_Probability_Main_Sample_Space(
                      probQuery: widget.probQuery,
                    ),
                    value: "G",
                    circleColour: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  void onSelection(int? new_selected) {
    setState(() {
      selected = new_selected;
      if (selected == 0) {
        widget.probQuery.conditionEvent = "E";
      } else if (selected == 1) {
        widget.probQuery.conditionEvent = "F";
      } else if (selected == 2) {
        widget.probQuery.conditionEvent = "G";
      }
    });
  }
}
