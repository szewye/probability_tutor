import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/models/monty_hall_problem/door.dart';
import 'package:probability_tutor/models/monty_hall_problem/game.dart';
import 'package:probability_tutor/models/monty_hall_problem/system.dart';

void main() {
  group("System: ", () {
    // To test if the system set up correctly based on the constructor
    test('System setup: ', () async {
      System system = System();

      expect(system.doors.length, 3);
      expect(system.games.length, 0);
      expect(system.selectedDoor, null);
      expect(system.currentGameState, GameState.FIRST_SELECTION);
    });

    // To test if selectDoor() function works as it is
    // The state of the door changes when it is selected
    test('Selecting a door changes its state to selected: ', () async {
      System system = System();

      system.selectDoor(system.doors.first);
      expect(system.doors.first.stateOfDoor, DoorState.SELECTED);
    });

    // To test when we start a game by selecting a door,
    // the game state switches to SECOND_SELECTION state
    test('Selecting a door to start: ', () async {
      System system = System();

      system.currentGameState = GameState.FIRST_SELECTION;
      system.selectDoor(system.doors.first);

      expect(system.currentGameState, GameState.SECOND_SELECTION);
    });

    // To test when we select a strategy,
    // the game state switches to END state
    test('Decide strategy to end the game: ', () async {
      System system = System();

      system.currentGameState = GameState.SECOND_SELECTION;
      system.selectDoor(system.doors.first);

      expect(system.currentGameState, GameState.END);
    });

    // To test if openAllDoors() function work as it is
    test('Open all doors: ', () async {
      System system = System();

      system.openAllDoors();

      final door_one = system.doors.first;
      final door_two = system.doors[1];
      final door_three = system.doors[2];

      // Check if all doors are opened
      expect(door_one.stateOfDoor, DoorState.OPENED);
      expect(door_two.stateOfDoor, DoorState.OPENED);
      expect(door_three.stateOfDoor, DoorState.OPENED);
    });

    // To test if addGame() function works
    test('Add a game: ', () async {
      System system = System();

      system.addGame(Game());

      // See if the number of games increment
      expect(system.games.length, 1);
    });

    // To test if keepChoice() works
    test('Selecting "keep choice" results in the same door being selected: ',
        () async {
      System system = System();

      system.selectDoor(system.doors.first);
      system.keepChoice();

      // Check if the same door will still be selected
      expect(system.selectedDoor, system.doors.first);
    });

    // To test if changeChoice() works
    test(
        'Selecting "change choice" results in a different door being selected: ',
        () async {
      System system = System();

      system.selectDoor(system.doors.first);
      system.changeChoice();

      // Check if the same door will still be de-selected
      expect(system.selectedDoor, isNot(system.doors.first));
    });

    // To test the result a game
    // whether it's true or false (won or lost)
    test('Game result: ', () async {
      System system = System();

      system.selectRandomFirstDoor();
      system.changeChoice();
      system.gameEnded();

      expect(system.currentGame.won, isIn([true, false]));
    });

    // To test if beginNewGame() works
    test('Begin new game: ', () async {
      System system = System();

      system.beginNewGame();

      // System will set up 3 doors, no doors are selected and game state will be FIRST_SELECTION again
      expect(system.currentGameState, GameState.FIRST_SELECTION);
      expect(system.selectedDoor, null);
      expect(system.doors.length, 3);
    });
  });
}
