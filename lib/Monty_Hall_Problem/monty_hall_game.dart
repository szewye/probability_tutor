import 'package:flutter/material.dart';
import 'package:probability_tutor/Monty_Hall_Problem/door.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_simulation.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/monty_hall_button.dart';
import 'package:probability_tutor/font_style/heading.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/font_style/title_caption.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/models/monty_hall_problem/door.dart';
import 'package:probability_tutor/models/monty_hall_problem/system.dart';

// The page where users can play the game
// Users can either keep or change their choice
// All of the statistics will be updated every game user play
// Users can clearly see which strategy helps them win more
class Monty_Hall_Game extends StatefulWidget {
  final String instruction;
  System system;

  Monty_Hall_Game({Key? key})
      : system = System(),
        instruction = "Select a door to start the game!",
        super(key: key);

  @override
  State<Monty_Hall_Game> createState() => _Monty_Hall_Game();
}

class _Monty_Hall_Game extends State<Monty_Hall_Game> {
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
                      getNavigation()(context, Monty_Hall_Simulation());
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: offWhite,
                        padding: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "simulation",
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
                  const Heading(title: "Monty Hall Problem"),
                  const SizedBox(height: 10),
                  Text(
                    "Understand the Monty Hall problem with this game. \n Play at least 30 times to see which is the best action. Keep or change your choice?",
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
                  getInstructions(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  // Different instructions appear at different stage of game
  // Default is "Select a door to start the game!"
  // When player started the game, it will be "keep or change choices" buttons
  // When the game ended, "try again" button will appear
  Widget getInstructions() {
    if (widget.system.currentGameState == GameState.FIRST_SELECTION) {
      return Title_Caption(
        caption: widget.instruction,
      );
    } else if (widget.system.currentGameState == GameState.SECOND_SELECTION) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Do you want to",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
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
              const SizedBox(width: 15),
              const Text("or"),
              const SizedBox(width: 15),
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
            widget.system.currentGame.won
                ? "Congratulations, you won!"
                : "You lost...",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          MontyHallButton(
            title: "Play again?",
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

  // One of the door will be selected when pressed
  void onDoorPress(Door pressedDoor) {
    setState(() {
      widget.system.selectDoor(pressedDoor);
    });
  }

  // Number of doors on screen based on the system setup
  List<Widget> doorWidgets(List<Door> doors) {
    return doors
        .map<Widget>((Door d) => Padding(
              padding: const EdgeInsets.only(right: 15),
              child: DoorShape(
                door: d,
                onPress:
                    widget.system.currentGameState == GameState.FIRST_SELECTION
                        ? () => onDoorPress(d)
                        : null,
              ),
            ))
        .toList();
  }
}
