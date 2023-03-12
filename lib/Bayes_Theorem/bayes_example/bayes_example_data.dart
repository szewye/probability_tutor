import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_template.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_first_question.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

// The page that directs users (gives instructions to users to click next)
// to the next page to see the probability binary tree
class Bayes_Theorem_Example_Data extends StatelessWidget {
  Bayes_Theorem_Example_Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Bayes_Theorem_Example_Template(
        content: Column(
          children: [
            const Title_Caption(
                caption: "How do we get $pOfTGivenNotD and $pOfNotD?"),
            const SizedBox(height: 10),
            Text(
              "Click next to compute a tree using the data given from the scenario!",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 50),
            NextButton(onPress: () {
              getNavigation()(
                  context, const Bayes_Theorem_Example_Tree_First());
            }),
          ],
        ),
      );
    });
  }
}
