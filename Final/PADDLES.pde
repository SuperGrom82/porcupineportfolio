//PADDLES SETUP//


void drawPaddles() {
  fill(255);
  rect(paddleXL, paddleYL, paddleW, paddleH);
  rect(paddleXR, paddleYR, paddleW, paddleH);
}

void restrictPaddle() {
  if (paddleYL - paddleH/2 <0) {
    paddleYL = paddleYL + paddleS;
  }
  if (paddleYL + paddleH/2 > height) {
    paddleYL = paddleYL - paddleS;
  }
  if (paddleYR - paddleH/2 <0) {
    paddleYR = paddleYR + paddleS;
  }
  if (paddleYR + paddleH/2 > height) {
    paddleYR = paddleYR - paddleS;
  }
}

void movePaddle () {
  if (downL) {
    paddleYL = paddleYL + paddleS;
  }
  if (upL) {
    paddleYL = paddleYL - paddleS;
  }
  if (downR) {
    paddleYR = paddleYR + paddleS;
  }
  if (upR) {
    paddleYR = paddleYR - paddleS;
  }
}

void contactPaddle() {
  if (x - w/2 < paddleXL + paddleW/2 && y - h/2 < paddleYL + paddleH/2 && y + h/2 > paddleYL - paddleH/2) {
    if (speedX < 0) {
      speedX = -speedX;
    }
  } else if (x + w/2 > paddleXR - paddleW/2 && y - h/2 < paddleYR + paddleH/2 && y + h/2 > paddleYR - paddleH/2) {
    if (speedX > 0) {
      speedX = -speedX;
    }
  }
}

void bounceOff() {
  if ( x > width - w/2) {
    setup();
    speedX = -speedX;
    scoreL = scoreL+1;
  } else if ( x < 0 + w/2 ) {
    speedX = -speedX;
    setup();
    scoreR = scoreR+1;
  }
  if ( y > height - h/2) {
    speedY = -speedY;
  } else if ( y < 0 + h/2) {

    speedY = -speedY;
  }
}
