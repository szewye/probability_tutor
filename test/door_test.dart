import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/door.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/models/monty_hall_problem/door.dart';

void main() {
  group("Door: ", () {
    testWidgets('Closed door with a car behind:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(
        child: DoorShape(
          door: Door(prizeBehindTheDoor: Prize.CAR),
        ),
      )));

      final finder = find.byType(DoorShape);
      final widget = tester.widget<DoorShape>(finder);

      expect(find.byType(DoorShape), findsOneWidget);
      expect(widget.door.prizeBehindTheDoor, Prize.CAR);
      expect(widget.getDoorColour(widget.door.stateOfDoor), offWhite);
      expect(widget.getDoorknobColour(widget.door.stateOfDoor), darkBlue);
    });

    testWidgets('Selected door with a goat behind:',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(
        child: DoorShape(
            door: Door(
                prizeBehindTheDoor: Prize.GOAT,
                stateOfDoor: DoorState.SELECTED)),
      )));

      final finder = find.byType(DoorShape);
      final widget = tester.widget<DoorShape>(finder);

      expect(find.byType(DoorShape), findsOneWidget);
      expect(widget.door.prizeBehindTheDoor, Prize.GOAT);
      expect(widget.getDoorColour(widget.door.stateOfDoor),
          darkBlue.withOpacity(0.7));
      expect(widget.getDoorknobColour(widget.door.stateOfDoor), offWhite);
    });

    testWidgets('Opened door with a goat behind:', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Material(
        child: DoorShape(
            door: Door(
                prizeBehindTheDoor: Prize.GOAT, stateOfDoor: DoorState.OPENED)),
      )));

      final finder = find.byType(DoorShape);
      final widget = tester.widget<DoorShape>(finder);

      expect(find.byType(DoorShape), findsOneWidget);
      expect(widget.door.prizeBehindTheDoor, Prize.GOAT);
      expect(widget.getDoorColour(widget.door.stateOfDoor),
          offWhite.withOpacity(0.3));
      expect(widget.getDoorknobColour(widget.door.stateOfDoor),
          Colors.transparent);
    });

    testWidgets('Function:', (WidgetTester tester) async {
      bool works = false;
      await tester.pumpWidget(MaterialApp(home: Builder(builder: (context) {
        return Material(
          child: DoorShape(
            door: Door(prizeBehindTheDoor: Prize.CAR),
            onPress: () {
              works = true;
            },
          ),
        );
      })));

      expect(works, false);

      await tester.tap(find.byType(DoorShape));
      await tester.pumpAndSettle();

      expect(works, true);
    });
  });
}
