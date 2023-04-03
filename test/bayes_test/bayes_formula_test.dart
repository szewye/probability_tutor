import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';

void main() {
  group('Bayes simulation: ', () {
    // To check if there are the right title and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      await tester.pumpWidget(MaterialApp(home: Bayes_Theorem_Formula()));

      expect(find.text("Bayes' Theorem"), findsOneWidget);
      expect(find.text("Recall the formula"), findsOneWidget);
      expect(
          find.text(
              "Drag and drop from parts of the formula from below to the respective boxes."),
          findsOneWidget);

      // There should be 6 spaces we can drag and drop the draggable widgets to
      expect(find.byType(DragTarget<String>), findsNWidgets(6));

      // There should be 4 draggable widgets
      expect(find.byType(Draggable<String>), findsNWidgets(4));

      // Button to navigate to example page
      expect(find.widgetWithText(ElevatedButton, "example"), findsOneWidget);

      // Button to navigate to go back to home page
      expect(find.widgetWithText(BackHomeButton, "home"), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To check if the example button directs to the right page
    testWidgets('Direct to example page: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Bayes_Theorem_Formula()));

      // Example page should not be there before clicking on the button
      expect(find.byType(Bayes_Theorem_Example_Quiz_One), findsNothing);

      await tester.tap(find.text("example"));
      await tester.pumpAndSettle();

      // Example page should be there after clicking on the button
      expect(find.byType(Bayes_Theorem_Example_Quiz_One), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
