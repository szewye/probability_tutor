import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/door.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_game.dart';
import 'package:probability_tutor/Monty_Hall_Problem/monty_hall_simulation.dart';
import 'package:probability_tutor/Monty_Hall_Problem/win_rate.dart';
import 'package:probability_tutor/buttons/back_home_button.dart';
import 'package:probability_tutor/buttons/monty_hall_button.dart';
import 'package:probability_tutor/models/monty_hall_problem/system.dart';

void main() {
  group('Monty Hall game: ', () {
    // To check if there are the right title, buttons and content in the homepage
    testWidgets('Title and content: ', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: Monty_Hall_Game()));
      expect(
          find.text(
              "Understand the Monty Hall problem with this game. \n Play at least 30 times to see which is the best action. Keep or change your choice?"),
          findsOneWidget);

      expect(find.byType(DoorShape), findsNWidgets(3));
      expect(find.text("Select a door to start the game!"), findsOneWidget);

      expect(find.widgetWithText(ElevatedButton, "simulation"), findsOneWidget);
      expect(find.byType(BackHomeButton), findsOneWidget);
      expect(find.byType(WinRate), findsOneWidget);
    });

    // To check if the right instruction at SECOND_SELECTION state
    testWidgets('Instruction in second selection states: ',
        (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Monty_Hall_Game()));

      await tester.tap(find.byType(DoorShape).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.text("Do you want to"), findsOneWidget);
      expect(find.widgetWithText(MontyHallButton, "Keep your choice?"),
          findsOneWidget);
      expect(find.text("or"), findsOneWidget);
      expect(find.widgetWithText(MontyHallButton, "Change your choice?"),
          findsOneWidget);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To check if the right instruction at END state
    testWidgets('Instruction end states: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Monty_Hall_Game()));

      await tester.tap(find.byType(DoorShape).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester
          .tap(find.widgetWithText(MontyHallButton, "Change your choice?"));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byWidgetPredicate((widget) {
        if (widget is Text) {
          return widget.data == 'Congratulations, you won!' ||
              widget.data == 'You lost...';
        }
        return false;
      }), findsOneWidget);

      expect(
          find.widgetWithText(MontyHallButton, "Play again?"), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To check if play again button works and reset the game
    testWidgets('Play again: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Monty_Hall_Game()));

      await tester.tap(find.byType(DoorShape).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));

      await tester
          .tap(find.widgetWithText(MontyHallButton, "Change your choice?"));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(
          find.widgetWithText(MontyHallButton, "Play again?"), findsOneWidget);

      await tester.tap(find.widgetWithText(MontyHallButton, "Play again?"));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      final finder = find.byType(Monty_Hall_Game);
      final widget = tester.widget<Monty_Hall_Game>(finder);

      expect(widget.system.currentGameState, GameState.FIRST_SELECTION);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    // To check if the simulate button directs to the right page
    testWidgets('Switch to simulation page: ', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(1920, 1080));
      await tester.pumpWidget(MaterialApp(home: Monty_Hall_Game()));

      await tester.tap(find.widgetWithText(ElevatedButton, "simulation"));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(Monty_Hall_Simulation), findsOneWidget);

      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
