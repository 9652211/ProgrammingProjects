class King {
  int x;
  int y;
  boolean displayed;
  boolean white;
  
  King(int x, int y, boolean displayed, boolean white) {
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
    rect(100*x+120, 100*y+140, 60, 60);
    strokeWeight(2);
    if(white) {
      stroke(230);
    } else {
      stroke(30);
    }
    line(100*x+150, 100*y+100, 100*x+150, 100*y+140);
    line(100*x+130, 100*y+120, 100*x+170, 100*y+120);
    noStroke();
  }
  
  void move() {
    
  }
}