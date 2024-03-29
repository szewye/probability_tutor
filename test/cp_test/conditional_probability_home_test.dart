import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Conditional probability homepage: ', () {
    // To check if there are the right title, buttons and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester
          .pumpWidget(const MaterialApp(home: Conditional_Probability_Home()));
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
      expect(find.text("Ready to proceed?"), findsOneWidget);

      // Button to navigate to the next page
      expect(find.widgetWithText(NextButton, 'next'), findsOneWidget);

      final expectedWidgets = coinsSampleSpace
          .map<SampleSpaceButton>(
              (String sample) => SampleSpaceButton(text: sample))
          .toList();

      for (SampleSpaceButton widget in expectedWidgets) {
        // To check if each sample space appears once
        expect(find.text(widget.text), findsOneWidget);
      }
    });
  });
}
