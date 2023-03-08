import 'dart:math';
import 'package:probability_tutor/models/monty_hall_problem/door.dart';
import 'package:probability_tutor/models/monty_hall_problem/game.dart';

// To keep track of the state of game
enum GameState {
  FIRST_SELECTION,
  SECOND_SELECTION,
  END;
}

class System {
  Door? selectedDoor;
  Game currentGame;
  GameState currentGameState;

  List<Door> doors; // Doors in the game
  List<Game> games; // To keep track of the games player played in total

  System()
      : doors = [],
        games = [],
        currentGame = Game(),
        currentGameState = GameState.FIRST_SELECTION {
    setUpThreeDoors();
  }

  // Set up 3 doors for the game with 2 goats and a car
  void setUpThreeDoors() {
    doors = [
      Door(prizeBehindTheDoor: Prize.CAR),
      Door(prizeBehindTheDoor: Prize.GOAT),
      Door(prizeBehindTheDoor: Prize.GOAT),
    ];

    doors.shuffle();
  }

  // Keep the same door as selection
  void keepChoice() {
    selectDoor(selectedDoor!);
  }

  // Change to the other door as new selection
  void changeChoice() {
    final door = (doors
            .where((Door door) => door.stateOfDoor == DoorState.CLOSED)
            .toList())
        .first;

    selectDoor(door);
  }

  // When player selects a specific door (only one door can be selected at each time)
  void selectDoor(Door newSelectedDoor) {
    currentGame.changed =
        selectedDoor != null && selectedDoor != newSelectedDoor;

    selectedDoor?.stateOfDoor = DoorState.CLOSED;
    selectedDoor = newSelectedDoor;
    selectedDoor?.stateOfDoor = DoorState.SELECTED;

    if (currentGameState == GameState.FIRST_SELECTION) {
      currentGameState = GameState.SECOND_SELECTION;
      randomOpenDoor();
    } else if (currentGameState == GameState.SECOND_SELECTION) {
      currentGameState = GameState.END;
      openAllDoors();
      gameEnded();
    }
  }

  // Begin new game after current game ends
  void beginNewGame() {
    currentGame = Game();
    selectedDoor = null;
    currentGameState = GameState.FIRST_SELECTION;
    setUpThreeDoors();
  }

  // System will randomly open one of the two doors left
  // Only opening a door with a goat behind
  void randomOpenDoor() {
    final door = (doors
            .where((Door door) =>
                door.stateOfDoor == DoorState.CLOSED &&
                door.prizeBehindTheDoor != Prize.CAR)
            .toList()
          ..shuffle())
        .first;

    door.stateOfDoor = DoorState.OPENED;
  }

  // Check if player win or lose the game when game ends
  void gameEnded() {
    currentGame.won = selectedDoor?.prizeBehindTheDoor == Prize.CAR;
    addGame(currentGame); // Add the current game to the list of games played
  }

  // Open all the doors
  void openAllDoors() {
    doors.forEach((Door door) {
      door.stateOfDoor = DoorState.OPENED;
    });
  }

  // System will slect the first door at random
  void selectRandomFirstDoor() {
    selectDoor(doors[Random().nextInt(doors.length - 1)]);
  }

  // Keep track of games player played
  void addGame(Game game) {
    games.add(game);
  }
}
