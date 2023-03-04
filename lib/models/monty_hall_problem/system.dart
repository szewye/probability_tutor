import 'package:probability_tutor/models/monty_hall_problem/door.dart';
import 'package:probability_tutor/models/monty_hall_problem/game.dart';

class System {
  Door? selectedDoor;
  Game currentGame;

  List<Door> doors; // Doors in the game
  List<Game> games; // To keep track of the games player played in total

  System()
      : doors = [],
        games = [],
        currentGame = Game() {
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

  // When player selects a specific door (only one door can be selected at each time)
  void selectDoor(Door newSelectedDoor) {
    currentGame.changed =
        selectedDoor != null && selectedDoor != newSelectedDoor;

    selectedDoor?.stateOfDoor = DoorState.CLOSED;
    selectedDoor = newSelectedDoor;
    selectedDoor?.stateOfDoor = DoorState.SELECTED;
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

  // Keep track of games player played
  void addGame(Game game) {
    games.add(game);
  }
}
