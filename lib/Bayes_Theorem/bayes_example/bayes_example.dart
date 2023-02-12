import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';
import 'package:probability_tutor/font_style/heading.dart';

class Bayes_Theorem_Example_Quiz_One extends StatefulWidget {
  @override
  _Bayes_Theorem_Example_Quiz_One_State createState() =>
      _Bayes_Theorem_Example_Quiz_One_State();
}

class _Bayes_Theorem_Example_Quiz_One_State
    extends State<Bayes_Theorem_Example_Quiz_One> {
  bool _DGivenT = false;
  bool _TGivenD = false;
  bool mistake = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(50),
            constraints: BoxConstraints(maxWidth: 1200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Heading(title: "Bayes' Theorem Example"),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(color: offWhite),
                  padding: EdgeInsets.all(15),
                  child: Text(
                      "Suppose that 1 person in 100 000 has a particular rare disease for which there is a quite accurate diagnostic test: \n • It is correct 99% of the time when given to someone with the disease. \n • It is correct 99.5% of the time when given to someone who does not have the disease. \n\n What is the probability that someone who tests positive for the disease actually has the disease?",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text: 'Let D be the event of be the event that a person ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'has the disease',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Let T be the event that a person ',
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'tests positive for the disease',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 200),
                Text(
                  "Identify what the question is asking for?",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 8),
                Title_Caption(caption: "select the correct answer"),
                SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: Text("P (D | T)"),
                        checkColor: darkBlue,
                        activeColor: offWhite,
                        checkboxShape: CircleBorder(),
                        value: _DGivenT,
                        onChanged: (bool? value) {
                          setState(() {
                            _DGivenT = value!;
                            _TGivenD = false;
                            mistake = false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text("P (T | D)"),
                        checkColor: offWhite,
                        activeColor: _TGivenD ? orangyRed : offWhite,
                        checkboxShape: CircleBorder(),
                        value: _TGivenD,
                        onChanged: (bool? value) {
                          setState(() {
                            _DGivenT = false;
                            _TGivenD = value!;
                            mistake = true;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      (mistake)
                          ? Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: orangyRed.withOpacity(0.8),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Text("Try again?",
                                  style: TextStyle(color: offWhite)))
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(height: 150),
                BackHomeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
