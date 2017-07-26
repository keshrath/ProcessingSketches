/**
 * DancingSticks is a Resolume Arena 5 plugin and all settings can be controlled by Resolume.
 * 
 * The program renders multiple sticks, which are rotating around a circle. Multiple settings
 * can be modified by Resolume. So many different looking animations can be created by just
 * changing the parameters.
 *
 * @author Mathias Markl
 */

private static final String SPOUT_NAME = "DancingSticks";

private Config config;
private SpoutManager spout;
private Controls controls;

private float a;
private float b;

private float col;

public void settings() {
  size(800, 450, P2D);
}

public void setup() {
  colorMode(HSB, 360, 100, 100, 255);

  smooth();
  strokeWeight(3);

  config = new Config();

  spout = new SpoutManager();
  controls = new Controls();
  
  spout.initSender(SPOUT_NAME, width, height);
  
  controls.createControls(spout);
  spout.OpenSpoutControls(SPOUT_NAME);
}

public void draw() {
  background(0);
  
  controls.updateControls(config);

  for (int j = 0; j < config.getDrawer(); j++) {
    for (int i = 0; i < config.getLines(); i++) {
      float currentA = a + (config.getMulFactor() * j) + (i * config.getAInc());

      float x0 = map(sin(currentA), -1, 1, 20 + 150, width - 20 - 150);
      float y0 = map(cos(currentA), -1, 1, 20 + 25, height - 20 - 25);

      float currentB = b + (config.getMulFactor() * j) + (i * config.getBInc());
      float x1 = map(sin(currentB), -1, 1, 20 + 150, width - 20 - 150);
      float y1 = map(cos(currentB), -1, 1, 20 + 25, height - 20 - 25);

      stroke(map(noise(col), 0, 1, config.getColRangeDown(), config.getColRangeUp()), config.getColS(), config.getColB(), config.getColT());
      line(x0, y0, x1, y1);

      col += 0.03;
    }
  }

  a += config.getAInc();
  b += config.getBInc();

  spout.sendTexture();
}

public void exit() {
  spout.closeSender();
  spout.CloseSpoutControls();
  super.exit();
} 