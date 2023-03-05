import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

class DoorShape extends StatelessWidget {
  const DoorShape({
    Key? key,
    this.onPress,
  }) : super(key: key);

  final onPress;

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
            decoration: BoxDecoration(
              color: darkBlue,
              boxShadow: [
                BoxShadow(
                    color: darkBlue.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 15,
                    offset: Offset(8, 8)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              color: offWhite,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
