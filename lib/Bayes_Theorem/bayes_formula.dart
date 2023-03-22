import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

// The page where users can drag and drop the components
// that form the Bayes' theorem formula
class Bayes_Theorem_Formula extends StatefulWidget {
  @override
  _Bayes_Theorem_Formula createState() => _Bayes_Theorem_Formula();
}

class _Bayes_Theorem_Formula extends State<Bayes_Theorem_Formula> {
  final String _FGivenE = "P(F | E)";
  final String _FGivenNotE = "P(F | ¬E)";
  final String _E = "P(E)";
  final String _notE = "P(¬E)";

  String placeHolder1 = "";
  String placeHolder2 = "";
  String placeHolder3 = "";
  String placeHolder4 = "";
  String placeHolder5 = "";
  String placeHolder6 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightYellow,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: darkBlue),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  onPressed: () {
                    getNavigation()(context, Bayes_Theorem_Example_Quiz_One());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: offWhite,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "example",
                    style: TextStyle(color: darkBlue),
                  )),
            )
          ]),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Heading(title: "Bayes' Theorem"),
              Text(
                "Recall the formula",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.apply(color: darkBlue),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const Title_Caption(
                caption:
                    "Drag and drop from parts of the formula from below to the respective boxes.",
                captionColour: orangyRed,
              ),
              const SizedBox(height: 80),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "P(E | F) = ",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 650),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DragTarget<String>(
                              builder: (context, candidates, rejects) {
                                return Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: darkBlue),
                                  ),
                                  child: rejects.isNotEmpty
                                      ? const Text(
                                          'not acceptable',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: orangyRed),
                                        )
                                      : Text(placeHolder1),
                                );
                              },
                              onWillAccept: (data) {
                                return data == "P(F | E)" || data == "P(E)";
                              },
                              onAccept: (data) {
                                setState(() {
                                  placeHolder1 = data;
                                });
                              },
                            ),
                            const SizedBox(width: 5),
                            Text("\*",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: 5),
                            DragTarget<String>(
                              builder: (context, candidates, rejects) {
                                return Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: darkBlue),
                                  ),
                                  child: rejects.isNotEmpty
                                      ? const Text(
                                          'not acceptable',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: orangyRed),
                                        )
                                      : Text(placeHolder2),
                                );
                              },
                              onWillAccept: (data) {
                                return data == "P(F | E)" || data == "P(E)";
                              },
                              onAccept: (data) {
                                setState(() {
                                  placeHolder2 = data;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(color: darkBlue, height: 1.5),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("(",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: 5),
                            DragTarget<String>(
                              builder: (context, candidates, rejects) {
                                return Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: darkBlue),
                                  ),
                                  child: rejects.isNotEmpty
                                      ? const Text(
                                          'not acceptable',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: orangyRed),
                                        )
                                      : Text(placeHolder3),
                                );
                              },
                              onWillAccept: (data) {
                                return data == "P(F | E)" || data == "P(E)";
                              },
                              onAccept: (data) {
                                setState(() {
                                  placeHolder3 = data;
                                });
                              },
                            ),
                            const SizedBox(width: 5),
                            Text("\*",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: 5),
                            DragTarget<String>(
                              builder: (context, candidates, rejects) {
                                return Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: darkBlue),
                                  ),
                                  child: rejects.isNotEmpty
                                      ? const Text(
                                          'not acceptable',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: orangyRed),
                                        )
                                      : Text(placeHolder4),
                                );
                              },
                              onWillAccept: (data) {
                                return data == "P(F | E)" || data == "P(E)";
                              },
                              onAccept: (data) {
                                setState(() {
                                  placeHolder4 = data;
                                });
                              },
                            ),
                            const SizedBox(width: 5),
                            Text(")",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: 5),
                            Text("+",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: 5),
                            Text("(",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: 5),
                            DragTarget<String>(
                              builder: (context, candidates, rejects) {
                                return Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: darkBlue),
                                  ),
                                  child: rejects.isNotEmpty
                                      ? const Text(
                                          'not acceptable',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: orangyRed),
                                        )
                                      : Text(placeHolder5),
                                );
                              },
                              onWillAccept: (data) {
                                return data == "P(F | ¬E)" || data == "P(¬E)";
                              },
                              onAccept: (data) {
                                setState(() {
                                  placeHolder5 = data;
                                });
                              },
                            ),
                            const SizedBox(width: 5),
                            Text("\*",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                            const SizedBox(width: 5),
                            DragTarget<String>(
                              builder: (context, candidates, rejects) {
                                return Container(
                                  width: 120,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: darkBlue),
                                  ),
                                  child: rejects.isNotEmpty
                                      ? const Text(
                                          'not acceptable',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: orangyRed),
                                        )
                                      : Text(placeHolder6),
                                );
                              },
                              onWillAccept: (data) {
                                return data == "P(F | ¬E)" || data == "P(¬E)";
                              },
                              onAccept: (data) {
                                setState(() {
                                  placeHolder6 = data;
                                });
                              },
                            ),
                            const SizedBox(width: 5),
                            Text(")",
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 120),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Draggable<String>(
                      data: _FGivenE,
                      feedback: Text(_FGivenE,
                          style: Theme.of(context).textTheme.headlineSmall),
                      childWhenDragging: const Text(""),
                      child: Text(_FGivenE,
                          style: Theme.of(context).textTheme.headline6)),
                  const SizedBox(width: 35),
                  Draggable<String>(
                      data: _FGivenNotE,
                      feedback: Text(_FGivenNotE,
                          style: Theme.of(context).textTheme.headlineSmall),
                      childWhenDragging: const Text(""),
                      child: Text(_FGivenNotE,
                          style: Theme.of(context).textTheme.headline6)),
                  const SizedBox(width: 35),
                  Draggable<String>(
                      data: _notE,
                      feedback: Text(_notE,
                          style: Theme.of(context).textTheme.headlineSmall),
                      childWhenDragging: const Text(""),
                      child: Text(_notE,
                          style: Theme.of(context).textTheme.headline6)),
                  const SizedBox(width: 35),
                  Draggable<String>(
                      data: _E,
                      feedback: Text(_E,
                          style: Theme.of(context).textTheme.headlineSmall),
                      childWhenDragging: const Text(""),
                      child: Text(_E,
                          style: Theme.of(context).textTheme.headline6)),
                ],
              ),
              const SizedBox(height: 60),
              const BackHomeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
