King king1;
King king2;
int player1Points = 0;
int player2Points = 0;
int player1Moves = 0;
int player2Moves = 0;
boolean player1Win = false;
boolean player2Win = false;
boolean end = false;
boolean play = false;
boolean activeMove;
boolean whiteTurn;
ArrayList<Pawn> pawns1 = new ArrayList<Pawn>();
ArrayList<Pawn> pawns2 = new ArrayList<Pawn>();

void setup() {
  size(1200, 1200);
  king1 = new King(5, 8, true, true);
  king2 = new King(5, 1, true, false);
  activeMove = false;
  whiteTurn = true;
}

void draw() {
  background(255);
  if (!play) {
    startScreen();
  } else if (end) {
    endScreen();
  } else {
    background(230);
    for(int i=0; i<8; i++) {
      pawns1.add(new Pawn(i+1, 7, true, true));
      pawns2.add(new Pawn(i+1, 2, true, false));
    }
    for(int i=0; i<8; i++) {
      for(int j=0; j<8; j++) {
        if((i+j)%2==0) {
          fill(200, 200, 200);
        } else {
          fill(50, 50, 50);
        }
        rect(200+100*i, 200+100*j, 100, 100);
      }
    }
    
    king1.display();
    king1.hover(mouseX, mouseY);
    //king1.move(mouseX, mouseY);
    
    king2.display();
    king2.hover(mouseX, mouseY);
    //king2.move(mouseX, mouseY);
    for (int i = 0; i < 8; i++) {
      Pawn pawn1 = pawns1.get(i);
      pawn1.display();
      //if(pawn1.selected()) {
      //  pawn1.move();
      //}
      Pawn pawn2 = pawns2.get(i);
      pawn2.display();
      //if(pawn2.selected()) {
      //  pawn2.move();
      //}
    }
    fill(127);
    rect(200, 50, 800, 150);
    rect(200, 1000, 800, 150);
    fill(0);
    text("Points: " + player2Points, 350, 150);
    text("Moves: " + player2Moves, 800, 150);
    fill(255);
    text("Points: " + player1Points, 350, 1100);
    text("Moves: " + player1Moves, 800, 1100);
  }
}

void mousePressed() {
  if(whiteTurn) {
    if(!activeMove) {
      if(king1.active) {
        activeMove = true;
      }
    } else {
      king1.move(mouseX, mouseY);
      activeMove = false;
      whiteTurn = false;
    }
  } else {
    if(!activeMove) {
      if(king2.active) {
        activeMove = true;
      }
    } else {
      king2.move(mouseX, mouseY);
      activeMove = false;
      whiteTurn = true;
    }
  }
}

void startScreen() {
  textAlign(CENTER);
  textSize(50);
  fill(0);
  text("Welcome to PawnPlay!", 600, 75);
  textSize(25);
  text("Programmed by Dallin Soukup", 600, 150);
  noStroke();
  rect(500, 300, 20, 200);
  rect(500, 300, 100, 20);
  rect(500, 380, 100, 20);
  rect(600, 300, 20, 100);
  fill(245, 222, 179);
  rect(600, 400, 20, 100);
  rect(620, 300, 80, 20);
  rect(700, 300, 20, 100);
  rect(620, 380, 80, 20);
  fill(123, 111, 90);
  rect(600, 300, 20, 100);
  fill(0);
  textSize(12);
  text("This game is played just like chess, removing all pieces but the pawns and king.", 600, 550);
  text("It is a 2-player game, taking turns to move. White goes first.", 600, 575);
  text("Pawns can move in two ways: ", 600, 600);
  text("1. Forward 1 space. If it is your first turn, you have the option of moving it forward 2 spaces.", 600, 625);
  text("2. If a piece is forward and diagonal from the pawn (a pawn can never go backward), the pawn may capture that piece, unless it is a king.", 600, 650);
  text("If the piece is directly in front of it, the pawn cannot move.", 600, 675);
  text("If a pawn reaches the end of the board, it turns into a queen.", 600, 700);
  text("Queens can move forward, backward, left, right, or diagonal by any amount.", 600, 725);
  text("Kings can also move in any direction, but just by 1 space.", 600, 750);
  text("Whoever checkmates an opponent's king wins.", 600, 775);
  text("A king is checkmated if it is in check and it cannot get out of check.", 600, 800);
  text("A king is in check if a piece may capture it in the next turn if it does not move.", 600, 825);
  text("Whoever checkmates an opponent's king wins.", 600, 850);
  textSize(75);
  text("Click anywhere to begin!", 600, 950);
  if(mousePressed) {
    play = true;
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
