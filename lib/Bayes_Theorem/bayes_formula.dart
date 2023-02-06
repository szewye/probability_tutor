import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';
import 'package:probability_tutor/titles.dart';

class Bayes_Theorem_Formula extends StatefulWidget {
  @override
  _Bayes_Theorem_Formula createState() => _Bayes_Theorem_Formula();
}

class _Bayes_Theorem_Formula extends State<Bayes_Theorem_Formula> {
  String _FGivenE = "P(F | E)";
  String _FGivenNotE = "P(F | ¬E)";
  String _E = "P(E)";
  String _notE = "P(¬E)";
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
      appBar:
          AppBar(backgroundColor: Colors.transparent, elevation: 0, actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Bayes_Theorem_Example()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: offWhite,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Text(
                "example",
                style: TextStyle(color: darkBlue),
              )),
        )
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Titles(title: "Bayes' Theorem"),
            const SizedBox(height: 10),
            Text(
              "Recall the formula",
              style:
                  Theme.of(context).textTheme.headline4?.apply(color: darkBlue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              "Drag and drop from parts of the formula from below to the respective boxes.",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.apply(color: orangyRed),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 80),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "P(E | F) = ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 650),
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
                                child: rejects.isNotEmpty
                                    ? Text(
                                        'not acceptable',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: orangyRed),
                                      )
                                    : Text(placeHolder1),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: darkBlue),
                                ),
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
                          SizedBox(width: 5),
                          Text("\*",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SizedBox(width: 5),
                          DragTarget<String>(
                            builder: (context, candidates, rejects) {
                              return Container(
                                width: 120,
                                height: 60,
                                child: rejects.isNotEmpty
                                    ? Text(
                                        'not acceptable',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: orangyRed),
                                      )
                                    : Text(placeHolder2),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: darkBlue),
                                ),
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
                      SizedBox(height: 10),
                      Container(color: darkBlue, height: 1.5),
                      SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("(",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SizedBox(width: 5),
                          DragTarget<String>(
                            builder: (context, candidates, rejects) {
                              return Container(
                                width: 120,
                                height: 60,
                                child: rejects.isNotEmpty
                                    ? Text(
                                        'not acceptable',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: orangyRed),
                                      )
                                    : Text(placeHolder3),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: darkBlue),
                                ),
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
                          SizedBox(width: 5),
                          Text("\*",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SizedBox(width: 5),
                          DragTarget<String>(
                            builder: (context, candidates, rejects) {
                              return Container(
                                width: 120,
                                height: 60,
                                child: rejects.isNotEmpty
                                    ? Text(
                                        'not acceptable',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: orangyRed),
                                      )
                                    : Text(placeHolder4),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: darkBlue),
                                ),
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
                          SizedBox(width: 5),
                          Text(")",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SizedBox(width: 5),
                          Text("+",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SizedBox(width: 5),
                          Text("(",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SizedBox(width: 5),
                          DragTarget<String>(
                            builder: (context, candidates, rejects) {
                              return Container(
                                width: 120,
                                height: 60,
                                child: rejects.isNotEmpty
                                    ? Text(
                                        'not acceptable',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: orangyRed),
                                      )
                                    : Text(placeHolder5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: darkBlue),
                                ),
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
                          SizedBox(width: 5),
                          Text("\*",
                              style: Theme.of(context).textTheme.headlineSmall),
                          SizedBox(width: 5),
                          DragTarget<String>(
                            builder: (context, candidates, rejects) {
                              return Container(
                                width: 120,
                                height: 60,
                                child: rejects.isNotEmpty
                                    ? Text(
                                        'not acceptable',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: orangyRed),
                                      )
                                    : Text(placeHolder6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(color: darkBlue),
                                ),
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
                          SizedBox(width: 5),
                          Text(")",
                              style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 120),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Draggable<String>(
                    data: _FGivenE,
                    child: Text(_FGivenE,
                        style: Theme.of(context).textTheme.headline6),
                    feedback: Text(_FGivenE,
                        style: Theme.of(context).textTheme.headlineSmall),
                    childWhenDragging: Text("")),
                SizedBox(width: 35),
                Draggable<String>(
                    data: _FGivenNotE,
                    child: Text(_FGivenNotE,
                        style: Theme.of(context).textTheme.headline6),
                    feedback: Text(_FGivenNotE,
                        style: Theme.of(context).textTheme.headlineSmall),
                    childWhenDragging: Text("")),
                SizedBox(width: 35),
                Draggable<String>(
                    data: _notE,
                    child: Text(_notE,
                        style: Theme.of(context).textTheme.headline6),
                    feedback: Text(_notE,
                        style: Theme.of(context).textTheme.headlineSmall),
                    childWhenDragging: Text("")),
                SizedBox(width: 35),
                Draggable<String>(
                    data: _E,
                    child:
                        Text(_E, style: Theme.of(context).textTheme.headline6),
                    feedback: Text(_E,
                        style: Theme.of(context).textTheme.headlineSmall),
                    childWhenDragging: Text("")),
              ],
            ),
            SizedBox(height: 120),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                child: Text(
                  "back to home page",
                  style: Theme.of(context).textTheme.bodySmall?.apply(
                        fontWeightDelta: 20,
                        color: darkBlue,
                        decoration: TextDecoration.underline,
                      ),
                )),
          ],
        ),
      ),
    );
  }
}
