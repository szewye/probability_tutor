import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:probability_tutor/homepage.dart';
import 'package:probability_tutor/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bayes' Theorem",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.apply(fontWeightDelta: 20, color: darkBlue),
            ),
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
          ],
        ),
      ),
    );
  }
}