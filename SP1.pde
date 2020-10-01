//class
Game game;
//loaded fra data
PFont font;

void setup() {
  size(1001, 1001);
  //hastighed
  frameRate(10); 
  font = loadFont("Serif-16.vlw");
  //størrelse på teksten  
  textFont(font, 16);
  //class igen
  game = new Game(25, 25, 5, 5);
}
void draw() {
  //kalder update
  game.update();
  background(0); //sort baggrund
  
  //dobbelt array, nest in a nest  
  int[][] board = game.getBoard();
  
  //for loop. nest kommer ind i for loop
  for (int y = 0; y < game.getHeight(); y++) {
    for (int x = 0; x < game.getWidth(); x++) {
      //println(board[x][y]);
      if (board[x][y]==1) {
        //spilleren er som en firkant, som bliver printet i det felt spilleren står i
        println("player found " + x + " " + y);
        fill(0, 0, 255); //blå - dot
      } else if (board[x][y]==2) {
        fill(255, 0, 0); //rød - enemies
      } else if (board[x][y]==3) {
        fill(0, 255, 0); //grøn
      } else if (board[x][y]==4) {
        fill(255, 0, 255);
      } else if (board[x][y]==0) { 
        fill(0, 0, 0); //går væk fra en firkant - ingen farve - baggrunden
      }
      stroke(100, 100, 100); //farve på linjer 
      rect(x*40, y*40, 40, 40); //firkanter størrelse
    }
  }
  fill(255); //De hvide riller i spiller. Indrammer de sorte vokse
  text("Player 1 Lives: "+game.playerLife, 25, 25); //Hvor mange liv player 1 har tilbage
  text("Player 2 Lives; "+game.player2Life, 25,50); //hvor mange liv player 2 har tilbage
  game.gameOver();
}
//kalder metoden i class
void keyPressed() {
  game.onKeyPressed(key);
}
//kalder metoden i class
void keyReleased() {
  game.onKeyReleased(key);
}
