import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_home.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_simulation.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';

void main() {
  group('Bayes\' homepage: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Bayes_Theorem()));
      expect(find.text("Bayes' Theorem"), findsOneWidget);
      expect(find.text('Formula'), findsOneWidget);
      expect(find.text('Example'), findsOneWidget);
      expect(find.text("Simulation"), findsOneWidget);
    });

    testWidgets('Formula: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Bayes_Theorem()));
      expect(find.widgetWithText(MainPageButton, 'Formula'), findsOneWidget);
    });

    testWidgets('Example: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Bayes_Theorem()));
      expect(find.widgetWithText(MainPageButton, 'Example'), findsOneWidget);
    });

    testWidgets('Simulation: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: Bayes_Theorem()));
      expect(find.widgetWithText(MainPageButton, 'Simulation'), findsOneWidget);
    });

    testWidgets('Formula button navigation: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Bayes_Theorem()));
      await tester.tap(find.text('Formula'), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byType(Bayes_Theorem_Formula), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('Example button navigation: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Bayes_Theorem()));
      await tester.tap(find.text('Example'), warnIfMissed: false);
      await tester.pumpAndSettle();
      expect(find.byType(Bayes_Theorem_Example_Quiz_One), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets("Simulation button navigation: ", (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(const MaterialApp(home: Bayes_Theorem()));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await tester.tap(find.text("Simulation"));
      await tester.pumpAndSettle();
      expect(find.byType(Bayes_Theorem_Simulation), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
