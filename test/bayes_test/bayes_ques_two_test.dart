import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_final.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_second_question.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_tree.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Bayes question 2: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_Second()));

      expect(find.text("Bayes' Theorem Example"), findsOneWidget);
      expect(find.widgetWithText(BackHomeButton, "home"), findsOneWidget);
      expect(
          find.text(
              "we know that probability always add up to 1, hence we can compute a tree for the problem:"),
          findsOneWidget);
      expect(find.byType(BinaryTreeView), findsOneWidget);
      expect(find.text("what is P(¬D)?"), findsOneWidget);
      expect(find.text("select the correct answer"), findsOneWidget);
      expect(find.byType(CheckboxListTile), findsNWidgets(3));
      expect(find.text(TNotDValue), findsOneWidget);
      expect(find.text(notDValue), findsOneWidget);
      expect(find.text(notTDValue), findsOneWidget);
    });

    testWidgets('Select correct answer: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_Second()));

      expect(find.byType(Bayes_Theorem_Example_Final), findsNothing);

      await tester.tap(find.text(notDValue));
      // await tester.pumpAndSettle();

      // expect(find.byType(Bayes_Theorem_Example_Final), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('Select wrong answers: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(
          const MaterialApp(home: Bayes_Theorem_Example_Tree_Second()));

      await tester.tap(find.text(TNotDValue));
      await tester.pumpAndSettle();

      expect(find.text("Try again?"), findsOneWidget);

      await tester.tap(find.text(notTDValue));
      await tester.pumpAndSettle();

      expect(find.text("Try again?"), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
