class Queen {
  int x;
  int y;
  int points = 9;
  boolean displayed;
  boolean white;
  
  Queen(int x, int y, boolean displayed, boolean white) {
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
    triangle(100*x+120, 100*y+140, 100*x+120, 100*y+120, 100*x+135, 100*y+140);
    triangle(100*x+135, 100*y+140, 100*x+150, 100*y+100, 100*x+165, 100*y+140);
    triangle(100*x+165, 100*y+140, 100*x+180, 100*y+120, 100*x+180, 100*y+140);
    strokeWeight(2);
    if(white) {
      stroke(230);
    } else {
      stroke(30);
    }
    noStroke();
  }
  
  void move() {
    
  }
}
