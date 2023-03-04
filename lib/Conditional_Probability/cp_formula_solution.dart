import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

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
    double top = widget.probQuery
            .mainSubSampleSpace(
                space: widget.probQuery.conditionSubSampleSpace())
            .length /
        widget.probQuery.sampleSpace.length;
    double bottom = widget.probQuery.conditionSubSampleSpace().length /
        widget.probQuery.sampleSpace.length;
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
            VennDiagram(probQuery: widget.probQuery),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Using the formula, ",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 8),
                    Text("P(E | F)"),
                    SizedBox(height: 5),
                    Math.tex("= \\frac{P(E ∩ F)}{P(F)}"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("= ("),
                        Text(
                          "${widget.probQuery.mainSubSampleSpace(space: widget.probQuery.conditionSubSampleSpace()).length} / ${widget.probQuery.sampleSpace.length}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(color: orangyRed),
                        ),
                        Text(") / ("),
                        Text(
                          "${widget.probQuery.conditionSubSampleSpace().length} / ${widget.probQuery.sampleSpace.length}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.apply(color: Colors.green),
                        ),
                        Text(")")
                      ],
                    ),
                    Text("= ${solution.toStringAsFixed(4)}"),
                  ],
                ),
                SizedBox(width: 50),
                Container(
                  constraints: BoxConstraints(maxWidth: 420),
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(border: Border.all(color: darkBlue)),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(border: Border.all(color: darkBlue)),
                    child: Text(
                      "P(${widget.probQuery.mainEvent?.id} | ${widget.probQuery.conditionEvent?.id}) = ${solution.toStringAsFixed(4)}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            BackHomeButton(
              title: "back to home page",
            ),
          ],
        ),
      );
    });
  }
}
