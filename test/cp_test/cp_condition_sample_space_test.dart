import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_sample_space.dart';
import 'package:probability_tutor/Conditional_Probability/cp_venn_diagram_caption.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  group('Conditional probability condition event sub-sample space: ', () {
    // To check if there are the right title, buttons and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);
      probQuery.conditionEvent = E;

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Condition_Sample_Space(
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
      expect(find.text("select all the sub sample spaces for the "),
          findsOneWidget);
      expect(find.text("condition event (${probQuery.conditionEvent?.id})"),
          findsOneWidget);
    });

    // To check if it directs to the right page when all sub-sample spaces are selected
    testWidgets('Select all sub-sample spaces: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);
      probQuery.conditionEvent = E;

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Condition_Sample_Space(
        probQuery: probQuery,
      )));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Sample spaces are made clickable buttons
      final expectedWidgets = coinsSampleSpace
          .map<SampleSpaceButton>(
              (String sample) => SampleSpaceButton(text: sample))
          .toList();

      // There should be one button for each sample space
      for (SampleSpaceButton widget in expectedWidgets) {
        expect(find.text(widget.text), findsOneWidget);
      }

      // Pre Venn diagram instruction page should not be there before selecting all the correct sub-sample space
      expect(find.byType(Conditional_Probability_Venn_Diagram_Caption),
          findsNothing);

      // Select all sub-sample spaces for the condition event
      for (String? actual in probQuery.conditionSubSampleSpace()) {
        await tester.tap(find.text(actual!).first);
        await tester.pumpAndSettle(const Duration(seconds: 1));
      }

      // Pre Venn diagram instruction page should be there after selecting all the correct sub-sample space
      expect(find.byType(Conditional_Probability_Venn_Diagram_Caption),
          findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
