import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_quiz_one.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_simulation.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/constants.dart';

void main() {
  group('Bayes simulation: ', () {
    // To check if there are the right title, buttons and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester
          .pumpWidget(const MaterialApp(home: Bayes_Theorem_Simulation()));

      expect(find.text("Bayes' Theorem Simulation"), findsOneWidget);
      expect(
          find.text(
              "With the example from the 2nd section of Bayes' theorem, we know that P(D) = 0.00001, P(T | D) = 0.99, P(¬T | ¬D) = 0.995, the probability that someone actually has the disease given that the test is positive. \n\n What is going to happen when the values are different? Is the probability of getting a false positive or false negative higher? How can you make P(D | T) higher or lower? "),
          findsOneWidget);
      expect(
          find.text(
              "Play around with the sliders to see how the values affect the end result!"),
          findsOneWidget);

      // Button to navigate to example page
      expect(find.widgetWithText(ElevatedButton, "example"), findsOneWidget);

      // Button to navigate to go back to home page
      expect(find.widgetWithText(BackHomeButton, "back to home page"),
          findsOneWidget);

      // There should be 3 sliders in the simulation page
      expect(find.byType(Slider), findsNWidgets(3));

      // There should be header for each of the 3 sliders in the simulation page
      expect(find.text(pOfTGivenD), findsOneWidget);
      expect(find.text(pOfD), findsOneWidget);
      expect(find.text(pOfTGivenNotD), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To test if the example button directs to the right page
    testWidgets('Direct to example page: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester
          .pumpWidget(const MaterialApp(home: Bayes_Theorem_Simulation()));

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
