import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Conditional probability homepage: ', () {
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

      expect(find.widgetWithText(NextButton, 'next'), findsOneWidget);
    });
  });
}
