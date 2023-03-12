import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

// The win rate progression bar widget for the Monty Hall problem
// where users can keep track of the probability of them winning the game
// (updates everytime users play a new game)
class WinRateBar extends StatelessWidget {
  const WinRateBar({
    Key? key,
    this.winRate = 0.5, // original win rate being 50% for both goat and car
  }) : super(key: key);

  final double winRate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: 320,
            height: 45,
            decoration: const BoxDecoration(
              color: offWhite,
            )),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 45,
              width: winRate * 320,
              decoration: const BoxDecoration(
                color: lightBlue,
              ),
              child: Text(
                "car: ${(winRate * 100).round()}%",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.apply(color: darkBlue),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 45,
              width: (1.0 - winRate) * 320,
              child: (1.0 - winRate == 0)
                  ? Container()
                  : Text(
                      "goat: ${((1.0 - winRate) * 100).round()}%",
                      textAlign: TextAlign.center,
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
