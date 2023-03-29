import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

// The page where users can see the conditional probability solution
// using the formula, alongside with the Venn diagram
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: coinsSampleSpace
              .map<Widget>((String sample) =>
                  Flexible(child: SampleSpaceButton(text: sample)))
              .toList(),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VennDiagram(probQuery: widget.probQuery),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Using the formula,",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "P(E | F)",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Math.tex("= \\frac{P(E ∩ F)}{P(F)}"),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "= (",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "${widget.probQuery.mainSubSampleSpace(space: widget.probQuery.conditionSubSampleSpace()).length} / ${widget.probQuery.sampleSpace.length}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.apply(color: orangyRed),
                        ),
                        Text(
                          ") / (",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "${widget.probQuery.conditionSubSampleSpace().length} / ${widget.probQuery.sampleSpace.length}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.apply(color: Colors.green),
                        ),
                        Text(
                          ")",
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "= ${solution.toStringAsFixed(4)}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(width: 80),
                Container(
                  constraints: const BoxConstraints(maxWidth: 420),
                  padding: const EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(border: Border.all(color: darkBlue)),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    padding: const EdgeInsets.all(10),
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
            const SizedBox(height: 15),
            NextButton(
              title: "interested in Bayes' theorem?",
              onPress: () {
                getNavigation()(context, Bayes_Theorem_Example_Quiz_One());
              },
            )
          ],
        ),
      );
    });
  }
}
