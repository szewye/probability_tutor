import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_data.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_first_question.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Bayes data page: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Bayes_Theorem_Example_Data()));

      expect(find.text("Bayes' Theorem Example"), findsOneWidget);
      expect(find.text(DFirstHalf + DSecondHalf), findsOneWidget);
      expect(find.text(TFirstHalf + TSecondHalf), findsOneWidget);
      expect(find.text("How do we get $pOfTGivenNotD and $pOfNotD?"),
          findsOneWidget);
      expect(
          find.text(
              "Click next to compute a tree using the data given from the scenario!"),
          findsOneWidget);
      expect(find.widgetWithText(BackHomeButton, "home"), findsOneWidget);
      expect(find.widgetWithText(NextButton, "next"), findsOneWidget);
      ;
    });

    testWidgets('Direct to next page: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Bayes_Theorem_Example_Data()));

      expect(find.byType(Bayes_Theorem_Example_Tree_First), findsNothing);

      await tester.tap(find.text("next"));
      await tester.pumpAndSettle();

      expect(find.byType(Bayes_Theorem_Example_Tree_First), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
