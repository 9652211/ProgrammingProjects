int player1Points = 0;
int player2Points = 0;
int player1Moves = 0;
int player2Moves = 0;
boolean player1Win = false;
boolean player2Win = false;
boolean end = false;
boolean play = false;

void setup() {
  size(1000, 1000);
  
}

void draw() {
  background(255);
  if (!play) {
    startScreen();
  } else if (end) {
    endScreen();
  }
}

void startScreen() {
  textAlign(CENTER);
  textSize(50);
  fill(0);
  text("Welcome to PawnPlay!", 500, 75);
  textSize(25);
  text("Programmed by Dallin Soukup", 500, 150);
  noStroke();
  rect(300, 300, 20, 200);
  rect(300, 300, 100, 20);
  rect(300, 380, 100, 20);
  rect(400, 300, 20, 100);
  fill(245, 222, 179);
  rect(400, 400, 20, 100);
  rect(420, 300, 80, 20);
  rect(500, 300, 20, 100);
  rect(420, 380, 80, 20);
  fill(123, 111, 90);
  rect(400, 300, 20, 100);
  fill(0);
  textSize(12);
  text("This game is played just like chess, removing all pieces but the pawns and king.", 500, 550);
  text("It is a 2-player game, taking turns to move. White goes first.", 500, 575);
  text("Pawns can move in two ways: ", 500, 600);
  text("1. Forward 1 space. If it is your first turn, you have the option of moving it forward 2 spaces.", 500, 625);
  text("2. If a piece is forward and diagonal from the pawn (a pawn can never go backward), the pawn may capture that piece, unless it is a king.", 500, 650);
  text("If the piece is directly in front of it, the pawn cannot move.", 500, 675);
  text("If a pawn reaches the end of the board, it turns into a queen.", 500, 700);
  text("Queens can move forward, backward, left, right, or diagonal by any amount.", 500, 725);
  text("Kings can also move in any direction, but just by 1 space.", 500, 750);
  text("Whoever checkmates an opponent's king wins.", 500, 775);
  text("A king is checkmated if it is in check and it cannot get out of check.", 500, 800);
  text("A king is in check if a piece may capture it in the next turn if it does not move.", 500, 825);
  text("Whoever checkmates an opponent's king wins.", 500, 850);
  textSize(75);
  text("Click anywhere to begin!", 500, 950);
  if(mousePressed) {
    play = true;
    end = true;
    player1Win = true;
  }
}

void endScreen() {
  textAlign(CENTER);
  textSize(45);
  fill(0);
  text("Thank you for playing PawnPlay by Dallin Soukup!", 500, 75);
  textSize(25);
  noStroke();
  rect(300, 300, 20, 200);
  rect(300, 300, 100, 20);
  rect(300, 380, 100, 20);
  rect(400, 300, 20, 100);
  fill(245, 222, 179);
  rect(400, 400, 20, 100);
  rect(420, 300, 80, 20);
  rect(500, 300, 20, 100);
  rect(420, 380, 80, 20);
  fill(123, 111, 90);
  rect(400, 300, 20, 100);
  if(player1Win) {
    fill(0, 255,0, 127);
    rect(0, 100, 1000, 175);
    fill(0);
    text("Player 1 Info: You Win!!!", 500, 150);
    text("Player 2 Info: You Lose", 500, 600);
  }
  fill(0);
  text("Points: " + player1Points + "     Moves: " + player1Moves, 500, 200);
  text("Points: " + player2Points + "     Moves: " + player2Moves, 500, 650);
  fill(100);
  rect(750, 950, 250, 50);
  fill(0);
  text("Click here to quit app", 875, 975);
}
