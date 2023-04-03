import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/door.dart';
import 'package:probability_tutor/Monty_Hall_Problem/dropdown_selection.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_game.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_simulation.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate.dart';

void main() {
  group('Monty Hall simulation: ', () {
    // To check if there are the right title, buttons and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Monty_Hall_Simulation()));
      expect(
          find.text(
              "Understand the Monty Hall problem with this game. \n Use the simulation and see which is the best action. Keep or change your choice?"),
          findsOneWidget);

      // There should be 3 doors
      expect(find.byType(DoorShape), findsNWidgets(3));
      expect(find.text("Select how many times you want the system to play:"),
          findsOneWidget);

      // There should be a dropdown for the rounds to play
      expect(find.byType(DropDown<int>), findsOneWidget);

      // There should be a dropdown for the strategy to play
      expect(find.byType(DropDown<String>), findsOneWidget);
      expect(find.text("times and"), findsOneWidget);

      // There should be a button to start the simulation
      expect(find.widgetWithText(ElevatedButton, "start simulation"),
          findsOneWidget);

      expect(find.byType(BackHomeButton), findsOneWidget);
      expect(find.byType(WinRate), findsOneWidget);
    });

    // To check if the right instruction displays at different game state
    testWidgets('Instruction while simulation is running: ',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Monty_Hall_Simulation()));

      await tester.tap(find.widgetWithText(ElevatedButton, "start simulation"));
      await tester.pump();

      // The initial instruction should be hidden when the simulation is running
      expect(find.text("Select how many times you want the system to play:"),
          findsNothing);
      expect(find.byType(DropDown<int>), findsNothing);
      expect(find.byType(DropDown<String>), findsNothing);
      expect(find.text("times and"), findsNothing);
      expect(find.widgetWithText(ElevatedButton, "start simulation"),
          findsNothing);

      // The instruction when the simulation is running
      expect(find.text("Simulation running..."), findsOneWidget);
      expect(find.text("Keep an eye on the win rate 😉"), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 5));

      // The initial instruction should be shown again when the simulation is done running
      expect(find.text("Select how many times you want the system to play:"),
          findsOneWidget);
      expect(find.byType(DropDown<int>), findsOneWidget);
      expect(find.byType(DropDown<String>), findsOneWidget);
      expect(find.text("times and"), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, "start simulation"),
          findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To check if the game button directs to the game page
    testWidgets('Switch to game page: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Monty_Hall_Simulation()));

      await tester.tap(find.widgetWithText(ElevatedButton, "game"));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Game page should be there after clicking on the button
      expect(find.byType(Monty_Hall_Game), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
