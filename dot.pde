class Dot { //<>// //<>//
  //hvilke retninger de enemies/health kan bevæge sig i 
  // egenskaber
  int xPos;
  int yPos;
  int xMax;
  int yMax;

  // konstruktør
  //hvad den skal indeholde
  Dot(int x, int y, int maxX, int maxY) {
    xPos=x;
    yPos=y;
    xMax=maxX;
    yMax=maxY;
  }

  // metoder
  int getX() { 
    return xPos; //retunerer den nye værdi
  }

  int getY() {
    return yPos;
  }

  void moveUp() {
    yPos--; //gør den 1 mindre - når man går en til venstre bliver y en mindre 
    if (yPos < 0) {
      yPos = 0;
    }
  }

  void moveLeft() {
    xPos--; 
    if (xPos < 0) {
      xPos = 0;
    }
  }

  void moveDown() {
    yPos++;
    if (yPos > yMax) {
      yPos = yMax;
    }
  }

  void moveRight() {
    xPos++;
    if (xPos > xMax) {
      xPos = xMax;
    }
  }
}
