import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_tree.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_simulation.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

class Bayes_Theorem_Example_Final extends StatelessWidget {
  const Bayes_Theorem_Example_Final({
    Key? key,
  }) : super(key: key);

  final String D = "1 person in 100 000 has a particular rare disease";
  final String TGivenD = "correct 99%";
  final String TGivenDContext = "someone with the disease";
  final String notTGivenNotD = "correct 99.5%";
  final String notTGivenNotDContext = "someone who does not have the disease";

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: lightYellow,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: darkBlue),
          actions: [
            Padding(
                padding: const EdgeInsets.all(10.0), child: BackHomeButton())
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
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: [
                            TextSpan(
                              text: "Suppose that ",
                            ),
                            TextSpan(
                                text: D, style: TextStyle(color: Colors.blue)),
                            TextSpan(
                                text:
                                    " for which there is a quite accurate diagnostic test:  \n • It is "),
                            TextSpan(
                                text: TGivenD,
                                style: TextStyle(color: Colors.red)),
                            TextSpan(text: " of the time when given to "),
                            TextSpan(
                                text: TGivenDContext,
                                style: TextStyle(color: Colors.red)),
                            TextSpan(text: " \n • It is "),
                            TextSpan(
                                text: notTGivenNotD,
                                style: TextStyle(color: Colors.green)),
                            TextSpan(text: " of the time when given to "),
                            TextSpan(
                                text: notTGivenNotDContext,
                                style: TextStyle(color: Colors.green)),
                            TextSpan(
                                text:
                                    "\n\n What is the probability that someone who tests positive for the disease actually has the disease?")
                          ],
                        ),
                      )),
                  SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      text: DFirstHalf,
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: <TextSpan>[
                        TextSpan(
                            text: DSecondHalf,
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
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
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  SizedBox(height: 45),
                  Text(
                      "to get the probability that someone who tests positive for the disease actually has the disease, P(D | T):"),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text("$pOfDGivenT =",
                              style: Theme.of(context).textTheme.bodyLarge)
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                pOfTGivenD,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.apply(color: Colors.red),
                              ),
                              Text(" × ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(
                                pOfD,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.apply(color: Colors.blue),
                              ),
                            ],
                          ),
                          Container(
                            height: 1,
                            color: darkBlue,
                            constraints: BoxConstraints(maxWidth: 300),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("[ "),
                              Text(
                                pOfTGivenD,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.apply(color: Colors.red),
                              ),
                              Text(" × ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(
                                pOfD,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.apply(color: Colors.blue),
                              ),
                              Text(" ] + [ ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(
                                pOfTGivenNotD,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.apply(color: Colors.purple),
                              ),
                              Text(" × ",
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(
                                pOfNotD,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.apply(color: Colors.teal),
                              ),
                              Text(
                                " ]",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("solution:"),
                          Container(
                            constraints: BoxConstraints(maxWidth: 460),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: darkBlue)),
                            child: Container(
                              constraints: BoxConstraints(maxWidth: 450),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  border: Border.all(color: darkBlue)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("$pOfDGivenT =",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge)
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            TDValue,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.apply(color: Colors.red),
                                          ),
                                          Text(" × ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                          Text(
                                            DValue,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.apply(color: Colors.blue),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 1,
                                        color: darkBlue,
                                        constraints:
                                            BoxConstraints(maxWidth: 300),
                                      ),
                                      Row(
                                        children: [
                                          Text("[ "),
                                          Text(
                                            TDValue,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.apply(color: Colors.red),
                                          ),
                                          Text(" × ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                          Text(
                                            DValue,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.apply(color: Colors.blue),
                                          ),
                                          Text(" ] + [ ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                          Text(
                                            TNotDValue,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.apply(color: Colors.purple),
                                          ),
                                          Text(" × ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge),
                                          Text(
                                            notDValue,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.apply(color: Colors.teal),
                                          ),
                                          Text(
                                            " ]",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text("= $DTValue"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      BinaryTreeView(),
                    ],
                  ),
                  SizedBox(height: 50),
                  NextButton(
                      title: "continue to the interactive simulation?",
                      onPress: () {
                        getNavigation()(context, Bayes_Theorem_Simulation());
                      }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
