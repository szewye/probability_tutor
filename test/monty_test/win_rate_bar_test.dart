import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate_bar.dart';

void main() {
  group("WinRateBar: ", () {
    // To check the default win rate (50%) and the content
    testWidgets('Default win rate:', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: WinRateBar()));

      final finder = find.byType(WinRateBar);
      final widget = tester.widget<WinRateBar>(finder);

      expect(find.byType(WinRateBar), findsOneWidget);
      expect(widget.winRate, 0.5);

      // There should be two 50% text on the win rate bar by default as there is no game
      expect(find.textContaining('${(widget.winRate * 100).round()}%'),
          findsNWidgets(2));
    });

    // To check if sepecifying our own win rate updates the win rate bar
    testWidgets('Homemade win rate:', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: WinRateBar(
        winRate: 0.2,
      )));

      final finder = find.byType(WinRateBar);
      final widget = tester.widget<WinRateBar>(finder);

      expect(find.byType(WinRateBar), findsOneWidget);
      expect(widget.winRate, 0.2);

      // There should be a 20% on one side of the win rate bar
      expect(find.textContaining('${(widget.winRate * 100).round()}%'),
          findsOneWidget);

      // There should be a 80% on the other side of the win rate bar
      expect(find.textContaining('${((1 - widget.winRate) * 100).round()}%'),
          findsOneWidget);
    });
  });
}
