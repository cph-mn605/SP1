class Game { //<>// //<>// //<>// //<>// //<>//
  // egenskaber
  int w;
  int h;
  int numberOfEnemies;
  int numberOfHealth; //antallet af grønsagerne
  int playerLife;
  int player2Life;
  int[][]board;
  Dot player; //den blå spiller
  Dot player2; //den lyserøde spiller
  
  //Det skal være array da der skal være mere end en 
  Dot[] enemies;
  Dot[] health; 


  Keys keys;
  // konstruktør
  Game(int gW, int gH, int nE, int nH) {
    w = gW;
    h = gH;
    numberOfEnemies = nE;
    numberOfHealth = nH; 
    enemies = new Dot[nE];
    health = new Dot[nH]; 
    playerLife=100;
    player2Life=100;
    board  = new int[gW][gH];
    player = new Dot(0, 1, w-1, h-1);
    player2 = new Dot(10, 15, w-1, h-1);
    keys = new Keys();
    for (int i = 0; i < nE; ++i) { 
      enemies[i] = new Dot(w-1, h-1, w-1, h-1);
    }
    for (int i = 0; i < nH; ++i) { 
      health[i] = new Dot(w-1, h-1, w-1, h-1);
    }
  }
  
  // metoder
  int[][] getBoard() { 
    return board;
  }
  public int getWidth() {
    return h;
  }
  public int getHeight() {
    return w;
  }
  int getPlayerLife() {
    return playerLife;
  }
  int getPlayer2Life() {
    return player2Life;
  }
  void onKeyPressed(char k) {
    keys.onKeyPressed(k);
  }
  void onKeyReleased(char k) {
    keys.onKeyReleased(k);
  }

  //bliver kaldt på i main 
  void update() {
    updatePlayer();
    updateEnemies();
    updateHealth(); 
    checkForCollisions();
    checkForCollisionsHealth();
    clearBoard();
    populateBoard();
  }
  
 
  void updatePlayer() {
    // tjekke om spilleren har trykket på a,s,d eller w
    if (keys.wDown) { 
      player.moveUp();
    }
    if (keys.aDown) {
      player.moveLeft();
    }
    // cond3 relateret til keypressed a
    if (keys.sDown) {
      player.moveDown();
    }
    if (keys.dDown) {
      player.moveRight();
    }
    
    //update player 2
    // tjekke om spilleren har trykket på arrow keys
    if (keys.akuDown) {
      player2.moveUp();
    }
    if (keys.aklDown) {
      player2.moveLeft();
    }
    if (keys.akdDown) {
      player2.moveDown();
    }
    if (keys.akrDown) {
      player2.moveRight();
    }
  }


  void updateEnemies() {
    // loope igennem alle fjender
    for (int i=0; i<enemies.length; i++) {
      // nogle gange skal fjende i følge efter spiller
      // andre gange flytte sig random
      if (i>=0) {
        int dX = player.xPos - enemies[i].xPos;
        int dY = player.yPos - enemies[i].yPos;
        int dX2 = player2.xPos - enemies[i].xPos;
        int dY2 = player2.yPos - enemies[i].yPos;
        //går imod spiller 1
        if (dX>0) {
          //spilleren er til højre - så flyt mod højr
          enemies[i].moveRight();
        } else  if (dX<0) {
          enemies[i].moveLeft();
        } else if (dY>0) {
          //spilleren er til højre - så flyt mod højr
          enemies[i].moveDown();
        } else if (dY<0) {
          enemies[i].moveUp();
        }
        //går imod spiller 2
        if (dX2>0) {
          //spilleren er til højre - så flyt mod højr
          enemies[i].moveRight();
        } else  if (dX2<0) {
          enemies[i].moveLeft();
        } else if (dY2>0) {
          //spilleren er til højre - så flyt mod højr
          enemies[i].moveDown();
        } else if (dY2<0) {
          enemies[i].moveUp();
        }
      }
      int rand = (int) random(4);
      if (rand == 0) {
        enemies[i].moveUp();
      }
      if (rand == 1) {
        enemies[i].moveDown();
      }
      if (rand == 2) {
        enemies[i].moveRight();
      }
      if (rand == 3) {
        enemies[i].moveLeft();
      }
    }
  }
  void updateHealth() { 
    //loope igennem alle health
    for (int i=0; i<health.length; i++) {
      if (i>=0) {
        int dX = player.xPos - health[i].xPos;
        int dY = player.yPos - health[i].yPos;
        int dX2 = player2.xPos - health[i].xPos;
        int dY2 = player2.yPos - health[i].xPos;
        if (dX<0) {
          //spilleren er til højre - så flyt mod højr
          health[i].moveRight();
        } else  if (dX>0) {
          health[i].moveLeft();
        } else if (dY<0) {
          //spilleren er til højre - så flyt mod højr
          health[i].moveDown();
        } else if (dY>0) {
          health[i].moveUp();
        }
        if (dX2<0) {
          //spilleren er til højre - så flyt mod højr
          health[i].moveRight();
        } else  if (dX2>0) {
          health[i].moveLeft();
        } else if (dY2<0) {
          //spilleren er til højre - så flyt mod højr
          health[i].moveDown();
        } else if (dY2>0) {
          health[i].moveUp();
        }
      }
      //rand = random
      int rand = (int) random(4);
      if (rand == 0) {
        health[i].moveUp();
      }
      if (rand == 1) {
        health[i].moveDown();
      }
      if (rand == 2) {
        health[i].moveRight();
      }
      if (rand == 3) {
        health[i].moveLeft();
      }
    }
  }
  void checkForCollisions() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi koll
    // spør hver fjende er du samme sted som player?
    for (int i=0; i<enemies.length; i++) {
      if (enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY()) {
        // then coll and player looses one lifepoint
        if (playerLife>0) //fortsætter ikke efter 0
        {
          playerLife--; //falder i liv
        }
      }
      if (enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY()) {
        if (player2Life>0) {
          player2Life--;
        }
      }
    }
  }
  void checkForCollisionsHealth() {
    // dvs hvis der er 1 i feltet og 2 er samme sted har vi koll
    // spør hver fjende er du samme sted som player?
    for (int i=0; i<health.length; i++) {
      //spiller 1's liv går op pr kollision
      if (health[i].getX() == player.getX() && health[i].getY() == player.getY()) {
        // then coll and player heals one lifepoint
        if (playerLife<100) //stiger ikke over 100
        {
          playerLife++; //stiger i liv
        }
        //fjerner det liv vi kører ind i 
        removeHealth(health, i);
        //gør arrayet health lig sig selv plus et i længde
        addHealth(health);
      }
      //spiller 2's liv går op pr kollision
      if (health[i].getX() == player2.getX() && health[i].getY() == player2.getY()) {
        // then coll and player heals one lifepoint
        if (player2Life<100) //stiger ikke over 100
        {
          player2Life++; //stiger i liv
        }
        //fjerner det liv vi kører ind i 
        removeHealth(health, i);
        //gør arrayet health lig sig selv plus et i længde
        addHealth(health);
      }
    }
  }
  //nulstiller felterne igen når de har været brugt
  void clearBoard() {
    for (int y = 0; y < h; ++y) {
      for (int x = 0; x < w; ++x) {
        board[x][y]=0;
      }
    }
  }
  void populateBoard() {
    // insert player1
    board[player.getX()][player.getY()] = 1;
    // insert player2
    board[player2.getX()][player2.getY()] = 4;
    for (int i = 0; i < enemies.length; ++i) {
      board[enemies[i].getX()][enemies[i].getY()]= 2;
    }
    for (int i = 0; i < health.length; ++i) {
      board[health[i].getX()][health[i].getY()]= 3;
    }
  }

  void removeHealth(Dot[] array, int index) {
    int index2 = array.length-1;
    Dot old = array[index];
    array[index] = array[index2];
    array[index2] = old;
    array = (Dot[])shorten(array);
  }

  void addHealth(Dot[] array) {
    array = (Dot[])expand(array);
    array[array.length-1] = new Dot((int)random(w), (int)random(h), w-1, h-1);
  }
  void gameOver() {
    if (playerLife<1) {
      text("Player 2 is the winner.", width/2, height/2);
      noLoop();
    }
    if (player2Life<1) {
      text("Player 1 is the winner.", width/2, height/2);
      noLoop();
    }
  }
}
