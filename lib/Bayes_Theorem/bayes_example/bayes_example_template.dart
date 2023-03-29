import 'package:flutter/material.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

// Template for bayes' theorem pages as most pages
// have the same base
class Bayes_Theorem_Example_Template extends StatelessWidget {
  final Widget content;

  Bayes_Theorem_Example_Template({Key? key, required this.content})
      : super(key: key);

  final String D = "1 person in 100000 has a particular rare disease";
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
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: const [
                        TextSpan(text: "From the scenario given: \n"),
                        TextSpan(
                            text: "$pOfD = $DValue",
                            style: TextStyle(color: Colors.blue)),
                        TextSpan(text: ", "),
                        TextSpan(
                            text: "$pOfTGivenD = $TDValue",
                            style: TextStyle(color: Colors.red)),
                        TextSpan(text: " and "),
                        TextSpan(
                            text: "$pOfNotTGivenNotD = $notTNotDValue",
                            style: TextStyle(color: Colors.green)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("using the Bayes' theorem formula: P(D | T) =",
                                style: Theme.of(context).textTheme.bodyLarge)
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
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
                              mainAxisSize: MainAxisSize.min,
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
                                Text(
                                  " ] + [ $pOfTGivenNotD × $pOfNotD ]",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                /*
                                  */
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  content,
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
