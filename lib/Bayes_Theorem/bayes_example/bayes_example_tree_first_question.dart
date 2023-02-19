import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_template.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_second_question.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_tree.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

class Bayes_Theorem_Example_Tree_First extends StatefulWidget {
  const Bayes_Theorem_Example_Tree_First({super.key});

  @override
  _Bayes_Theorem_Example_Tree_First createState() =>
      _Bayes_Theorem_Example_Tree_First();
}

class _Bayes_Theorem_Example_Tree_First
    extends State<Bayes_Theorem_Example_Tree_First> {
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
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: offWhite,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Text(
                      "we know that probability always add up to 1, hence we can compute a tree for the problem:"),
                  BinaryTreeView(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("what is P(T | ¬D)?",
                style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 8),
            Text("select the correct answer",
                style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 20),
            Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: Column(
                children: [
                  Container(
                    color: mistake
                        ? orangyRed.withOpacity(0.9)
                        : Colors.transparent,
                    child: CheckboxListTile(
                      title: Text(notDValue),
                      checkColor: darkBlue,
                      activeColor: offWhite,
                      checkboxShape: CircleBorder(),
                      value: _notD,
                      onChanged: (bool? value) {
                        setState(() {
                          _notD = value!;
                          _TGivenNotD = false;
                          _notTGivenD = false;
                          mistake = value;
                        });
                      },
                    ),
                  ),
                  CheckboxListTile(
                    title: Text(TNotDValue),
                    checkColor: darkBlue,
                    activeColor: offWhite,
                    checkboxShape: CircleBorder(),
                    value: _TGivenNotD,
                    onChanged: (bool? value) {
                      setState(() {
                        _notD = false;
                        _TGivenNotD = value!;
                        _notTGivenD = false;
                        mistake = false;
                      });
                    },
                  ),
                  Container(
                    color: mistake
                        ? orangyRed.withOpacity(0.9)
                        : Colors.transparent,
                    child: CheckboxListTile(
                      title: Text(notTDValue),
                      checkColor: darkBlue,
                      activeColor: offWhite,
                      checkboxShape: CircleBorder(),
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
                  SizedBox(height: 10),
                  (mistake) ? Text("Try again?") : Container(),
                ],
              ),
            ),
          ],
        ),
        onPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Bayes_Theorem_Example_Tree_Second()));
        },
      );
    });
  }
}
