import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_example_data.dart';
import 'package:probability_tutor/buttons/next_button.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/colours.dart';

void main() {
  group("NextButton: ", () {
    testWidgets('Homemade title and colour:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Builder(builder: (context) {
        return NextButton(
          title: 'next page',
          textColour: orangyRed,
          buttonColour: darkBlue,
          onPress: () {
            getNavigation()(context, Bayes_Theorem_Example_Data());
          },
        );
      })));

      expect(find.text('next page'), findsOneWidget);

      final finder = find.widgetWithText(NextButton, 'next page');
      final widget = tester.widget<NextButton>(finder);

      expect(widget.textColour, orangyRed);
      expect(widget.buttonColour, darkBlue);
    });

    testWidgets('Function and default title:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Builder(builder: (context) {
        return NextButton(
          onPress: () {
            getNavigation()(context, Bayes_Theorem_Example_Data());
          },
        );
      })));

      expect(find.text('next'), findsOneWidget);
      expect(find.byType(Bayes_Theorem_Example_Data), findsNothing);

      await tester.tap(find.text('next'));
      await tester.pumpAndSettle();

      expect(find.text('next'), findsOneWidget);
      expect(find.byType(Bayes_Theorem_Example_Data), findsOneWidget);
    });
  });
}
