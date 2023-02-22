import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_sample_space.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Conditional_Probability_Condition_Event extends StatefulWidget {
  @override
  _Conditional_Probability_Condition_Event createState() =>
      _Conditional_Probability_Condition_Event();
}

class _Conditional_Probability_Condition_Event
    extends State<Conditional_Probability_Condition_Event> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Conditional_Probability_Template(
        content: Column(
          children: [
            Title_Caption(
              caption: "select the condition event",
              captionColour: darkBlue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("hint: P(X | "),
                Text(
                  "Y",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: Colors.orange, fontWeightDelta: 2),
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
                    page: Conditional_Probability_Main_Sample_Space(),
                    value: "E",
                    circleColour: Colors.orange,
                  ),
                  EventCheckBox(
                    id: 1,
                    selection: selected,
                    onSelected: onSelection,
                    page: Conditional_Probability_Main_Sample_Space(),
                    value: "F",
                    circleColour: Colors.orange,
                  ),
                  EventCheckBox(
                    id: 2,
                    selection: selected,
                    onSelected: onSelection,
                    page: Conditional_Probability_Main_Sample_Space(),
                    value: "G",
                    circleColour: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
        onPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Conditional_Probability_Main_Sample_Space()));
        },
      );
    });
  }

  void onSelection(int? new_selected) {
    setState(() {
      selected = new_selected;
    });
  }
}
