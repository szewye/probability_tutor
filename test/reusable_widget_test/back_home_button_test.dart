import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/homepage.dart';

void main() {
  group("BackHomeButton: ", () {
    // To check the defult text and text colour
    testWidgets('Default title:', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BackHomeButton()));

      expect(find.text('home'), findsOneWidget);
      final finder = find.widgetWithText(BackHomeButton, 'home');
      final widget = tester.widget<BackHomeButton>(finder);

      expect(widget.textColour, darkBlue);
    });

    // To test if the text displyed is the one we specified
    testWidgets('Homemade title:', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: BackHomeButton(
        title: 'back to homepage',
        textColour: offWhite,
      )));

      expect(find.text('back to homepage'), findsOneWidget);
      final finder = find.widgetWithText(BackHomeButton, 'back to homepage');
      final widget = tester.widget<BackHomeButton>(finder);

      expect(widget.textColour, offWhite);
    });

    // To test if the button directs back to homepage when selected
    testWidgets('On press: ', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: BackHomeButton()));

      expect(find.text('home'), findsOneWidget);

      // Homepage should not be there before selecting the button
      expect(find.byType(Homepage), findsNothing);

      await tester.tap(find.text('home'));
      await tester.pumpAndSettle();

      expect(find.text('home'), findsNothing);

      // Homepage should be there after selecting the button
      expect(find.byType(Homepage), findsOneWidget);
    });
  });
}
