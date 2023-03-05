import 'package:flutter/material.dart';
import 'package:probability_tutor/Monty_Hall_Problem/door.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate_bar.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Monty_Hall_Template extends StatelessWidget {
  // final Widget content;
  final String instruction;

  Monty_Hall_Template({Key? key, required this.instruction}) : super(key: key);

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
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // content,
                      DoorShape(),
                      SizedBox(width: 15),
                      DoorShape(),
                      SizedBox(width: 15),
                      DoorShape(),
                      SizedBox(width: 60),
                      Container(
                        padding: EdgeInsets.all(30),
                        constraints:
                            BoxConstraints(maxWidth: 380, maxHeight: 300),
                        decoration: BoxDecoration(
                          color: orangyRed,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 15,
                                offset: Offset(4, 8)),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Win rate",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.apply(color: offWhite, fontWeightDelta: 5),
                            ),
                            Text(
                              "(car : goat)",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.apply(color: offWhite.withOpacity(0.8)),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Change your choice",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.apply(
                                      color: offWhite,
                                      decoration: TextDecoration.underline),
                            ),
                            SizedBox(height: 5),
                            Win_Rate_Bar(winRate: 0.4),
                            SizedBox(height: 15),
                            Text(
                              "Keep your choice",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.apply(
                                      color: offWhite,
                                      decoration: TextDecoration.underline),
                            ),
                            SizedBox(height: 5),
                            Win_Rate_Bar(winRate: 0.28),
                          ],
                        ),
                      )
                    ],
                  ),
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
