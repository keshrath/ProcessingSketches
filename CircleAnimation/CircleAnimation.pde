/**
 * CircleAnimation is build as a SpoutSender to work with Resolume Arena 5.
 * 
 * CircleAnimation commands:
 * 
 * - Press 'r' to restart the animation with a new setting. The setting is
 *   set random and gets printed to the console screen.
 * - Press 'f' to switch the fade mode: (fade effect on/off)
 *
 * @author Mathias Markl
 */

private static final String NAME = "SpoutSenderCircleAnimation";

private float a, b = 0;
private float col = 0;

private float aInc = 0.01;
private float bInc = 0.06;

private boolean fade = false;
private int fadeTimer = 5;

private float initX = 250;

private SpoutManager spout;

public void setup() {
  size(1280, 720, P3D);

  background(0);
  colorMode(HSB, 360, 100, 100);

  smooth();
  strokeWeight(3);

  spout = new SpoutManager();
  spout.initSender(NAME, width, height);
}

public void draw() {
  translate(280, 0);
  if (fade && frameCount % 25 == 0) {
    fill(0, 50);
    noStroke();
    rect(0, 0, width, height);
  }
  
  if (fade && frameCount % 5 == 0) {
    fill(0, 20);
    noStroke();
    rect(0, 0, width, height);
  }



  stroke(0,0, 100, 20);

  float x0 = map(sin(a), -1, 1, 20, 720 - 20);
  float y0 = map(cos(a), -1, 1, 20, 720 -20);

  float x1 = map(sin(b), -1, 1, 20, 720 - 20);
  float y1 = map(cos(b), -1, 1, 20, 720 -20);
  
  if(250 == (int) x1 && 430 == (int) y1) {
    background(0);
  }

  line(x0, y0, x1, y1);

  a += aInc;
  b += bInc;

//  col++;
  if (col > 360) {
    col = 0;
  }

  spout.sendTexture();
}

private void restart() {
  a = 0;
  b = 0;

  background(0);

  aInc = random(0.01, 0.07);
  bInc = random(0.01, 0.07);

  println("Setting:");
  println("aInc: " + aInc + ", bInc: " + bInc);
}

public void keyPressed() {
  switch(key) {
  case 'r':
    restart();
    break;
  case 'f':
    if (fade) {
      fade = false;
    } else {
      fade = true;
    }
    break;
  default:
    println("key is not supported.");
  }
}

public void exit() {
  spout.closeSender();
  super.exit();
}

public void mousePressed() {
background(0);
}