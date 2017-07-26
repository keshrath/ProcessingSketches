/**
 * Mandelbrot is a Resolume Arena 5 plugin and all settings can be controlled by Resolume.
 * 
 * The program renders the Mandelbrot fractal.
 *
 * @author Mathias Markl
 */

private static final String SPOUT_NAME = "Mandelbrot";

private Config config;
private SpoutManager spout;
private Controls controls;

private Fractal mandelbrot;

private double currentZoom;
private boolean zoomIn;
private int zoomCount;

private boolean redraw;

public void settings() {
  size(800, 800, P3D);
}

public void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  smooth();

  config = new Config();
  spout = new SpoutManager();
  controls = new Controls();

  spout.initSender(SPOUT_NAME, width, height);

  controls.createControls(spout);
  spout.OpenSpoutControls(SPOUT_NAME);

  init();
}

public void init() {
  mandelbrot = new Fractal(config, config.getMaxIter(), -0.5, 0, config.getZoomFactor());
  currentZoom = config.getZoomFactor();

  zoomIn = true;
  zoomCount = 0;

  redraw = false;

  mandelbrot.render();

  mandelbrot.setX(config.getXPos());
  mandelbrot.setY(config.getYPos());
}

public void draw() {
  update();
  render();
}

public void update() {
  boolean[] output = controls.updateControls(config);
  
  if (output[0]) {
    mandelbrot.setX(config.getXPos());
    mandelbrot.setY(config.getYPos());
  }
  
  if (output[1]) {
    mandelbrot.setMaxIter(config.getMaxIter());
    mandelbrot.setZoomFactor(config.getZoomFactor());

    redraw = true;
  }

  if (config.isZoom()) {
    mandelbrot.setZoomFactor(currentZoom); 

    if (zoomIn) {
      currentZoom -= currentZoom / config.getZoomSpeed();
    } else {
      currentZoom += currentZoom / config.getZoomSpeed();
    }
    zoomCount++;

    if (zoomCount >= config.getZoomIter()) {
      if (zoomIn) {
        zoomIn = false;
      } else {
        zoomIn = true;
      }
      zoomCount = 0;
    }
  }
}

public void render() {
  surface.setTitle("Mandelbrot - FPS:" + frameRate);

  if (config.isZoom() || redraw) {    
    mandelbrot.render();
    redraw = false;
  }

  if (config.showHint()) {
    float tempX, tempY;

    if (config.isZoom()) {
      tempX = width / 2;
      tempY = height / 2;
    } else {
      tempX = config.getXPos();
      tempY = config.getYPos();
    }

    fill(0, 0, 100);
    noStroke();
    ellipse(tempX, tempY, 3, 3);

    noFill();
    stroke(0, 0, 100);
    ellipse(tempX, tempY, 10, 10);
  }

  spout.sendTexture();
}

public void mousePressed() {
  if (mouseButton == LEFT) {
    currentZoom -= currentZoom / config.getZoomSpeed();
  } else if (mouseButton == RIGHT) {
    currentZoom += currentZoom / config.getZoomSpeed();
  }

  mandelbrot.update(mouseX, mouseY, currentZoom);
  mandelbrot.render();
}

public void exit() {
  spout.closeSender();
  spout.CloseSpoutControls();
  super.exit();
} 