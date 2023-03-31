import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  testWidgets('VennDiagram should render correctly',
      (WidgetTester tester) async {
    final probQuery = ProbQuery(
      sampleSpace: coinsSampleSpace,
      mainEvent: F,
      conditionEvent: G,
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VennDiagram(probQuery: probQuery),
        ),
      ),
    );

    // Verify that the circles are rendered
    expect(find.byType(VennDiagram), findsOneWidget);

    // // Verify that the main event sub sample space text is rendered
    // expect(find.text('HHH, HHT, HTT, HTH'), findsOneWidget);

    // // Verify that the condition event sub sample space text is rendered
    // expect(find.text('TTT, TTH, THH, THT'), findsOneWidget);

    // // Verify that the overlap text is rendered
    // expect(find.text(''), findsOneWidget);

    // // Verify that the sample space text is rendered
    // expect(find.text('HH, HT'), findsOneWidget);
  });
}
