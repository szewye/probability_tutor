import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate_bar.dart';
import 'package:probability_tutor/models/monty_hall_problem/system.dart';

void main() {
  group("WinRate: ", () {
    // To check the default win rate (50%) and the content
    testWidgets('Default:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: WinRate(
        system: System(),
      )));

      final finder = find.byType(WinRate);
      final widget = tester.widget<WinRate>(finder);

      expect(find.text("Win rate"), findsOneWidget);
      expect(find.text("(car : goat)"), findsOneWidget);

      expect(find.text("Change your choice"), findsOneWidget);
      expect(find.text("Keep your choice"), findsOneWidget);

      expect(find.textContaining('Game(s) won: '), findsAtLeastNWidgets(2));
      expect(find.textContaining('Game(s) played: '), findsAtLeastNWidgets(2));

      // There should be 2 win rate bar, one for each strategy
      expect(find.byType(WinRateBar), findsNWidgets(2));

      expect(
          find.textContaining(
              'Total game(s) played: ${(widget.system.games.length)}'),
          findsOneWidget);
    });
  });
}
