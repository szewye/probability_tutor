import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_final.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_template.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Bayes_Theorem_Example_Tree extends StatelessWidget {
  Bayes_Theorem_Example_Tree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Bayes_Theorem_Example_Template(
        content: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: offWhite,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Text(
                      "we know that probability always add up to 1, hence we can compute a tree for the problem:"),
                  Text("*tree palceholder*"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("what is P(T | ¬D)?",
                style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 8),
            Text("select the value of it from the tree",
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        onPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Bayes_Theorem_Example_Final()));
        },
      );
    });
  }
}
