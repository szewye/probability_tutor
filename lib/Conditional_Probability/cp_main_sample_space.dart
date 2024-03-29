import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_sample_space.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

// The page where users get to pick the main event's sub sample space
class Conditional_Probability_Main_Sample_Space extends StatefulWidget {
  Conditional_Probability_Main_Sample_Space(
      {super.key, required this.probQuery});

  @override
  _Conditional_Probability_Main_Sample_Space createState() =>
      _Conditional_Probability_Main_Sample_Space();

  ProbQuery probQuery;
}

class _Conditional_Probability_Main_Sample_Space
    extends State<Conditional_Probability_Main_Sample_Space> {
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Title_Caption(
                      caption: "select all the sub sample spaces for the ",
                    ),
                    Text("main event (${widget.probQuery.mainEvent?.id})",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.apply(color: orangyRed)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                key: Key("cont-selected"),
                padding: const EdgeInsets.all(10),
                constraints: const BoxConstraints(maxWidth: 350, minHeight: 55),
                decoration: BoxDecoration(
                  // color: lightBlue,
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
    final subSampleSpace = widget.probQuery.mainSubSampleSpace();
    if (subSampleSpace.contains(sampleClicked)) {
      setState(() {
        selectedSubSampleSpace.add(sampleClicked);

        if (selectedSubSampleSpace.containsAll(subSampleSpace)) {
          getNavigation(duration: 800)(
              context,
              Conditional_Probability_Condition_Sample_Space(
                  probQuery: widget.probQuery));
        }
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }
}
