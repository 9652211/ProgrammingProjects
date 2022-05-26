class Pawn {
  int x;
  int y;
  int points = 1;
  boolean displayed;
  boolean white;
  boolean active = false;
  boolean selected = false;
  boolean firstMove = true;
  
  Pawn(int x, int y, boolean displayed, boolean white) {
    this.x = x;
    this.y = y;
    this.displayed = displayed;
    this.white = white;
  }
  
  void display() {
    if(white) {
      fill(230);
    } else {
      fill(30);
    }
    rect(100*x+130, 100*y+140, 40, 50);
    ellipse(100*x+150, 100*y+125, 40, 40);
  }
  
  boolean selected() {
    if(mousePressed && (mouseX>100*(x+1)||mouseX<100*(x+2)||mouseY>100*(y+1)|| mouseY<100*(y+2))) {
      return true;
    } else {
      return false;
    }
  }
  
  void move(int x, int y) {
    this.x = floor(x/100)-1;
    this.y = floor(y/100)-1;
  }
  
  void hover(int mx, int my) {
    active = (mx>100*(x+1) && mx<100*(x+2) && my>100*(y+1) && my<100*(y+2));
  }
}
