class King {
  int x;
  int y;
  boolean displayed;
  boolean white;
  boolean active = false;
  boolean selected = false;
  boolean check = false;
  
  King(int x, int y, boolean displayed, boolean white) {
    this.x = x;
    this.y = y;
    this.displayed = displayed;
    this.white = white;
  }
  
  void display() {
    if(white) {
      fill(230);
      stroke(230);
    } else {
      fill(30);
      stroke(30);
    }
    if(check) {
      fill(255, 0, 0);
      stroke(255, 0, 0);
    }
    rect(100*x+120, 100*y+140, 60, 60);
    strokeWeight(2);
    line(100*x+150, 100*y+100, 100*x+150, 100*y+140);
    line(100*x+130, 100*y+120, 100*x+170, 100*y+120);
    noStroke();
  }
  
  void move(int x, int y) {
    this.x = floor(x/100)-1;
    this.y = floor(y/100)-1;
  }
  
  void hover(int mx, int my) {
    active = (mx>100*(x+1) && mx<100*(x+2) && my>100*(y+1) && my<100*(y+2));
  }
}
