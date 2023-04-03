import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_venn_diagram.dart';
import 'package:probability_tutor/Conditional_Probability/cp_venn_diagram_caption.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  group('Bayes data page: ', () {
    // To check if there are the right title, buttons and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);
      probQuery.conditionEvent = E;

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Venn_Diagram_Caption(
        probQuery: probQuery,
      )));

      expect(
          find.text(
              "Want to see a Venn diagram based on the sample spaces you've just chosen?"),
          findsOneWidget);
      expect(find.text("Click next to see the Venn diagram!"), findsOneWidget);

      // Button to navigate to next page
      expect(find.widgetWithText(NextButton, "next"), findsOneWidget);
    });

    // To check if the button direct to the right page
    testWidgets('Direct to next page: ', (WidgetTester tester) async {
      final ProbQuery probQuery = ProbQuery(sampleSpace: coinsSampleSpace);
      probQuery.conditionEvent = E;

      await tester.binding.setSurfaceSize(const Size(1920, 1080));

      await tester.pumpWidget(MaterialApp(
          home: Conditional_Probability_Venn_Diagram_Caption(
        probQuery: probQuery,
      )));

      // Conditional probability venn diagram page should not be there before selecting the next button
      expect(find.byType(Conditional_Probability_Venn_Diagram), findsNothing);

      await tester.tap(find.text("next"));
      await tester.pumpAndSettle();

      // Conditional probability venn diagram page should be there after selecting the next button
      expect(find.byType(Conditional_Probability_Venn_Diagram), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
