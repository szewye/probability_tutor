import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_venn_diagram.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/models/probability_query.dart';

class Conditional_Probability_Venn_Diagram_Caption extends StatefulWidget {
  Conditional_Probability_Venn_Diagram_Caption(
      {super.key, required this.probQuery});

  @override
  State<Conditional_Probability_Venn_Diagram_Caption> createState() =>
      _Conditional_Probability_Venn_Diagram_CaptionState();
  ProbQuery probQuery;
}

class _Conditional_Probability_Venn_Diagram_CaptionState
    extends State<Conditional_Probability_Venn_Diagram_Caption> {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Title_Caption(
                caption:
                    "Want to see a Venn diagram based on the sample spaces you've just chosen?"),
            SizedBox(height: 8),
            Text(
              "Click next to see the Venn diagram!",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 40),
            NextButton(
              onPress: () {
                getNavigation()(
                    context,
                    Conditional_Probability_Venn_Diagram(
                        probQuery: widget.probQuery));
              },
            ),
          ],
        ),
      );
    });
  }
}
