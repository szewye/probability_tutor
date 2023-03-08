import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/models/monty_hall_problem/door.dart';
import 'package:lottie/lottie.dart';

class DoorShape extends StatelessWidget {
  const DoorShape({
    Key? key,
    this.onPress,
    required this.door,
  }) : super(key: key);

  final onPress;
  final Door door;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            width: 200,
            height: 400,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: getDoorColour(door.stateOfDoor),
              boxShadow: [
                BoxShadow(
                  color: darkBlue.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 15,
                ),
              ],
            ),
            child:
                door.stateOfDoor == DoorState.OPENED ? getPrize() : Container(),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: getDoorknobColour(door.stateOfDoor),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }

  // Show prize behind door when door is open
  LottieBuilder getPrize() {
    if (door.prizeBehindTheDoor == Prize.CAR) {
      return LottieBuilder.asset(
        "assets/car.json",
        fit: BoxFit.fitWidth,
        animate: false,
      );
    } else {
      return LottieBuilder.asset(
        "assets/sheep.json",
        fit: BoxFit.fitWidth,
        animate: false,
      );
    }
  }

  // Different colours of door indicates the different state of the door
  Color getDoorColour(DoorState state) {
    if (state == DoorState.CLOSED) {
      return offWhite;
    } else if (state == DoorState.SELECTED) {
      return darkBlue.withOpacity(0.7);
    } else {
      return offWhite.withOpacity(0.3);
    }
  }

  // Different colours of doorknob
  Color getDoorknobColour(DoorState state) {
    if (state == DoorState.CLOSED) {
      return darkBlue;
    } else if (state == DoorState.SELECTED) {
      return offWhite;
    } else {
      return Colors.transparent;
    }
  }
}
