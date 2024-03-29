import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/buttons/main_page_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';

void main() {
  group("MainPageButton: ", () {
    // To test if the button looks like what we specify
    testWidgets('Homemade title and colour:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Builder(builder: (context) {
        return MainPageButton(
          title: 'next page',
          textColour: orangyRed,
          buttonColour: darkBlue,
          onPress: () {
            getNavigation()(context, const Conditional_Probability_Home());
          },
        );
      })));

      expect(find.text('next page'), findsOneWidget);
      final finder = find.widgetWithText(MainPageButton, 'next page');
      final widget = tester.widget<MainPageButton>(finder);
      expect(widget.textColour, orangyRed);
      expect(widget.buttonColour, darkBlue);
    });

    // To test if the button directs to the right page when press
    testWidgets('Function:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Builder(builder: (context) {
        return MainPageButton(
          title: 'Conditional Probability',
          onPress: () {
            getNavigation()(context, const Conditional_Probability_Home());
          },
        );
      })));

      expect(find.text('Conditional Probability'), findsOneWidget);

      // Conditional probability page should not be there after selecting the button
      expect(find.byType(Conditional_Probability_Home), findsNothing);

      await tester.tap(find.text('Conditional Probability'));
      await tester.pumpAndSettle();

      // Conditional probability page should be there after selecting the button
      expect(find.text('Conditional Probability'), findsOneWidget);
      expect(find.byType(Conditional_Probability_Home), findsOneWidget);
    });
  });
}
