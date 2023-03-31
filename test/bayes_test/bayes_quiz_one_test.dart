import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_data.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Bayes example homepage: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester
          .pumpWidget(MaterialApp(home: Bayes_Theorem_Example_Quiz_One()));

      expect(find.text("Bayes' Theorem Example"), findsOneWidget);
      expect(find.text(bayesExampleContext), findsOneWidget);
      expect(find.text(DFirstHalf + DSecondHalf), findsOneWidget);
      expect(find.text(TFirstHalf + TSecondHalf), findsOneWidget);
      expect(find.text("Identify what the question is asking for?"),
          findsOneWidget);
      expect(find.text("select the correct answer"), findsOneWidget);
      expect(find.widgetWithText(BackHomeButton, "home"), findsOneWidget);
      expect(find.text(pOfDGivenT), findsOneWidget);
      expect(find.text(pOfTGivenD), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsNWidgets(2));
    });

    testWidgets('Select correct answer: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester
          .pumpWidget(MaterialApp(home: Bayes_Theorem_Example_Quiz_One()));

      expect(find.byType(Bayes_Theorem_Example_Data), findsNothing);

      await tester.tap(find.text(pOfDGivenT));
      await tester.pumpAndSettle();

      expect(find.byType(Bayes_Theorem_Example_Data), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('Select wrong answer: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester
          .pumpWidget(MaterialApp(home: Bayes_Theorem_Example_Quiz_One()));

      await tester.tap(find.text(pOfTGivenD));
      await tester.pumpAndSettle();

      expect(find.text("Try again?"), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
