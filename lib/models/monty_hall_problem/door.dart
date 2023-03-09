// A goat or car will be behind the door
enum Prize { GOAT, CAR }

// A door can either be opened by system, closed or selected by player
enum DoorState { OPENED, CLOSED, SELECTED }

// Represents a door in the game
class Door {
  // Whether a door is openable, meaning if player can click on it or not
  bool openable;
  DoorState stateOfDoor;
  Prize prizeBehindTheDoor;

  Door({
    this.openable = true,
    this.stateOfDoor = DoorState.CLOSED,
    required this.prizeBehindTheDoor,
  });
}
