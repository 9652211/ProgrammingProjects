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
boolean validMove = true;
ArrayList<Pawn> pawns1 = new ArrayList<Pawn>();
ArrayList<Pawn> pawns2 = new ArrayList<Pawn>();

void setup() {
  size(1200, 1200);
  king1 = new King(5, 8, true, true);
  king2 = new King(5, 1, true, false);
  for(int i=0; i<8; i++) {
    pawns1.add(new Pawn(i+1, 7, true, true));
    pawns2.add(new Pawn(i+1, 2, true, false));
  }
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
      for(int j=0; j<8; j++) {
        if((i+j)%2==0) {
          fill(200, 200, 200);
        } else {
          fill(50, 50, 50);
        }
        rect(200+100*i, 200+100*j, 100, 100);
      }
    }
    fill(127);
    rect(200, 50, 800, 150);
    rect(200, 1000, 800, 150);
    fill(230);
    rect(230, 140, 40, 50);
    ellipse(250, 125, 40, 40);
    text("x"+player2Points, 325, 175);
    fill(0);
    text("Moves: " + player2Moves, 850, 150);
    fill(30);
    rect(230, 1040, 40, 50);
    ellipse(250, 1025, 40, 40);
    text("x"+player1Points, 325, 1075);
    fill(255);
    //text("Points: " + player1Points, 350, 1100);
    text("Moves: " + player1Moves, 800, 1100);
    
    king1.display();
    king1.hover(mouseX, mouseY);
    //king1.move(mouseX, mouseY);
    
    king2.display();
    king2.hover(mouseX, mouseY);
    //king2.move(mouseX, mouseY);
    for (int i = 0; i < 8; i++) {
      Pawn pawn1 = pawns1.get(i);
      pawn1.display();
      pawn1.hover(mouseX, mouseY);
      //if(pawn1.selected()) {
      //  pawn1.move();
      //}
      Pawn pawn2 = pawns2.get(i);
      pawn2.display();
      pawn2.hover(mouseX, mouseY);
      //if(pawn2.selected()) {
      //  pawn2.move();
      //}
      if(pawn1.y==1) {
        player1Win = true;
        end = true;
      }
      if(pawn2.y==8) {
        player2Win = true;
        end = true;
      }
    }
    
  }
}

