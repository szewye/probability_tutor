import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_data.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: darkBlue),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: BackHomeButton(),
          )
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
                  child: Text(bayesExampleContext,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
                const SizedBox(height: 15),
                Text.rich(
                  TextSpan(
                    text: DFirstHalf,
                    style: Theme.of(context).textTheme.bodyLarge,
                    children: const <TextSpan>[
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
                    children: const <TextSpan>[
                      TextSpan(
                          text: TSecondHalf,
                          style:
                              TextStyle(decoration: TextDecoration.underline)),
                    ],
                  ),
                ),
                const SizedBox(height: 120),
                const Title_Caption(
                  caption: "Identify what the question is asking for?",
                ),
                const SizedBox(height: 8),
                Text("select the correct answer",
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Column(
                    children: [
                      CheckboxListTile(
                        title: const Text(pOfDGivenT),
                        checkColor: darkBlue,
                        activeColor: offWhite,
                        checkboxShape: const CircleBorder(),
                        value: _DGivenT,
                        onChanged: (bool? value) {
                          setState(() {
                            _DGivenT = value!;
                            _TGivenD = false;
                            mistake = false;
                            getNavigation(duration: 800)(
                                context, Bayes_Theorem_Example_Data());
                          });
                        },
                      ),
                      Container(
                        color: mistake
                            ? orangyRed.withOpacity(0.9)
                            : Colors.transparent,
                        child: CheckboxListTile(
                          title: const Text(pOfTGivenD),
                          checkColor: darkBlue,
                          activeColor: offWhite,
                          checkboxShape: const CircleBorder(),
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
                      const SizedBox(height: 10),
                      (mistake) ? const Text("Try again?") : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
