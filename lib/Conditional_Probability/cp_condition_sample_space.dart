import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_venn_diagram_caption.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

// The page where users get to pick the condition event's sub sample space
class Conditional_Probability_Condition_Sample_Space extends StatefulWidget {
  Conditional_Probability_Condition_Sample_Space(
      {super.key, required this.probQuery});

  @override
  _Conditional_Probability_Condition_Sample_Space createState() =>
      _Conditional_Probability_Condition_Sample_Space();

  ProbQuery probQuery;
}

class _Conditional_Probability_Condition_Sample_Space
    extends State<Conditional_Probability_Condition_Sample_Space> {
  Set<String> selectedSubSampleSpace = {};

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Conditional_Probability_Template(
        samples: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: coinsSampleSpace
              .map<Widget>((String sample) => Flexible(
                    child: SampleSpaceButton(
                        text: sample,
                        onPress: () => sampleOnPress(sample, context)),
                  ))
              .toList(),
        ),
        content: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Title_Caption(
                      caption: "select all the sub sample spaces for the ",
                    ),
                    Text(
                        "condition event (${widget.probQuery.conditionEvent?.id})",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.apply(color: Colors.green)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(maxWidth: 350, minHeight: 55),
                decoration: BoxDecoration(
                  border: Border.all(color: darkBlue),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: selectedSubSampleSpace.map<Widget>(
                    (String element) {
                      return SampleSpaceButton(text: element);
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // sample space button is clickable in this page
  Future<void> sampleOnPress(String sampleClicked, BuildContext context) async {
    final subSampleSpace = widget.probQuery.conditionSubSampleSpace();
    if (subSampleSpace.contains(sampleClicked)) {
      setState(() {
        selectedSubSampleSpace.add(sampleClicked);

        if (selectedSubSampleSpace.containsAll(subSampleSpace)) {
          getNavigation(duration: 800)(
              context,
              Conditional_Probability_Venn_Diagram_Caption(
                  probQuery: widget.probQuery));
        }
      });
      await Future.delayed(const Duration(milliseconds: 1));
    }
  }
}
