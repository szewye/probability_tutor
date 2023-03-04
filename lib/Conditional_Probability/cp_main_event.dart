import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/models/probability_query.dart';

class Conditional_Probability_Main_Event extends StatefulWidget {
  @override
  _Conditional_Probability_Main_Event createState() =>
      _Conditional_Probability_Main_Event();

  ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);
}

class _Conditional_Probability_Main_Event
    extends State<Conditional_Probability_Main_Event> {
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
              caption: "select a main event",
              captionColour: darkBlue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("hint: P("),
                Text(
                  "X",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: orangyRed, fontWeightDelta: 3),
                ),
                Text(" | Y)"),
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
                    page: Conditional_Probability_Condition_Event(
                      probQuery: widget.probQuery,
                    ),
                    value: "E",
                  ),
                  EventCheckBox(
                    id: 1,
                    selection: selected,
                    onSelected: onSelection,
                    page: Conditional_Probability_Condition_Event(
                      probQuery: widget.probQuery,
                    ),
                    value: "F",
                  ),
                  EventCheckBox(
                    id: 2,
                    selection: selected,
                    onSelected: onSelection,
                    page: Conditional_Probability_Condition_Event(
                      probQuery: widget.probQuery,
                    ),
                    value: "G",
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
        widget.probQuery.mainEvent = E;
      } else if (selected == 1) {
        widget.probQuery.mainEvent = F;
      } else if (selected == 2) {
        widget.probQuery.mainEvent = G;
      }
    });
  }
}
