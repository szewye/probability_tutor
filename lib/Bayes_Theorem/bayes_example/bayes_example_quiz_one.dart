import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_data.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
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

  Color _backgroundColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: darkBlue),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: BackHomeButton(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(pagePadding),
            constraints: BoxConstraints(maxWidth: pageConstraint),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Heading(title: "Bayes' Theorem Example"),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(color: offWhite),
                  padding: EdgeInsets.all(15),
                  child: Text(bayesExampleContext,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                SizedBox(height: 15),
                Text.rich(
                  TextSpan(
                    text: DFirstHalf,
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: DSecondHalf,
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: TFirstHalf,
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: TSecondHalf,
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                SizedBox(height: 120),
                Text("Identify what the question is asking for?",
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 8),
                Text("select the correct answer",
                    style: Theme.of(context).textTheme.bodyLarge),
                SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 300),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: Text(pOfDGivenT),
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
                      Container(
                        color: mistake
                            ? orangyRed.withOpacity(0.9)
                            : Colors.transparent,
                        child: CheckboxListTile(
                          title: Text(pOfTGivenD),
                          checkColor: darkBlue,
                          activeColor: offWhite,
                          checkboxShape: CircleBorder(),
                          value: _TGivenD,
                          onChanged: (bool? value) {
                            setState(() {
                              _TGivenD = value!;
                              _DGivenT = false;
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
                SizedBox(height: 80),
                NextButton(
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Bayes_Theorem_Example_Data()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
