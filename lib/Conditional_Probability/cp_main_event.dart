import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

// The page where users get to pick the main event
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: coinsSampleSpace
              .map<Widget>((String sample) =>
                  Flexible(child: SampleSpaceButton(text: sample)))
              .toList(),
        ),
        content: Column(
          children: [
            const Title_Caption(
              caption: "select a main event",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("hint: P("),
                Text(
                  "X",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: orangyRed, fontWeightDelta: 3),
                ),
                const Text(" | Y)"),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              constraints: const BoxConstraints(maxWidth: 100),
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

  void onSelection(int? newSelected) {
    setState(() {
      selected = newSelected;
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
