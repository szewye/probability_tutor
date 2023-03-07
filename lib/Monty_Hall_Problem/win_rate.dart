import 'package:flutter/material.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate_bar.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/models/monty_hall_problem/game.dart';
import 'package:probability_tutor/models/monty_hall_problem/system.dart';

class WinRate extends StatelessWidget {
  WinRate({super.key, required this.system});

  System system;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      constraints: BoxConstraints(maxWidth: 380, maxHeight: 320),
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
            style:
                Theme.of(context).textTheme.bodyMedium?.apply(color: offWhite),
          ),
          SizedBox(height: 10),
          Text(
            "Change your choice",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.apply(color: offWhite, decoration: TextDecoration.underline),
          ),
          SizedBox(height: 2),
          Win_Rate_Bar(winRate: winRate(true)),
          SizedBox(height: 15),
          Text(
            "Keep your choice",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.apply(color: offWhite, decoration: TextDecoration.underline),
          ),
          SizedBox(height: 2),
          Win_Rate_Bar(winRate: winRate(false)),
          SizedBox(height: 20),
          Text(
            "Total game(s) played: ${system.games.length}",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.apply(color: offWhite, fontWeightDelta: 5),
          ),
        ],
      ),
    );
  }

  // To calculate the win rate bar for keeping and changing choices
  double winRate(bool changedChoice) {
    final numberOfGames = system.games
        .where((Game element) => element.changed == changedChoice)
        .length;

    if (numberOfGames == 0) return 0.5;

    final won = system.games
        .where(
            (Game element) => element.changed == changedChoice && element.won)
        .length;

    return won.toDouble() / numberOfGames.toDouble();
  }
}
