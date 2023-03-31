import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_event.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  group('Conditional probability main event selection: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: Conditional_Probability_Main_Event()));
      expect(find.text("Conditional Probability"), findsOneWidget);
      expect(
          find.text(
            "(the likelihood of an event occurring, based on a previous event having occurred in similar circumstances)",
          ),
          findsOneWidget);
      expect(find.text("Sample space, S"), findsOneWidget);
      expect(find.text(conditionalProbabilityContext), findsOneWidget);
      expect(find.text(EFirstHalf + ESecondHalf), findsOneWidget);
      expect(find.text(FFirstHalf + FSecondHalf), findsOneWidget);
      expect(find.text(GFirstHalf + GSecondHalf), findsOneWidget);
      expect(find.text("select a main event"), findsOneWidget);
      expect(find.text("hint: P("), findsOneWidget);
      expect(find.text("X"), findsOneWidget);
      expect(find.text(" | Y)"), findsOneWidget);

      expect(find.byType(EventCheckBox), findsNWidgets(3));
      expect(find.text("E"), findsOneWidget);
      expect(find.text("F"), findsOneWidget);
      expect(find.text("G"), findsOneWidget);
    });

    testWidgets('On selection event E: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester
          .pumpWidget(MaterialApp(home: Conditional_Probability_Main_Event()));
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsNothing);

      await tester.tap(find.widgetWithText(EventCheckBox, "E"));

      final widget = tester.widget<Conditional_Probability_Main_Event>(
          find.byType(Conditional_Probability_Main_Event));

      expect(widget.probQuery.mainEvent, isNotNull);
      expect(widget.probQuery.mainEvent, E);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('On selection event F: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester
          .pumpWidget(MaterialApp(home: Conditional_Probability_Main_Event()));
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsNothing);

      await tester.tap(find.widgetWithText(EventCheckBox, "F"));

      final widget = tester.widget<Conditional_Probability_Main_Event>(
          find.byType(Conditional_Probability_Main_Event));

      expect(widget.probQuery.mainEvent, isNotNull);
      expect(widget.probQuery.mainEvent, F);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('On selection event G: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester
          .pumpWidget(MaterialApp(home: Conditional_Probability_Main_Event()));
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsNothing);

      await tester.tap(find.widgetWithText(EventCheckBox, "G"));

      final widget = tester.widget<Conditional_Probability_Main_Event>(
          find.byType(Conditional_Probability_Main_Event));

      expect(widget.probQuery.mainEvent, isNotNull);
      expect(widget.probQuery.mainEvent, G);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
