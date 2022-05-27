class Square {
  boolean white;
  boolean piece;
  int num;
  
  
  Square() {
    for(int i=0; i<8; i++) {
      for(int j=0; j<8; j++) {
        if((i+j)%2==0) {
          fill(50, 50, 50);
        } else {
          fill(200, 200, 200);
        }
        rect(200+50*i, 200+50*j, 50, 50);
      }
    }
  }
}
