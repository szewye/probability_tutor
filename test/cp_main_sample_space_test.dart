import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_condition_sample_space.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_sample_space.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  group('Conditional probability main event sub-sample space: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);
      probQuery.mainEvent = E;

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Main_Sample_Space(
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
      expect(
          find.text("main event (${probQuery.mainEvent?.id})"), findsOneWidget);
    });

    testWidgets('Select all sub-sample spaces: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);
      probQuery.mainEvent = E;

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Main_Sample_Space(
        probQuery: probQuery,
      )));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final expectedWidgets = coinsSampleSpace
          .map<SampleSpaceButton>(
              (String sample) => SampleSpaceButton(text: sample))
          .toList();

      for (SampleSpaceButton widget in expectedWidgets) {
        expect(find.text(widget.text), findsOneWidget);
      }

      expect(find.byType(Conditional_Probability_Condition_Sample_Space),
          findsNothing);

      for (String? actual in probQuery.mainSubSampleSpace()) {
        await tester.tap(find.text(actual!).first);
        await tester.pumpAndSettle(const Duration(seconds: 1));
      }

      expect(find.byType(Conditional_Probability_Condition_Sample_Space),
          findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
