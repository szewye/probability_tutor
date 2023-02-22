import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Conditional_Probability_Main_Sample_Space extends StatefulWidget {
  @override
  _Conditional_Probability_Main_Sample_Space createState() =>
      _Conditional_Probability_Main_Sample_Space();
}

class _Conditional_Probability_Main_Sample_Space
    extends State<Conditional_Probability_Main_Sample_Space> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Conditional_Probability_Template(
        content: Column(
          children: [
            Title_Caption(
              caption: "select the sample spaces for the main event",
              captionColour: darkBlue,
            ),
          ],
        ),
        onPress: () {},
      );
    });
  }
}
