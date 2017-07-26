/**
 * SoundSphere is a Resolume Arena 5 plugin and all settings can be controlled by Resolume. 
 * 
 * The program renders a 3D sphere with multiple particles. It's possible to activate a
 * sound library. In that case the sphere will be sound reactive and change his size and
 * color based on the mix line input.
 *
 * @author Mathias Markl
 */

import ddf.minim.*;
import ddf.minim.analysis.*;

private static final String SPOUT_NAME = "SoundSphere";

private SphereSpace sphere;

private Minim minim;
private AudioInput in;
private BeatListener beatListener;

private Config config;
private BeatInfo info;

private SpoutManager spout;
private Controls controls;

public void settings() {
  size(800, 450, P3D);
}

public void setup() {
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  textAlign(CENTER);

  lights();
  smooth();

  minim = new Minim(this);

  spout = new SpoutManager();
  controls = new Controls();

  spout.initSender(SPOUT_NAME, width, height);

  controls.createControls(spout);
  spout.OpenSpoutControls(SPOUT_NAME);

  in = minim.getLineIn(Minim.STEREO, 1024);
  beatListener = new BeatListener(in, 300); 
  config = new Config();
  info = new BeatInfo(in);

  sphere = new SphereSpace(beatListener, config);
  init();
}

public void init() {
  sphere.init(config.getParticles());
}

public void update() {
  if (controls.updateControls(config)) { 
    init();

    sphere.changeColorSetting(config.getSphereColH(), config.getSphereColS(), config.getSphereColB(), config.getSphereColT());
    sphere.changeRadiusSetting(config.getRadiusMin(), config.getRadiusMax());
    sphere.changeZoomSpeedSetting(config.getZoomSpeed());
  }

  sphere.changeZoomSetting(config.getMinZoom(), config.getMaxZoom());
  sphere.changePosSetting(config.getXPos(), config.getYPos(), config.getZPos());
  sphere.changeDetailSettings(config.getSphereDetails());

  sphere.update();
}

public void draw() {
  update();
  render();
}

public void render() {
  background(0);

  if (config.showBeatInfo()) {
    info.render();
  }

  sphere.render();

  spout.sendTexture();
}

public void exit() {
  spout.closeSender();
  spout.CloseSpoutControls();
  super.exit();
}