/**
 * TriangleAnimation is build as a SpoutSender to work with Resolume Arena 5.
 * 
 * TriangleAnimation commands:
 * 
 * - Press 'c' to change the color mode. (on/off)
 * - Press 'q' to increase the speed.
 * - Press 'w' to decrease the speed.
 *
 * @author Mathias Markl
 */

private static final String NAME = "SpoutSenderTriangleAnimation";

private float col = 0;

private boolean colorChange = true;
private int speed = 7; 

private SpoutManager spout;

public void settings() {
  size(400, 400, P2D);
}

public void setup() {
  frameRate(speed);
  background(0);

  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  noFill();

  spout = new SpoutManager();
  spout.initSender(NAME, width, height);
}

public void draw() {
  background(0);

  if (colorChange) {
    stroke(map(noise(col), 0, 1, 0, 360), 80, 80, 80);
  } else {
    stroke(112, 80, 80, 80);
  }

  for (int i = 0; i < (frameCount % 8); i++) {
    pushMatrix();
    translate(width/2, height/2);

    strokeWeight(5);
    triangle(-30*i, 30*i, 0, -30*i, 30*i, 30*i);

    popMatrix();
  }

  filter(BLUR, 6);
      
  for (int i = 0; i < (frameCount % 8); i++) {
    pushMatrix();
    translate(width/2, height/2);

    strokeWeight(3);
    triangle(-30*i, 30*i, 0, -30*i, 30*i, 30*i); 

    popMatrix();
  }

  col += 0.03;

  spout.sendTexture();
}

public void keyPressed() {
  switch(key) {
  case 'c':
    if (colorChange) {
      colorChange = false;
    } else {
      colorChange = true;
    }
    break;
  case 'q':
    setSpeed(speed + 1);
    break;
  case 'w':
    setSpeed(speed - 1);
    break;
  }
}

private void setSpeed(int newSpeed) {
  if (newSpeed <= 60 && newSpeed >= 1) {
    speed = newSpeed;
    frameRate(speed);
  }
}

public void exit() {
  spout.closeSender();
  super.exit();
} 