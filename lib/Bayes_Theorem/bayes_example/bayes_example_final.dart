import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_tree.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_simulation.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

// The page with how we come to the solution for the example
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
          iconTheme: const IconThemeData(color: darkBlue),
          actions: const [
            Padding(padding: EdgeInsets.all(10.0), child: BackHomeButton())
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(pagePadding),
              constraints: const BoxConstraints(maxWidth: pageConstraint),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Heading(title: "Bayes' Theorem Example"),
                  const SizedBox(height: 30),
                  Container(
                      decoration: const BoxDecoration(color: offWhite),
                      padding: const EdgeInsets.all(15),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: [
                            const TextSpan(
                              text: "Suppose that ",
                            ),
                            TextSpan(
                                text: D,
                                style: const TextStyle(color: Colors.blue)),
                            const TextSpan(
                                text:
                                    " for which there is a quite accurate diagnostic test:  \n • It is "),
                            TextSpan(
                                text: TGivenD,
                                style: const TextStyle(color: Colors.red)),
                            const TextSpan(text: " of the time when given to "),
                            TextSpan(
                                text: TGivenDContext,
                                style: const TextStyle(color: Colors.red)),
                            const TextSpan(text: " \n • It is "),
                            TextSpan(
                                text: notTGivenNotD,
                                style: const TextStyle(color: Colors.green)),
                            const TextSpan(text: " of the time when given to "),
                            TextSpan(
                                text: notTGivenNotDContext,
                                style: const TextStyle(color: Colors.green)),
                            const TextSpan(
                                text:
                                    "\n\n What is the probability that someone who tests positive for the disease actually has the disease?")
                          ],
                        ),
                      )),
                  const SizedBox(height: 15),
                  Text.rich(
                    TextSpan(
                      text: DFirstHalf,
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: const <TextSpan>[
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
                      children: const <TextSpan>[
                        TextSpan(
                            text: TSecondHalf,
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 45),
                  const Text(
                      "to get the probability that someone who tests positive for the disease actually has the disease, P(D | T):"),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("$pOfDGivenT =",
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                        const SizedBox(width: 10),
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
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
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
                              constraints: const BoxConstraints(maxWidth: 300),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("[ "),
                                Text(
                                  pOfTGivenD,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.apply(color: Colors.red),
                                ),
                                Text(" × ",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                Text(
                                  pOfD,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.apply(color: Colors.blue),
                                ),
                                Text(" ] + [ ",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                Text(
                                  pOfTGivenNotD,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.apply(color: Colors.purple),
                                ),
                                Text(" × ",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
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
                  ),
                  const SizedBox(height: 50),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("solution:"),
                            Container(
                              width: 460,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: darkBlue)),
                              child: Container(
                                width: 450,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: darkBlue)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("$pOfDGivenT =",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge)
                                      ],
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                          constraints: const BoxConstraints(
                                              maxWidth: 300),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text("[ "),
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
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
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
                  ),
                  const SizedBox(height: 50),
                  NextButton(
                      title: "continue to the interactive simulation?",
                      onPress: () {
                        getNavigation()(
                            context, const Bayes_Theorem_Simulation());
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
