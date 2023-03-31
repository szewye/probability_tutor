import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_formula.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Bayes simulation: ', () {
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Bayes_Theorem_Formula()));

      expect(find.text("Bayes' Theorem"), findsOneWidget);
      expect(find.text("Recall the formula"), findsOneWidget);
      expect(
          find.text(
              "Drag and drop from parts of the formula from below to the respective boxes."),
          findsOneWidget);
      expect(find.byType(DragTarget<String>), findsNWidgets(6));
      expect(find.byType(Draggable<String>), findsNWidgets(4));
      expect(find.widgetWithText(ElevatedButton, "example"), findsOneWidget);
      expect(find.widgetWithText(BackHomeButton, "home"), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('Direct to example page: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Bayes_Theorem_Formula()));
      expect(find.byType(Bayes_Theorem_Example_Quiz_One), findsNothing);

      await tester.tap(find.text("example"));
      await tester.pumpAndSettle();

      expect(find.byType(Bayes_Theorem_Example_Quiz_One), findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
