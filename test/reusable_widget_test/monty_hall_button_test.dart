import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_simulation.dart';
import 'package:probability_tutor/buttons/monty_hall_button.dart';
import 'package:probability_tutor/helpers/navigation_helper.dart';
import 'package:probability_tutor/colours.dart';

void main() {
  group("MontyHallButton: ", () {
    testWidgets('Homemade title and colour:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Builder(builder: (context) {
        return MontyHallButton(
          title: 'Simulation',
          textColour: orangyRed,
          buttonColour: offWhite,
          onPress: () {
            getNavigation()(context, Monty_Hall_Simulation());
          },
        );
      })));

      expect(find.text('Simulation'), findsOneWidget);
      final finder = find.widgetWithText(MontyHallButton, 'Simulation');
      final widget = tester.widget<MontyHallButton>(finder);
      expect(widget.textColour, orangyRed);
      expect(widget.buttonColour, offWhite);
    });

    testWidgets('Function:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Builder(builder: (context) {
        return MontyHallButton(
          title: 'Simulation',
          onPress: () {
            getNavigation()(context, Monty_Hall_Simulation());
          },
        );
      })));

      expect(find.text('Simulation'), findsOneWidget);
      expect(find.byType(Monty_Hall_Simulation), findsNothing);

      await tester.tap(find.text('Simulation'));
      await tester.pumpAndSettle();
      expect(find.byType(Monty_Hall_Simulation), findsOneWidget);
    });
  });
}
