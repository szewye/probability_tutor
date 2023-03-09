// Represent each game players played
class Game {
  bool won; // If player win or lose the game
  bool changed; // If player changed or kept the original choice

  Game({
    this.won = false,
    this.changed = false,
  });
}
