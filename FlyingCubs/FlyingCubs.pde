import processing.opengl.*;

/**
 * FlyingCubs is an 3D Animation adapted 
 * from Josue Page's Dancing Boxes to work
 * with Spout and react to keyboard inputs.
 *
 * Josue Page: http://www.openprocessing.org/user/9498
 *
 * FlyingCubs commands:
 * 
 * - Press 's' to change the stroke mode. (on/off)
 * - Press 'c' to change the color mode. (on/off)
 * - Press 'd' to change the stroke color mode. (on/off)
 * - Press 'f' to change the box size mode. (on/off)
 * - Press 'w' to change the box count mode. (on/off)
 *
 * @author Mathias Markl
 */

private static final String NAME = "SpoutSenderFlyingCubs";

// Settings
private boolean showStroke = true;
private boolean colorChange = true;
private boolean colorChangeStroke = false;
private boolean boxSizeChange = true;
private boolean boxCountChange = true;

// Default Values
private final float DEFAULT_BOX_SIZE = 50;
private final float DEFAULT_BOX_COUNT = 100;
private final float DEFAULT_NOISE_STEP = 0.001;

private float theta = 0.1f;
private float t = 0.1f;

private float noiseStep = 0.001f;

private SpoutManager spout;

public void settings() {
  size(500, 450, P3D);
}

public void setup() {
  colorMode(HSB, 360, 100, 100);
  background(0);

  if (showStroke) {
    stroke(0, 0, 0);
  } else {
    noStroke();
  }

  fill(map(noise(noiseStep), 0, 1, 0, 360), 
    map(noise(noiseStep), 0, 1, 20, 100), 
    map(noise(noiseStep), 0, 1, 20, 100));

  spout = new SpoutManager();
  spout.initSender(NAME, width, height);
}

public void draw() {
  background(0);
  translate(width/2, height/2, -1000);

  if (showStroke) {
    stroke(0, 0, 0);
  } else {
    noStroke();
  }

  if (colorChange || colorChangeStroke) {
    color col = color(map(noise(noiseStep), 0, 1, 0, 360), 
      map(noise(noiseStep), 0, 1, 20, 100), 
      map(noise(noiseStep), 0, 1, 20, 100));

    if (colorChange) {
      fill(col);
    }
    if (colorChangeStroke) {
      stroke(col);
    }
  }

  float boxCount = DEFAULT_BOX_COUNT;
  if (boxCountChange) {
    boxCount = map(noise(noiseStep), 0, 1, 20, 180);
  }

  float boxSize = DEFAULT_BOX_SIZE;
  if (boxSizeChange) {
    boxSize = map(noise(noiseStep), 0, 1, 20, 80);
  }

  rotateX(t);
  for (float x=0; x<2*PI; x+=PI/(int)boxCount) {
    rotateY(theta);
    rotate(x);
    pushMatrix();
    translate(500, 0, 0);
    box(boxSize);
    popMatrix();
  }

  rotateY(PI);
  for (float x=0; x<2*PI; x+=PI/(int)boxCount) {
    rotateY(theta);
    rotate(x);
    pushMatrix();
    translate(500, 0, 0);
    box(boxSize);
    popMatrix();
  }

  theta += 0.01;
  t += 0.01;
  noiseStep += DEFAULT_NOISE_STEP;

  spout.sendTexture();
}

public void keyPressed() {
  switch(key) {
  case 's':
    if (showStroke) {
      showStroke = false;
    } else {
      showStroke = true;
    }
    break;
  case 'c':
    if (colorChange) {
      colorChange = false;
    } else {
      colorChange = true;
    }
    break;
  case 'd':
    if (colorChangeStroke) {
      colorChangeStroke = false;
    } else {
      colorChangeStroke = true;
    }
    break;
  case 'f':
    if (boxSizeChange) {
      boxSizeChange = false;
    } else {
      boxSizeChange = true;
    }
    break;
  case 'w':
    if (boxCountChange) {
      boxCountChange = false;
    } else {
      boxCountChange = true;
    }
    break;
  default:
    println("The key is not supported.");
  }
}

public void exit() {
  spout.closeSender();
  super.exit();
} 