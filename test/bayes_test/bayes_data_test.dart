import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_data.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_tree_first_question.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Bayes data page: ', () {
    // To check if there are the right title, buttons and content in the homepage
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

      // Button to navigate to go back to home page
      expect(find.widgetWithText(BackHomeButton, "home"), findsOneWidget);

      // Button to navigate to next page
      expect(find.widgetWithText(NextButton, "next"), findsOneWidget);
      ;
    });

    // To check if it directs to the right page
    testWidgets('Direct to next page: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Bayes_Theorem_Example_Data()));

      // Example tree page should not be there before clicking on the button
      expect(find.byType(Bayes_Theorem_Example_Tree_First), findsNothing);

      await tester.tap(find.text("next"));
      await tester.pumpAndSettle();

      // Example tree page should be there after clicking on the button
      expect(find.byType(Bayes_Theorem_Example_Tree_First), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
