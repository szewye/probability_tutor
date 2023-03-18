import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_final.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_template.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_tree.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

// The page for the second quiz for users
// Users can look at the binary tree given and pick the answer from the mcq
class Bayes_Theorem_Example_Tree_Second extends StatefulWidget {
  const Bayes_Theorem_Example_Tree_Second({super.key});

  @override
  _Bayes_Theorem_Example_Tree_Second createState() =>
      _Bayes_Theorem_Example_Tree_Second();
}

class _Bayes_Theorem_Example_Tree_Second
    extends State<Bayes_Theorem_Example_Tree_Second> {
  bool _notD = false;
  bool _TGivenNotD = false;
  bool _notTGivenD = false;
  bool mistake = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Bayes_Theorem_Example_Template(
        content: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  color: offWhite,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  const Text(
                      "we know that probability always add up to 1, hence we can compute a tree for the problem:"),
                  BinaryTreeView(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Title_Caption(caption: "what is P(¬D)?"),
            const SizedBox(height: 8),
            Text("select the correct answer",
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  Container(
                    color: mistake
                        ? orangyRed.withOpacity(0.9)
                        : Colors.transparent,
                    child: CheckboxListTile(
                      title: const Text(TNotDValue),
                      checkColor: darkBlue,
                      activeColor: offWhite,
                      checkboxShape: const CircleBorder(),
                      value: _TGivenNotD,
                      onChanged: (bool? value) {
                        setState(() {
                          _notD = false;
                          _TGivenNotD = value!;
                          _notTGivenD = false;
                          mistake = value;
                        });
                      },
                    ),
                  ),
                  CheckboxListTile(
                    title: const Text(notDValue),
                    checkColor: darkBlue,
                    activeColor: offWhite,
                    checkboxShape: const CircleBorder(),
                    value: _notD,
                    onChanged: (bool? value) {
                      setState(() {
                        _notD = value!;
                        _TGivenNotD = false;
                        _notTGivenD = false;
                        mistake = false;
                        getNavigation(duration: 800)(
                            context, const Bayes_Theorem_Example_Final());
                      });
                    },
                  ),
                  Container(
                    color: mistake
                        ? orangyRed.withOpacity(0.9)
                        : Colors.transparent,
                    child: CheckboxListTile(
                      title: const Text(notTDValue),
                      checkColor: darkBlue,
                      activeColor: offWhite,
                      checkboxShape: const CircleBorder(),
                      value: _notTGivenD,
                      onChanged: (bool? value) {
                        setState(() {
                          _notD = false;
                          _TGivenNotD = false;
                          _notTGivenD = value!;
                          mistake = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  (mistake) ? const Text("Try again?") : Container(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
