import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/conditional_probability_helpers.dart';
import 'package:probability_tutor/models/prob_query.dart';

class Conditional_Probability_Formula_Solution extends StatefulWidget {
  Conditional_Probability_Formula_Solution(
      {super.key, required this.probQuery});

  @override
  State<Conditional_Probability_Formula_Solution> createState() =>
      _Conditional_Probability_Formula_Solution_State();

  ProbQuery probQuery;
}

class _Conditional_Probability_Formula_Solution_State
    extends State<Conditional_Probability_Formula_Solution> {
  @override
  Widget build(BuildContext context) {
    double top = intersection(
            widget.probQuery.mainEvent, widget.probQuery.conditionEvent) /
        coinsSampleSpace.length;
    double bottom = numberOfSubSampleSpace(widget.probQuery.conditionEvent) /
        coinsSampleSpace.length;
    double solution = top / bottom;

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
            VennDiagram(),
            SizedBox(height: 8),
            Text(
              "Using the formula, we can see that the event of ${widget.probQuery.mainEvent} happening given ${widget.probQuery.conditionEvent}: ",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Column(
              children: [
                Text("P(E | F) "),
                Text("= P(E ∩ F) / P(F)"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("= ("),
                    Text(
                      "${intersection(widget.probQuery.mainEvent, widget.probQuery.conditionEvent)} / ${coinsSampleSpace.length}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: orangyRed),
                    ),
                    Text(") / ("),
                    Text(
                      "${numberOfSubSampleSpace(widget.probQuery.conditionEvent)} / ${coinsSampleSpace.length}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: Colors.green),
                    ),
                    Text(")")
                  ],
                ),
                Text("= ${solution.toString()}"),
              ],
            ),
          ],
        ),
      );
    });
  }
}
