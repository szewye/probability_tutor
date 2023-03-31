import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_event.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  group('Conditional probability condition event selection: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
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

      expect(find.byType(EventCheckBox), findsNWidgets(3));
    });
  });
}