class Keys {
  //egenskaber
  private boolean wDown = false; 
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  //aku= arrow key up
  private boolean akuDown = false;
  private boolean aklDown = false;
  private boolean akdDown = false;
  private boolean akrDown = false;
  // konstruktør
  Keys() {
  }
  // metoder
  //Når du klikker bliver den true
  void onKeyPressed(char k) {
    if (k=='a' || k=='A') {
      aDown=true;
    }
    if (k=='s' || k=='S') {
      sDown=true;
    }
    if (k=='w' || k=='W') {
      wDown=true;
    }
    if (k=='d' || k=='D') {
      dDown=true;
    }
    if (keyCode == CODED || keyCode == LEFT) {
      aklDown=true;
    }
    if (keyCode == CODED || keyCode == DOWN) {
      akdDown=true;
    }
    if (keyCode == CODED || keyCode == UP) {
      akuDown=true;
    }
    if (keyCode == CODED || keyCode == RIGHT) {
      akrDown=true;
    }
  }
  //Når du slipper bliver den false
  void onKeyReleased(char k) {
    if (k=='a' || k=='A') {
      aDown=false;
    }
    if (k=='s' || k=='S') {
      sDown=false;
    }
    if (k=='w' || k=='W') {
      wDown=false;
    }
    if (k=='d' || k=='D') {
      dDown=false;
    }
    if (keyCode == CODED || keyCode == LEFT) {
      aklDown=false;
    }
    if (keyCode == CODED || keyCode == DOWN) {
      akdDown=false;
    }
    if (keyCode == CODED || keyCode == UP) {
      akuDown=false;
    }
    if (keyCode == CODED || keyCode == RIGHT) {
      akrDown=false;
    }
  }
}
