import 'package:flutter/material.dart';
import 'package:probability_tutor/Monty_Hall_Problem/door.dart';
import 'package:probability_tutor/Monty_Hall_Problem/dropdown_selection.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_game.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/models/monty_hall_problem/door.dart';
import 'package:probability_tutor/models/monty_hall_problem/system.dart';

// The page where users can select how many times they want the system to play
// and which strategy to use (keep or change choice)
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
  int roundsValue = 20;
  // List of items in the first dropdown menu
  List<int> rounds = [10, 20, 50, 100, 200, 500, 1000];
  // Users pick to keep or change their choice
  bool shouldKeepChoices = true;
  // List of actions in the second dropdown menu
  List<String> actions = ["keep your choice", "change your choice"];
  // To show simulation drop down boxes or not
  bool hideSimulationSelection = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: darkBlue),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      getNavigation()(context, Monty_Hall_Game());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: offWhite,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "game",
                      style: TextStyle(color: darkBlue),
                    ),
                  ),
                  const BackHomeButton()
                ],
              ),
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
                  const Heading(title: "Monty Hall Simulation"),
                  const SizedBox(height: 10),
                  Text(
                    "Understand the Monty Hall problem with this game. \n Use the simulation and see which is the best action. Keep or change your choice?",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: doorWidgets(widget.system.doors)
                        ..addAll(
                          [
                            const SizedBox(width: 45),
                            WinRate(system: widget.system)
                          ],
                        ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  hideSimulationSelection
                      ? Column(
                          children: const [
                            Title_Caption(
                              caption: "Simulation running...",
                            ),
                            SizedBox(height: 10),
                            Text("Keep an eye on the win rate 😉")
                          ],
                        )
                      : Column(
                          children: [
                            const Title_Caption(
                              caption:
                                  "Select how many times you want the system to play:",
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DropDown(
                                  width: 80,
                                  height: 40,
                                  value: roundsValue,
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
                                    if (newValue != null) {
                                      setState(() {
                                        roundsValue = newValue;
                                      });
                                    }
                                  },
                                ),
                                const SizedBox(width: 15),
                                const Text("times and"),
                                const SizedBox(width: 15),
                                DropDown(
                                  width: 180,
                                  height: 40,
                                  value: getChoiceString(),
                                  items: actions.map((String actionValue) {
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
                                    setState(() {
                                      if (newValue != null) {
                                        setChoice(newValue);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  hideSimulationSelection = true;
                                });
                                await simulate(roundsValue, shouldKeepChoices);
                                setState(() {
                                  hideSimulationSelection = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: orangyRed,
                                padding:
                                    const EdgeInsets.fromLTRB(30, 18, 30, 18),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text(
                                "start simulation",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.apply(color: offWhite),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  // Get "keep your choice" or "change your choice" string
  String getChoiceString() {
    return shouldKeepChoices ? actions[0] : actions[1];
  }

  // Set the simulation to keep or change choice
  void setChoice(String newValue) {
    shouldKeepChoices = newValue == actions[0];
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

  // If user choose to keep or change the choice for all games in the simulation
  Future<void> simulate(int numberOfSimulation, bool keepChoice) async {
    for (int i = 0; i < numberOfSimulation; ++i) {
      setState(() {
        widget.system.selectRandomFirstDoor();
      });

      await Future.delayed(const Duration(milliseconds: 100));

      setState(() {
        if (keepChoice) {
          widget.system.keepChoice();
        } else {
          widget.system.changeChoice();
        }
      });

      await Future.delayed(const Duration(milliseconds: 100));

      setState(() {
        widget.system.beginNewGame();
      });
    }
  }
}
