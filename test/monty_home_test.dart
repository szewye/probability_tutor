import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_game.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_simulation.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';

void main() {
  group('Monty Hall Problem homepage: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      expect(find.text("Monty Hall Problem"), findsOneWidget);
      expect(find.text('Play'), findsOneWidget);
      expect(find.text('Simulate'), findsOneWidget);
    });

    testWidgets('Play: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      expect(find.widgetWithText(MainPageButton, 'Play'), findsOneWidget);
    });

    testWidgets('Simulate: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      expect(find.widgetWithText(MainPageButton, 'Simulate'), findsOneWidget);
    });

    testWidgets('Play button navigation: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      await tester.tap(find.text('Play'), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byType(Monty_Hall_Game), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets("Simulate button navigation: ", (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text("Simulate"));
      await tester.pumpAndSettle();
      expect(find.byType(Monty_Hall_Simulation), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
