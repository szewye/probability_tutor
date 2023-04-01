import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_first_question.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_second_question.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_tree.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Bayes question 1: ', () {
    // To check if there are the right title, buttons and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_First()));

      expect(find.text("Bayes' Theorem Example"), findsOneWidget);
      expect(find.widgetWithText(BackHomeButton, "home"), findsOneWidget);
      expect(
          find.text(
              "we know that probability always add up to 1, hence we can compute a tree for the problem:"),
          findsOneWidget);

      expect(find.byType(BinaryTreeView), findsOneWidget);

      expect(find.text("what is P(T | ¬D)?"), findsOneWidget);
      expect(find.text("select the correct answer"), findsOneWidget);

      expect(find.byType(CheckboxListTile), findsNWidgets(3));
      expect(find.text(notDValue), findsOneWidget);
      expect(find.text(TNotDValue), findsOneWidget);
      expect(find.text(notTDValue), findsOneWidget);
    });

    // To check if we get direct to the right page after selecting the correct answer
    testWidgets('Select correct answer: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_First()));

      expect(find.byType(Bayes_Theorem_Example_Tree_Second), findsNothing);

      await tester.tap(find.text(TNotDValue));
      await tester.pumpAndSettle();

      expect(find.byType(Bayes_Theorem_Example_Tree_Second), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To check if there is an error message if we select the wrong answer
    testWidgets('Select wrong answers: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_First()));

      await tester.tap(find.text(notDValue));
      await tester.pumpAndSettle();

      expect(find.text("Try again?"), findsOneWidget);

      await tester.tap(find.text(notTDValue));
      await tester.pumpAndSettle();

      expect(find.text("Try again?"), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
