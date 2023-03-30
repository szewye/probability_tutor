import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_home.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_home.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';
import 'package:probability_tutor/homepage.dart';

void main() {
  group('Homepage: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Homepage()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Probability Tutor'), findsOneWidget);
      expect(find.text('Monty Hall Problem'), findsOneWidget);
      expect(find.text('Conditional Probability'), findsOneWidget);
      expect(find.text("Bayes' Theorem"), findsOneWidget);
    });

    testWidgets('Monty Hall Problem: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Homepage()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.widgetWithText(MainPageButton, 'Monty Hall Problem'),
          findsOneWidget);
    });

    testWidgets('Conditional Probability: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Homepage()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.widgetWithText(MainPageButton, 'Conditional Probability'),
          findsOneWidget);
    });

    testWidgets('Bayes\' Theorem: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Homepage()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.widgetWithText(MainPageButton, 'Bayes\' Theorem'),
          findsOneWidget);
    });

    testWidgets('Monty Hall Problem button navigation: ',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Homepage()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text('Monty Hall Problem'), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byType(Monty_Hall), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('Conditional Probability button navigation: ',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Homepage()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text('Conditional Probability'),
          warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byType(Conditional_Probability_Home), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets("Bayes' Theorem button navigation: ",
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Homepage()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text("Bayes' Theorem"));
      await tester.pumpAndSettle();
      expect(find.byType(Bayes_Theorem), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
