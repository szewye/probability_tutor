import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_final.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_second_question.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_tree.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Bayes question 2: ', () {
    // To check if there are the right title, buttons and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_Second()));

      expect(find.text("Bayes' Theorem Example"), findsOneWidget);
      expect(find.widgetWithText(BackHomeButton, "home"), findsOneWidget);
      expect(
          find.text(
              "we know that probability always add up to 1, hence we can compute a tree for the problem:"),
          findsOneWidget);

      // There should be a binary tree shown on screen
      expect(find.byType(BinaryTreeView), findsOneWidget);

      expect(find.text("what is P(¬D)?"), findsOneWidget);
      expect(find.text("select the correct answer"), findsOneWidget);

      // There should be 3 checkboxes in this page
      expect(find.byType(CheckboxListTile), findsNWidgets(3));

      // There should be value for each of the 3 checkboxes
      expect(find.text(TNotDValue), findsOneWidget);
      expect(find.text(notDValue), findsOneWidget);
      expect(find.text(notTDValue), findsOneWidget);
    });

    // To check if we get direct to the right page after selecting the correct answer
    testWidgets('Select correct answer: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_Second()));

      // Example final page should not be there before selecting the correct answer
      expect(find.byType(Bayes_Theorem_Example_Final), findsNothing);

      await tester.tap(find.text(notDValue));

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To check if there is an error message if we select the wrong answer
    testWidgets('Select wrong answers: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_Second()));

      await tester.tap(find.text(TNotDValue));
      await tester.pumpAndSettle();

      // Error message will pop out if selected a wrong answer
      expect(find.text("Try again?"), findsOneWidget);

      await tester.tap(find.text(notTDValue));
      await tester.pumpAndSettle();

      // Error message will pop out if selected a wrong answer
      expect(find.text("Try again?"), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
