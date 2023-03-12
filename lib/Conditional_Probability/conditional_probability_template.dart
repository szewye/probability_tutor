import 'package:flutter/material.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

// Template for the conditional probability pages as most pages have the same base
class Conditional_Probability_Template extends StatelessWidget {
  final Widget content;
  final Widget samples;

  const Conditional_Probability_Template({
    Key? key,
    required this.content,
    required this.samples,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: offWhite,
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
                children: [
                  const Heading(title: "Conditional Probability"),
                  const Text(
                    "(the likelihood of an event occurring, based on a previous event having occurred in similar circumstances)",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        conditionalProbabilityContext,
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text.rich(
                        TextSpan(
                          text: EFirstHalf,
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: const <TextSpan>[
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
                          children: const <TextSpan>[
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
                          children: const <TextSpan>[
                            TextSpan(
                                text: GSecondHalf,
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(10),
                        constraints: const BoxConstraints(maxWidth: 500),
                        decoration: BoxDecoration(
                            // border: Border.all(color: darkBlue),
                            color: lightBlue.withOpacity(0.8)),
                        child: Column(
                          children: [const Text("Sample space, S"), samples],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
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
