/**
 * SoundImages is a Resolume Arena 5 plugin and all settings can be controlled by Resolume.
 * 
 * The program loads images form a specified folder and starts a slide show. The slide show
 * can be enabled to be sound reactive. In that case the image gets blended on every beat and
 * and on every kick, snare or hat filters are applied to the image.
 *
 * @author Mathias Markl
 */

import ddf.minim.*;
import java.util.*;

public static final long DEFAULT_WAITING_TIME = 1000 * 60 * 5; // mil * sec * min

private static final String SPOUT_NAME = "ImageSlider";

private Minim minim;
private AudioInput in;
private BeatListener beatListener;

private Config config;

private SpoutManager spout;
private Controls controls;

private ImageManager manager;
private ImageLoaderThread loaderThread;

private ImageDrawer drawer;

public void settings() {
  size(1280, 720, P3D);
}

public void setup() {
  colorMode(HSB, 360, 100, 100, 100);

  minim = new Minim(this);
  config = new Config();

  spout = new SpoutManager();
  controls = new Controls();

  in = minim.getLineIn(Minim.STEREO, 1024);
  beatListener = new BeatListener(in, 300);

  manager = new ImageManager();

  spout.initSender(SPOUT_NAME, width, height);

  controls.createControls(spout);
  spout.OpenSpoutControls(SPOUT_NAME);

  init();
}

public void init() {
  startLoader();

  drawer = new ImageDrawer(manager, config, beatListener);
  drawer.init();
}

public void draw() {
  update();
  render();
}

public void update() {
  if (controls.updateControls(config)) {
    frameRate(config.getFrames());
    init();
  }

  drawer.update();
}

public void render() {
  surface.setTitle("Path: " + config.getPath() + " BlendModes: " + config.getBlendMode() + " K: " + config.getKickFilter() +
    " S: " + config.getSnareFilter() + " H: " + config.getHatFilter() + " FPS: " + frameRate);

  drawer.render();

  spout.sendTexture();
}

public void exit() {
  if (loaderThread != null) {
    loaderThread.stopLoading();
  }

  spout.closeSender();
  spout.CloseSpoutControls();

  super.exit();
}

private void startLoader() {
  if (loaderThread != null) {
    loaderThread.stopLoading();
  }

  if (config.isClearList()) {
    manager.clearList();
  }

  loaderThread = new ImageLoaderThread(new ImageLoader(DEFAULT_WAITING_TIME, config.getPath(), manager), config.getPath());
  loaderThread.startLoading();
}

private void setScreenSize(int screenWidth, int screenHeight) {
  surface.setSize(screenWidth, screenHeight);
}