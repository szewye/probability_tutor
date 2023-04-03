import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_game.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_simulation.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';

void main() {
  group('Monty Hall Problem homepage: ', () {
    // To check if there are the right title and buttons in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      expect(find.text("Monty Hall Problem"), findsOneWidget);
      expect(find.text('Play'), findsOneWidget);
      expect(find.text('Simulate'), findsOneWidget);
    });

    // To check if play button is there
    testWidgets('Play: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      expect(find.widgetWithText(MainPageButton, 'Play'), findsOneWidget);
    });

    // To check if simulate button is there
    testWidgets('Simulate: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      expect(find.widgetWithText(MainPageButton, 'Simulate'), findsOneWidget);
    });

    // To check if play button navigates to the right page
    testWidgets('Play button navigation: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      await tester.tap(find.text('Play'), warnIfMissed: false);
      await tester.pumpAndSettle();

      // Game page should be there after clicking on the button
      expect(find.byType(Monty_Hall_Game), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To check if simulate button navigates to the right page
    testWidgets("Simulate button navigation: ", (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Monty_Hall()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text("Simulate"));
      await tester.pumpAndSettle();

      // Simulation page should be there after clicking on the button
      expect(find.byType(Monty_Hall_Simulation), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
