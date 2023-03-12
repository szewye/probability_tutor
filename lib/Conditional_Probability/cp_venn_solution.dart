import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_formula_solution.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

// The page where users can see the conditional probability
// from the Venn diagram (users can basically just count the sample spaces)
class Conditional_Probability_Venn_Diagram_Solution extends StatefulWidget {
  Conditional_Probability_Venn_Diagram_Solution(
      {super.key, required this.probQuery});

  @override
  State<Conditional_Probability_Venn_Diagram_Solution> createState() =>
      _Conditional_Probability_Venn_Diagram_Solution_State();

  ProbQuery probQuery;
}

class _Conditional_Probability_Venn_Diagram_Solution_State
    extends State<Conditional_Probability_Venn_Diagram_Solution> {
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
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "From the Venn diagram, we can see that the event of ",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "${widget.probQuery.mainEvent?.id}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: orangyRed),
                ),
                const Text(" happening given "),
                Text(
                  "${widget.probQuery.conditionEvent?.id}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: Colors.green),
                ),
                const Text(" is "),
                Text(
                  "${solution.toStringAsFixed(4)} ",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.apply(fontWeightDelta: 5),
                )
              ],
            ),
            const SizedBox(height: 10),
            NextButton(onPress: () {
              getNavigation()(
                  context,
                  Conditional_Probability_Formula_Solution(
                    probQuery: widget.probQuery,
                  ));
            }),
          ],
        ),
      );
    });
  }
}
