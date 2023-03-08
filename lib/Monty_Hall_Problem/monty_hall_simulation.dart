import 'package:flutter/material.dart';
import 'package:probability_tutor/Monty_Hall_Problem/door.dart';
import 'package:probability_tutor/Monty_Hall_Problem/dropdown_selection.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_game.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/monty_hall_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/models/monty_hall_problem/door.dart';
import 'package:probability_tutor/models/monty_hall_problem/game.dart';
import 'package:probability_tutor/models/monty_hall_problem/system.dart';

class Monty_Hall_Simulation extends StatefulWidget {
  System system;

  Monty_Hall_Simulation({Key? key})
      : system = System(),
        super(key: key);

  @override
  State<Monty_Hall_Simulation> createState() => _Monty_Hall_Simulation();
}

class _Monty_Hall_Simulation extends State<Monty_Hall_Simulation> {
  // Initial selected value for the first dropdown menu
  int roundsValue = 50;
  // List of items in the first dropdown menu
  List<int> rounds = [10, 20, 50, 100, 500, 1000];
  // Initial selected value for the second dropdown menu
  String actionValue = "keep your choice";
  // List of actions in the second dropdown menu
  List<String> action = ["keep your choice", "change your choice"];

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
              padding: const EdgeInsets.all(10.0),
              child: BackHomeButton(),
            )
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
                  Heading(title: "Monty Hall Simulation"),
                  SizedBox(height: 10),
                  Text(
                    "Understand the Monty Hall problem with this game. \n Use the simulation and see which is the best action. Keep or change your choice?",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: doorWidgets(widget.system.doors)
                      ..addAll(
                        [SizedBox(width: 45), WinRate(system: widget.system)],
                      ),
                  ),
                  SizedBox(height: 45),
                  getInstructions(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  // Different instructions appear at different stage of the simulation
  Widget getInstructions() {
    if (widget.system.currentGameState == GameState.FIRST_SELECTION) {
      return Column(
        children: [
          Title_Caption(
            caption: "Select how many times you want the system to play:",
            captionColour: darkBlue,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DropDown(
                width: 80,
                height: 40,
                initialValue: roundsValue,
                items: rounds.map((int roundValue) {
                  return DropdownMenuItem(
                    value: roundValue,
                    child: Text(
                      "$roundValue",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: offWhite),
                    ),
                  );
                }).toList(),
                onPress: (int? newValue) {
                  setState(
                    () {
                      roundsValue = newValue!;
                    },
                  );
                },
              ),
              SizedBox(width: 15),
              Text("times and"),
              SizedBox(width: 15),
              DropDown(
                width: 180,
                height: 40,
                initialValue: actionValue,
                items: action.map((String actionValue) {
                  return DropdownMenuItem(
                    value: actionValue,
                    child: Text(
                      "$actionValue",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.apply(color: offWhite),
                    ),
                  );
                }).toList(),
                onPress: (String? newValue) {
                  setState(
                    () {
                      actionValue = newValue!;
                    },
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              keepAllChoice(10);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: orangyRed,
                padding: const EdgeInsets.fromLTRB(30, 18, 30, 18),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              "start simulation",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.apply(color: offWhite),
            ),
          ),
        ],
      );
    } else if (widget.system.currentGameState == GameState.SECOND_SELECTION) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Do you want to",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MontyHallButton(
                title: "Keep your choice?",
                onPress: () {
                  setState(() {
                    widget.system.keepChoice();
                  });
                },
              ),
              SizedBox(width: 15),
              Text("or"),
              SizedBox(width: 15),
              MontyHallButton(
                title: "Change your choice?",
                onPress: () {
                  setState(() {
                    widget.system.changeChoice();
                  });
                },
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${widget.system.currentGame.won ? "Congratulations, you won!" : "You lost..."}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 10),
          MontyHallButton(
            title: "Play again",
            onPress: () {
              setState(() {
                widget.system.beginNewGame();
              });
            },
          ),
        ],
      );
    }
  }

  // Number of doors on screen based on the system setup
  List<Widget> doorWidgets(List<Door> doors) {
    return doors
        .map<Widget>((Door d) => Padding(
              padding: const EdgeInsets.only(right: 15),
              child: DoorShape(
                door: d,
                onPress: null,
              ),
            ))
        .toList();
  }

  // If user choose to keep the choice for all games in the simulation
  void keepAllChoice(int numberOfSimulation) async {
    for (int i = 0; i < numberOfSimulation; ++i) {
      setState(() {
        widget.system.selectRandomFirstDoor();
      });

      setState(() {
        widget.system.randomOpenDoor();
      });

      setState(() {
        widget.system.keepChoice();
      });

      setState(() {
        widget.system.openAllDoors();
      });

      setState(() {
        widget.system.gameEnded();
      });

      await Future.delayed(Duration(milliseconds: 500));
    }
  }

  // If user choose to change the choice for all games in the simulation
  void changeAllChoice(int numberOfSimulation) {
    widget.system.selectRandomFirstDoor();
    widget.system.randomOpenDoor();
    widget.system.changeChoice();
    widget.system.openAllDoors();
    widget.system.gameEnded();
  }
}
