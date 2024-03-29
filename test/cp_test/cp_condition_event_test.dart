import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_sample_space.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  group('Conditional probability condition event selection: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      // To check if there are the right title, buttons and content in the homepage
      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);
      probQuery.mainEvent = E;

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Condition_Event(
        probQuery: probQuery,
      )));

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
      expect(find.text("select the condition event"), findsOneWidget);
      expect(
          find.text("hint: P(${probQuery.mainEvent!.id} | "), findsOneWidget);
      expect(find.text("Y"), findsOneWidget);
      expect(find.text(")"), findsOneWidget);

      // There should be 3 checkboxes to select one of the three events
      expect(find.byType(EventCheckBox), findsNWidgets(3));

      // There should be values for each of the checkboxes
      expect(find.text("E"), findsOneWidget);
      expect(find.text("F"), findsOneWidget);
      expect(find.text("G"), findsOneWidget);
    });

    // To test if a condition event is not null when users select an event
    // and directs to the page for selecting the main event sample space
    // for event E
    testWidgets('On selection event E: ', (WidgetTester tester) async {
      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);

      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Condition_Event(
        probQuery: probQuery,
      )));

      // Main event sub-sample space selection page should not be there before selecting one of the event
      expect(
          find.byType(Conditional_Probability_Main_Sample_Space), findsNothing);

      // Selects event E
      await tester.tap(find.widgetWithText(EventCheckBox, "E"));

      // Condition event is not null after selection
      expect(probQuery.conditionEvent, isNotNull);

      // Condition event should be E now
      expect(probQuery.conditionEvent, E);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Main event sub-sample space selection page should be there after selecting one of the event
      expect(find.byType(Conditional_Probability_Main_Sample_Space),
          findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To test if a condition event is not null when users select an event
    // and directs to the page for selecting the main event sample space
    // for event F
    testWidgets('On selection event F: ', (WidgetTester tester) async {
      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);

      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Condition_Event(
        probQuery: probQuery,
      )));

      // Main event sub-sample space selection page should not be there before selecting one of the event
      expect(
          find.byType(Conditional_Probability_Main_Sample_Space), findsNothing);

      // Selects event F
      await tester.tap(find.widgetWithText(EventCheckBox, "F"));

      // Condition event is not null after selection
      expect(probQuery.conditionEvent, isNotNull);

      // Condition event should be F now
      expect(probQuery.conditionEvent, F);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Main event sub-sample space selection page should be there after selecting one of the event
      expect(find.byType(Conditional_Probability_Main_Sample_Space),
          findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To test if a condition event is not null when users select an event
    // and directs to the page for selecting the main event sample space
    // for event G
    testWidgets('On selection event G: ', (WidgetTester tester) async {
      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);

      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Condition_Event(
        probQuery: probQuery,
      )));

      // Main event sub-sample space selection page should not be there before selecting one of the event
      expect(
          find.byType(Conditional_Probability_Main_Sample_Space), findsNothing);

      // Selects event G
      await tester.tap(find.widgetWithText(EventCheckBox, "G"));

      // Condition event is not null after selection
      expect(probQuery.conditionEvent, isNotNull);

      // Condition event should be G now
      expect(probQuery.conditionEvent, G);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Main event sub-sample space selection page should be there after selecting one of the event
      expect(find.byType(Conditional_Probability_Main_Sample_Space),
          findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
