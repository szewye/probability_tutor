import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/venn_diagram.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  testWidgets('VennDiagram: ', (WidgetTester tester) async {
    // To check if the Venn diagram exists
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

    expect(find.byType(VennDiagram), findsOneWidget);
  });
}
