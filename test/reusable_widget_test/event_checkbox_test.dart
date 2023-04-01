import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/event_checkbox.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/homepage.dart';

void main() {
  group('EventCheckBox: ', () {
    // To check if the checkbox display the correct text
    // and selected that event when tapped
    testWidgets('Displays title and checkbox: ', (WidgetTester tester) async {
      int? selection;
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: EventCheckBox(
            id: 1,
            value: 'E',
            selection: selection,
            onSelected: (id) {
              selection = id;
            },
            page: Container(),
            tickColour: offWhite,
            circleColour: orangyRed,
          ),
        ),
      ));

      expect(find.text('E'), findsOneWidget);
      expect(find.byType(EventCheckBox), findsOneWidget);

      await tester.tap(find.byType(EventCheckBox));
      expect(selection, equals(1));
    });

    // To test if the button directs to the page specified
    testWidgets('Navigate to page when toggled: ', (WidgetTester tester) async {
      int? selection;

      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Builder(
            builder: (context) {
              return EventCheckBox(
                id: 1,
                value: 'E',
                selection: selection,
                onSelected: (id) {
                  selection = id;
                },
                page: const Homepage(),
                tickColour: offWhite,
                circleColour: orangyRed,
              );
            },
          ),
        ),
      ));

      expect(find.byType(EventCheckBox), findsOneWidget);
      expect(find.byType(Homepage), findsNothing);

      await tester.tap(find.byType(EventCheckBox));
      await tester.pumpAndSettle();

      expect(find.byType(Homepage), findsOneWidget);
    });
  });
}
