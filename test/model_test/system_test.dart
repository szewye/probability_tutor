import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/models/monty_hall_problem/door.dart';
import 'package:probability_tutor/models/monty_hall_problem/game.dart';
import 'package:probability_tutor/models/monty_hall_problem/system.dart';

void main() {
  group("System: ", () {
    test('System setup: ', () async {
      System system = System();

      expect(system.doors.length, 3);
      expect(system.games.length, 0);
      expect(system.selectedDoor, null);
      expect(system.currentGameState, GameState.FIRST_SELECTION);
    });

    test('Selecting a door changes its state to selected: ', () async {
      System system = System();

      system.selectDoor(system.doors.first);
      expect(system.doors.first.stateOfDoor, DoorState.SELECTED);
    });

    test('Selecting a door to start: ', () async {
      System system = System();

      system.currentGameState = GameState.FIRST_SELECTION;
      system.selectDoor(system.doors.first);

      expect(system.currentGameState, GameState.SECOND_SELECTION);
    });

    test('Decide strategy to end the game: ', () async {
      System system = System();

      system.currentGameState = GameState.SECOND_SELECTION;
      system.selectDoor(system.doors.first);

      expect(system.currentGameState, GameState.END);
    });

    test('Open all doors: ', () async {
      System system = System();

      system.openAllDoors();

      final door_one = system.doors.first;
      final door_two = system.doors[1];
      final door_three = system.doors[2];

      expect(door_one.stateOfDoor, DoorState.OPENED);
      expect(door_two.stateOfDoor, DoorState.OPENED);
      expect(door_three.stateOfDoor, DoorState.OPENED);
    });

    test('Add a game: ', () async {
      System system = System();

      system.addGame(Game());

      expect(system.games.length, 1);
    });

    test('Selecting "keep choice" results in the same door being selected',
        () async {
      System system = System();

      system.selectDoor(system.doors.first);
      system.keepChoice();

      expect(system.selectedDoor, system.doors.first);
    });

    test('Selecting "change choice" results in a different door being selected',
        () async {
      System system = System();

      system.selectDoor(system.doors.first);
      system.changeChoice();

      expect(system.selectedDoor, isNot(system.doors.first));
    });

    test('playing a game results in either winning or losing', () async {
      System system = System();

      system.selectRandomFirstDoor();
      system.changeChoice();
      system.gameEnded();

      expect(system.currentGame.won, isIn([true, false]));
    });

    test('Begin new game: ', () async {
      System system = System();

      system.beginNewGame();

      expect(system.currentGameState, GameState.FIRST_SELECTION);
      expect(system.selectedDoor, null);
      expect(system.doors.length, 3);
    });
  });
}
