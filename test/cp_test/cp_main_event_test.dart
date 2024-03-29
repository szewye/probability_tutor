import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_event.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Conditional probability main event selection: ', () {
    // To check if there are the right title, buttons and content in the homepage
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

      // There should be 3 checkboxes to select one of the three events
      expect(find.byType(EventCheckBox), findsNWidgets(3));

      // There should be values for each of the checkboxes
      expect(find.text("E"), findsOneWidget);
      expect(find.text("F"), findsOneWidget);
      expect(find.text("G"), findsOneWidget);
    });

    // To test if a main event is not null when users select an event
    // and directs to the page for selecting the condition event
    // for event E
    testWidgets('On selection event E: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      await tester
          .pumpWidget(MaterialApp(home: Conditional_Probability_Main_Event()));

      // Condition event selection page should not be there before selecting one of the event
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsNothing);

      // Selects event E
      await tester.tap(find.widgetWithText(EventCheckBox, "E"));

      final widget = tester.widget<Conditional_Probability_Main_Event>(
          find.byType(Conditional_Probability_Main_Event));

      // Main event is not null after selection
      expect(widget.probQuery.mainEvent, isNotNull);

      // Main event should be E now
      expect(widget.probQuery.mainEvent, E);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Condition event selection page should be there after selecting one of the event
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To test if a main event is not null when users select an event
    // and directs to the page for selecting the condition event
    // for event F
    testWidgets('On selection event F: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      await tester
          .pumpWidget(MaterialApp(home: Conditional_Probability_Main_Event()));

      // Condition event selection page should not be there before selecting one of the event
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsNothing);

      // Selects event F
      await tester.tap(find.widgetWithText(EventCheckBox, "F"));

      final widget = tester.widget<Conditional_Probability_Main_Event>(
          find.byType(Conditional_Probability_Main_Event));

      // Main event is not null after selection
      expect(widget.probQuery.mainEvent, isNotNull);

      // Main event should be F now
      expect(widget.probQuery.mainEvent, F);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Condition event selection page should be there after selecting one of the event
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To test if a main event is not null when users select an event
    // and directs to the page for selecting the condition event
    // for event G
    testWidgets('On selection event G: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      await tester
          .pumpWidget(MaterialApp(home: Conditional_Probability_Main_Event()));

      // Condition event selection page should not be there before selecting one of the event
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsNothing);

      // Selects event G
      await tester.tap(find.widgetWithText(EventCheckBox, "G"));

      final widget = tester.widget<Conditional_Probability_Main_Event>(
          find.byType(Conditional_Probability_Main_Event));

      // Main event is not null after selection
      expect(widget.probQuery.mainEvent, isNotNull);

      // Main event should be G now
      expect(widget.probQuery.mainEvent, G);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Condition event selection page should be there after selecting one of the event
      expect(
          find.byType(Conditional_Probability_Condition_Event), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
