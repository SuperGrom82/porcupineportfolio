//Patrick McNally | 27 April 2023 | Pong
boolean play;
int x, y, w, h, speedX, speedY;
int paddleXL, paddleYL, paddleW, paddleH, paddleS;
int paddleXR, paddleYR;
boolean upL, downL;
boolean upR, downR;
int scoreL = 0;
int scoreR = 0;
int winScore = 2;

void setup() {
  size (800, 600);
  background(0);
  x = width/2;
  y = height/2;
  w = 30;
  h = 30;
  speedX = 4;
  speedY = 3;
  textSize(40);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  paddleXL = 50;
  paddleYL = height/2;
  paddleXR = width-40;
  paddleYR = height/2;
  paddleW = 30;
  paddleH = 100;
  paddleS = 5;
  play = false;
}

void draw() {
  if (!play) {
    startScreen();
  } else {

    background(0);

    drawCircle ();

    moveCircle ();

    bounceOff  ();

    drawPaddles  ();

    movePaddle ();

    restrictPaddle();

    contactPaddle();

    scores();

    gameOver();
  }
}

void scores() {
  fill(255);
  text(scoreL, 100, 50);
  text(scoreR, width-100, 50);
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    upL = true;
  }
  if (key == 's' || key == 'S') {
    downL = true;
  }
  if (keyCode == UP) {
    upR = true;
  }
  if (keyCode == DOWN) {
    downR = true;
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    upL = false;
  }
  if (key == 's' || key == 'S') {
    downL = false;
  }
  if (keyCode == UP) {
    upR = false;
  }
  if (keyCode == DOWN) {
    downR = false;
  }
}

void startScreen() {
  text("PONG GAME", width/2, 250);
  text("Click to Start", width/2, 360);
  if (mousePressed) {
    speedX = 4;
    speedY = 3;
    play = true;
  }
}


void gameOver() {
  if (scoreL == winScore) {
    speedX = 0;
    speedY = 0;
    text("GAMEOVER", width/2,250);
  } else if (scoreR == winScore) {
    speedX = 0;
    speedY = 0;
     text("GAMEOVER", width/2,250);
  }
}
