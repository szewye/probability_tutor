import 'package:flutter/material.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Monty_Hall_Template extends StatelessWidget {
  final Widget content;
  final String instruction;

  Monty_Hall_Template(
      {Key? key, required this.content, required this.instruction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: lightBlue,
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
                  Heading(title: "Monty Hall Problem"),
                  SizedBox(height: 10),
                  Text(
                    "Understand the Monty Hall problem with this game, play at least 20 times to see which is the best choice? \n Keep or change your choice?",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  content,
                  SizedBox(height: 50),
                  Title_Caption(
                    caption: instruction,
                    captionColour: darkBlue,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
