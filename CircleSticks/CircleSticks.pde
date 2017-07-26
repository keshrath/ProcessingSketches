/**
 * CircleSticks is build as a SpoutSender to work with Resolume Arena 5.
 * 
 * CircleSticks commands:
 * 
 * - Press 'r' to restart the animation with a new setting. The setting is
 *   set random and gets printed to the console screen.
 *
 * @author Mathias Markl
 */
 
private static final String NAME = "SpoutSenderCircleSticks";
 
private float angle = 0;
private float angleInc = 0.2;

private float rMulFaktor = 0.1;
private float mulFactor = 80;
private int drawer = 2;
private int lines = 31;

private float colRangeDown = 80;
private float colRangeUp = 150;

private float colS = 80;
private float colB = 80;
private float colT = 180;

private float strokeWeight = 3;

boolean save = false;
private SpoutManager spout;

public void settings() {
  size(1280, 720, P2D);
}

public void setup() {
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();
  //frameRate(1);
  
  spout = new SpoutManager();
  spout.initSender(NAME, width, height);
}

public void draw() {
  background(0);
  translate(280, 0);
  strokeWeight(strokeWeight);
  
  for (int k = 0; k < drawer; k++) {

    for (int i = 0; i < lines; i++) {
      float[] x = new float[2];
      float[] y = new float[2];

      for (int j = 0; j < 2; j++) {
        float rW = 720 * rMulFaktor * (j+1) + (k*mulFactor);
        float rH = 720 * rMulFaktor * (j+1) + (k*mulFactor);
        float currentAngle = angle + 0.5 * j;

        x[j] = map(sin(currentAngle), -1, 1, 720/2 - rW, 720/2 + rW);
        y[j] = map(cos(currentAngle), -1, 1, 720/2 - rH, 720/2 + rH);
      }

      stroke(map(sin(angle), -1, 1, colRangeDown, colRangeUp), colS, colB, colT);
      line(x[0], y[0], x[1], y[1]);

      angle += 0.2;
    }
  }
  
  spout.sendTexture();
  if(save) {
    saveFrame();
  }
 // saveFrame();
}

private void randomSettings() {
  clear();
  
  angle = 0;

  angleInc = random(0.01, 0.5);

  mulFactor = random (10, 100);
  rMulFaktor = random(0.04, 0.2);

  drawer = (int) random(1, 7);
  lines = (int) random(5, 45);

  colRangeDown = random(0, 359);
  colRangeUp = random(colRangeDown, 360);

  colS = random(20, 100);
  colB = random(20, 100);
  colT = random(100, 255);

  strokeWeight = random(1, 5);

  printSettings();
}

private void printSettings() {
  String s = "Settings\n";

  s += "angleInc: " + angleInc + "\n";
  s += "rMulFaktor: " + rMulFaktor + "\n";
  s += "mulFactor: " + mulFactor + "\n";
  s += "drawer: " + drawer + "\n";
  s += "lines: " + lines + "\n";
  s += "colRangeDown: " + colRangeDown + "\n";
  s += "colRangeUp: " + colRangeUp + "\n";
  s += "colS: " + colS + "\n";
  s += "colB: " + colB + "\n";
  s += "colT: " + colT + "\n";
  s += "strokeWeight: " + strokeWeight;

  println(s);
}

public void keyPressed() {
  if(key == 'r') {
    randomSettings();
  }
    if(key == 's') {
    frameRate(1);
    save = true;
  }
}

public void exit() {
  spout.closeSender();
  super.exit();
} 