void mousePressed() {
  if(whiteTurn) {
    println("White");
    if(!activeMove) {
      if(king1.active) {
        activeMove = true;
        king1.selected = true;
      } else {
        for(int i = 0; i<8; i++) {
          Pawn pawn1 = pawns1.get(i);
          if(pawn1.active) {
            activeMove = true;
            pawn1.selected = true;
          }
        }
      }
    } else {
      if(s(mouseX)<1||s(mouseX)>8||s(mouseY)<1||s(mouseY)>8) {
        validMove = false;
      }
      if(king1.selected) {
        for(int i = 0; i<8; i++) {
          Pawn pawn1 = pawns1.get(i);
          if(floor(mouseX/100)-1==pawn1.x && floor(mouseY/100)-1==pawn1.y) {
            validMove = false;
          }
        }
        boolean xl = s(mouseX)==king1.x-1;
        boolean xe = s(mouseX)==king1.x;
        boolean xg = s(mouseX)==king1.x+1;
        boolean yl = s(mouseY)==king1.y-1;
        boolean ye = s(mouseY)==king1.y;
        boolean yg = s(mouseY)==king1.y+1;
        if (!((xl&&yl)||(xl&&ye)||(xl&&yg)||(xe&&yg)||(xg&&yg)||(xg&&ye)||(xg&&yl)||(xe&&yl))) {
          validMove = false;
        }
        boolean xl2 = s(mouseX)==king2.x-1;
        boolean xe2 = s(mouseX)==king2.x;
        boolean xg2 = s(mouseX)==king2.x+1;
        boolean yl2 = s(mouseY)==king2.y-1;
        boolean ye2 = s(mouseY)==king2.y;
        boolean yg2 = s(mouseY)==king2.y+1;
        if ((xl2&&yl2)||(xl2&&ye2)||(xl2&&yg2)||(xe2&&yg2)||(xg2&&yg2)||(xg2&&ye2)||(xg2&&yl2)||(xe2&&yl2)) {
          validMove = false;
        }
        for(int i = 0; i<8; i++) {
          Pawn pawn2 = pawns2.get(i);
          boolean xlp = s(mouseX)==pawn2.x-1;
          boolean xgp = s(mouseX)==pawn2.x+1;
          boolean ygp = s(mouseY)==pawn2.y+1;
          if ((xlp&&ygp)||(xgp&&ygp)) {
            validMove = false;
          }
          if(floor(mouseX/100)-1==pawn2.x && floor(mouseY/100)-1==pawn2.y && validMove) {
            player1Points++;
            pawn2.x = 1;
            pawn2.y = 9;
          }
        }
        
        //}
        if(validMove) {
          king1.move(mouseX, mouseY);
          king1.check = false;
          player1Moves++;
          whiteTurn = false;
        } else {
          validMove = true;
        }
        king1.selected = false;
        activeMove = false;
      } else {
        for(int i=0; i<8; i++) {
          Pawn pawn1 = pawns1.get(i);
          if(pawn1.selected) {
            for(int j = 0; j<8; j++) {
              Pawn pawn = pawns1.get(j);
              if(floor(mouseX/100)-1==pawn.x && floor(mouseY/100)-1==pawn.y && pawn != pawn1) {
                validMove = false;
              }
            }
            boolean xe = s(mouseX)==pawn1.x;
            boolean y2 = s(mouseY)==pawn1.y-2;
            boolean y1 = s(mouseY)==pawn1.y-1;
            if (!(xe&&y1)&&!(xe&&y2&&pawn1.firstMove)) {
              validMove = false;
            }
            for(int j = 0; j<8; j++) {
              Pawn pawn = pawns1.get(j);
              if(s(mouseX)==pawn.x && s(mouseY) == pawn.y) {
                validMove = false;
              }
            }
            if((s(mouseX)==king1.x&&s(mouseY)==king1.y)||(s(mouseX)==king2.x&&s(mouseY)==king2.y)) {
              validMove = false;
            }
            if(king1.check&&!(s(mouseX)==king1.checker.x&&s(mouseY)==king1.checker.y)) {
              println("Invalid Move");
              validMove = false;
            }
            for(int j = 0; j<8; j++) {
              Pawn pawn = pawns2.get(j);
              if((!king1.check||(king1.check&&pawn==king1.checker))&&((s(mouseX)==pawn.x && s(mouseY) == pawn.y)&&(pawn.y==pawn1.y-1&&(pawn.x==pawn1.x+1||pawn.x==pawn1.x-1)))) {
                println("Valid move");
                validMove = true;
                player1Points++;
                pawn.x = 1;
                pawn.y = 9;
              } else if((s(mouseX)==pawn.x && s(mouseY) == pawn.y)&&(pawn.y==pawn1.y+1&&pawn.x==pawn1.x)) {
                validMove = false;
              }
            }
            
            if(validMove) {
              pawn1.move(mouseX, mouseY);
              if((pawn1.x==king2.x+1||pawn1.x==king2.x-1)&&pawn1.y==king2.y+1) {
                king2.check = true;
                king2.checker = pawn1;
              }
              pawn1.firstMove = false;
              king1.check = false;
              player1Moves++;
              whiteTurn = false;
            } else {
              println("Invalid move");
              validMove = true;
            }
            pawn1.selected = false;
            activeMove = false;
          }
        }
      }
    }
  } else {
    println("Black");
    if(!activeMove) {
      if(king2.active) {
        activeMove = true;
        king2.selected = true;
      } else {
        for(int i = 0; i<8; i++) {
          Pawn pawn2 = pawns2.get(i);
          if(pawn2.active) {
            activeMove = true;
            pawn2.selected = true;
          }
        }
      }
    } else {
        if(s(mouseX)<1||s(mouseX)>8||s(mouseY)<1||s(mouseY)>8) {
          validMove = false;
        }
      if(king2.selected) {
        for(int i = 0; i<8; i++) {
          Pawn pawn2 = pawns2.get(i);
          if(floor(mouseX/100)-1==pawn2.x && floor(mouseY/100)-1==pawn2.y) {
            validMove = false;
          }
        }
        boolean xl = s(mouseX)==king2.x-1;
        boolean xe = s(mouseX)==king2.x;
        boolean xg = s(mouseX)==king2.x+1;
        boolean yl = s(mouseY)==king2.y-1;
        boolean ye = s(mouseY)==king2.y;
        boolean yg = s(mouseY)==king2.y+1;
        if (!((xl&&yl)||(xl&&ye)||(xl&&yg)||(xe&&yg)||(xg&&yg)||(xg&&ye)||(xg&&yl)||(xe&&yl))) {
          validMove = false;
        }
        boolean xl2 = s(mouseX)==king1.x-1;
        boolean xe2 = s(mouseX)==king1.x;
        boolean xg2 = s(mouseX)==king1.x+1;
        boolean yl2 = s(mouseY)==king1.y-1;
        boolean ye2 = s(mouseY)==king1.y;
        boolean yg2 = s(mouseY)==king1.y+1;
        if ((xl2&&yl2)||(xl2&&ye2)||(xl2&&yg2)||(xe2&&yg2)||(xg2&&yg2)||(xg2&&ye2)||(xg2&&yl2)||(xe2&&yl2)) {
          validMove = false;
        }
        for(int i = 0; i<8; i++) {
          Pawn pawn1 = pawns1.get(i);
          boolean xlp = s(mouseX)==pawn1.x-1;
          boolean xgp = s(mouseX)==pawn1.x+1;
          boolean ygp = s(mouseY)==pawn1.y-1;
          if ((xlp&&ygp)||(xgp&&ygp)) {
            validMove = false;
          }
          if(floor(mouseX/100)-1==pawn1.x && floor(mouseY/100)-1==pawn1.y && validMove) {
            player2Points++;
            pawn1.x = 1;
            pawn1.y = 0;
          }
        }
        
        //}
        if(validMove) {
          king2.move(mouseX, mouseY);
          king2.check = false;
          player2Moves++;
          whiteTurn = true;
        } else {
          validMove = true;
        }
        king2.selected = false;
        activeMove = false;
      } else {
        for(int i=0; i<8; i++) {
          Pawn pawn2 = pawns2.get(i);
          if(pawn2.selected) {
            for(int j = 0; j<8; j++) {
              Pawn pawn = pawns2.get(j);
              /*if(floor(mouseX/100)-1==pawn.x && floor(mouseY/100)-1==pawn.y && pawn != pawn2) {
                validMove = false;
              }*/
            }
            boolean xe = s(mouseX)==pawn2.x;
            boolean y2 = s(mouseY)==pawn2.y+2;
            boolean y1 = s(mouseY)==pawn2.y+1;
            if (!(xe&&y1)&&!(xe&&y2&&pawn2.firstMove)) {
              validMove = false;
            }
            for(int j = 0; j<8; j++) {
              Pawn pawn = pawns2.get(j);
              if(s(mouseX)==pawn.x && s(mouseY) == pawn.y && pawn!=pawn2) {
                validMove = false;
              }
            }
            if(king2.check&&!(s(mouseX)==king2.checker.x&&s(mouseY)==king2.checker.y)) {
              println("Invalid Move");
              validMove = false;
            }
            for(int j = 0; j<8; j++) {
              Pawn pawn = pawns1.get(j);
              if((!king2.check||(king2.check&&pawn==king2.checker))&&((s(mouseX)==pawn.x && s(mouseY) == pawn.y)&&(pawn.y==pawn2.y+1&&(pawn.x==pawn2.x+1||pawn.x==pawn2.x-1)))) {
                println("Valid move");
                validMove = true;
                player2Points++;
                pawn.x = 1;
                pawn.y = 0;
              } else if((s(mouseX)==pawn.x && s(mouseY) == pawn.y)&&(pawn.y==pawn2.y+1&&pawn.x==pawn2.x)) {
                validMove = false;
              }
            }
            if((s(mouseX)==king1.x&&s(mouseY)==king1.y)||(s(mouseX)==king2.x&&s(mouseY)==king2.y)) {
              validMove = false;
            }
            if(validMove) {
              pawn2.move(mouseX, mouseY);
              if((pawn2.x==king1.x+1||pawn2.x==king1.x-1)&&pawn2.y==king1.y-1) {
                king1.check = true;
                king1.checker = pawn2;
              }
              king2.check = false;
              pawn2.firstMove = false;
              player2Moves++;
              whiteTurn = true;
            } else {
              println("Invalid move");
              validMove = true;
            }
            pawn2.selected = false;
            activeMove = false;
          }
        }
      }
  }
    /*if(!activeMove) {
      if(king2.active) {
        activeMove = true;
      }
    } else {
      
      king2.move(mouseX, mouseY);
      activeMove = false;
      whiteTurn = true;
    }*/
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
  textSize(25);
  text("This game is played just like chess, removing all pieces but the pawns and king.", 600, 550);
  text("It is a 2-player game, alternating turns to move. White goes first.", 600, 600);
  text("Pawns can move in two ways: ", 600, 650);
  text("1. Forward 1 space. If it is your first turn, you have the option of moving it forward 2 spaces.", 600, 700);
  text("2. If an opposing piece is forward and diagonal from the pawn, the pawn may capture that piece.", 600, 750);
  text("If the piece is directly in front of it, the pawn cannot move.", 600, 800);
  text("Kings can move forward, backward, left, right, or diagonal, but just by 1 space.", 600, 850);
  text("A king is in check if a piece may capture it in the next turn if it does not move.", 600, 900);
  text("If a king is in check, it is required to get out of check the very next move.", 600, 950);
  text("Whoever gets their pawn to the end of the board first, wins!!!", 600, 1000);
  textSize(75);
  text("Click anywhere to begin!", 600, 1150);
  if(mousePressed) {
    play = true;
  }
}

void endScreen() {
  textAlign(CENTER);
  textSize(45);
  fill(0);
  text("Thank you for playing PawnPlay by Dallin Soukup!", 600, 75);
  textSize(25);
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
  if(player1Win) {
    fill(0, 255, 0, 127);
    rect(0, 100, 1200, 175);
    fill(0);
    text("Player 1 Info: You Win!!!", 600, 150);
    text("Player 2 Info: You Lose", 600, 600);
  } else if(player2Win) {
    fill(0, 255, 0, 127);
    rect(0, 550, 1200, 175);
    fill(0);
    text("Player 1 Info: You Lose", 600, 150);
    text("Player 2 Info: You Win!!!", 600, 600);
  }
  fill(0);
  text("Points: " + player1Points + "     Moves: " + player1Moves, 600, 200);
  text("Points: " + player2Points + "     Moves: " + player2Moves, 600, 650);
}

int s(int x) {
  return x/100-1;
}
