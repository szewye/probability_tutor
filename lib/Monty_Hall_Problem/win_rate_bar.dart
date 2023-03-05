import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

class Win_Rate_Bar extends StatelessWidget {
  const Win_Rate_Bar({
    Key? key,
    this.winRate = 0.5,
  }) : super(key: key);

  final double winRate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 300,
            height: 45,
            decoration: BoxDecoration(
              color: offWhite,
            )),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 45,
              width: winRate * 300,
              decoration: BoxDecoration(
                color: lightBlue,
              ),
              child: Text("${(winRate * 100).round()}%"),
            ),
            Container(
              alignment: Alignment.center,
              height: 45,
              width: (1.0 - winRate) * 300,
              child: Text("${((1.0 - winRate) * 100).round()}%"),
            ),
          ],
        ),
      ],
    );
  }
}
