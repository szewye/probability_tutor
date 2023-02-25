import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/cp_venn_diagram_caption.dart';
import 'package:probability_tutor/Conditional_Probability/cp_venn_solution.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/models/prob_query.dart';

class Conditional_Probability_Venn_Diagram extends StatefulWidget {
  Conditional_Probability_Venn_Diagram({super.key, required this.probQuery});

  @override
  State<Conditional_Probability_Venn_Diagram> createState() =>
      _Conditional_Probability_Venn_DiagramState();

  ProbQuery probQuery;
}

class _Conditional_Probability_Venn_DiagramState
    extends State<Conditional_Probability_Venn_Diagram> {
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
            VennDiagram(probQuery: widget.probQuery),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("What is P(",
                    style: Theme.of(context).textTheme.titleLarge),
                Text("${widget.probQuery.mainEvent?.id}",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.apply(color: orangyRed)),
                Text(" | ", style: Theme.of(context).textTheme.titleLarge),
                Text("${widget.probQuery.conditionEvent?.id}",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.apply(color: Colors.green)),
                Text(")?", style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            SizedBox(height: 20),
            NextButton(onPress: () {
              getNavigation()(
                  context,
                  Conditional_Probability_Venn_Diagram_Solution(
                    probQuery: widget.probQuery,
                  ));
            }),
          ],
        ),
      );
    });
  }
}
