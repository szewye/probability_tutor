import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_event.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/constants.dart';

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
    });
  });
}
