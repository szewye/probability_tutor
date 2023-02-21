import 'package:flutter/material.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

class Conditional_Probability_Template extends StatelessWidget {
  final Widget content;
  final onPress;

  const Conditional_Probability_Template({
    Key? key,
    required this.content,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: offWhite,
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
                children: [
                  Heading(title: "Conditional Probability"),
                  Text(
                      "(the likelihood of an event occurring, based on a previous event having occurred in similar circumstances)"),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Text(conditionalProbabilityContext,
                          style: Theme.of(context).textTheme.headlineSmall),
                      SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          text: EFirstHalf,
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: ESecondHalf,
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: FFirstHalf,
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: FSecondHalf,
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: GFirstHalf,
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: <TextSpan>[
                            TextSpan(
                                text: GSecondHalf,
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(10),
                        constraints: BoxConstraints(maxWidth: 500),
                        decoration:
                            BoxDecoration(border: Border.all(color: darkBlue)),
                        child: Column(
                          children: [
                            Text("Sample space, S"),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text("HHH",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("HHT",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("HTT",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("HTH",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("TTT",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("TTH",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("THH",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                                TextButton(
                                    onPressed: () {},
                                    child: Text("THT",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  content,
                  SizedBox(height: 20),
                  NextButton(onPress: onPress),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
