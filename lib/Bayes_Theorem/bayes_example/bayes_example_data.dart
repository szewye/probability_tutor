import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_template.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_first_question.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

class Bayes_Theorem_Example_Data extends StatelessWidget {
  Bayes_Theorem_Example_Data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Bayes_Theorem_Example_Template(
        content: Column(
          children: [
            Title_Caption(
                caption: "How do we get $pOfTGivenNotD and $pOfNotD?"),
            SizedBox(height: 10),
            Text(
              "Click next to compute a tree using the data given from the scenario!",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(height: 50),
          ],
        ),
        onPress: () {
          getNavigation()(context, Bayes_Theorem_Example_Tree_First());
        },
      );
    });
  }
}
