import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Conditional_Probability_Venn_Diagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Conditional_Probability_Template(
        samples: Row(
          children: [
            SampleSpaceButton(text: "HHH"),
            SampleSpaceButton(text: "HHT"),
            SampleSpaceButton(text: "HTT"),
            SampleSpaceButton(text: "HTH"),
            SampleSpaceButton(text: "TTT"),
            SampleSpaceButton(text: "TTH"),
            SampleSpaceButton(text: "THH"),
            SampleSpaceButton(text: "THT"),
          ],
        ),
        content: Column(
          children: [
            VennDiagram(),
          ],
        ),
      );
    });
  }
}
