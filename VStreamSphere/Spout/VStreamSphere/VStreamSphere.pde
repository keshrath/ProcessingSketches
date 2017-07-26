/** 
 * This code is copyright (c) Mathias Markl 2016
 * 
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */

import java.util.*;

import g4p_controls.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

/**
 * VStreamSphere is a Processing application to render multiple spheres. The
 * application implements a SpoutReceive to receive a video stream. This stream
 * is used to set the texture of the spheres. There are multiple controls to
 * change the size and number of the spheres. The controls window can be opened
 * by pressing the 'c' key.
 *
 * Processing keys:
 * - 'l'   ->   Toggels the console window.
 * - 'p'   ->   Prints the console stream to the standard system out stream.
 * - 'c'   ->   Opens the control window.
 *
 * Processing mouse:
 * - right-click   -> 	Opens the Spout SenderDialog.
 *
 * PControls:
 * - Collision Detection   ->   If the checkbox is set to active, the spheres will
 *                              check for collision with other spheres.
 * - Sound Reactive        ->   If the checkbox is set to active, the spheres will
 *                              be sound reactive.
 * - Sphere Count          ->   Slider to determine the number of spheres. It's
 *                              might not be possible to have to maximum number of
 *                              spheres and collision detection active at the same
 *                              time. If that's the case a log message will be shown.
 * - Sphere Radius         ->   Use the slicer to set the sphere radius.
 * - Sphere Rotation       ->   Use the slider to set the sphere rotation speed.
 *
 * @author Mathias Markl
 */

public static final float radiusXFactor = 1.43;
public static final float radiusYFactor = 1.15;

private static final String SPOUT_NAME = "VStreamSphere";

private Console console;
private boolean showConsole;

private Config config;

private Minim minim;
private AudioInput in;
private BeatListener beatListener;

private PControls pControls;
private boolean pControlsOpen;

private ArrayList<Sphere> sphereList;
private PImage textureImg;

private SpoutManager spout;
private SpoutControls spoutControls;

public void settings() {
  size(1280, 720, P3D);
}

public void setup() {
  textureMode(NORMAL);
  lights();

  init();
  createSphere();
}

public void init() {
  console = new Console(this);
  console.start();
  console.checkDuplicateAppender();
  showConsole = false;

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 1024);
  beatListener = new BeatListener(in, 20); 

  config = new Config();

  pControls = new PControls(this, config);
  pControlsOpen = false;

  sphereList = new ArrayList<Sphere>();
  textureImg = createImage(1280, 720, RGB);

  spout = new SpoutManager();

  spout.initReceiver("", textureImg);  
  spout.initSender(SPOUT_NAME, width, height);

  spoutControls = new SpoutControls();
  spoutControls.createControls(this, config, spout);

  spout.OpenSpoutControls(SPOUT_NAME);
}

public void changeSettings() {
  sphereList.clear();
  createSphere();
}

public void createSphere() {
  int count = config.getSphereCount();

  if (count > sphereList.size()) {
    int diff = count - sphereList.size();

    if (!config.isCollisionDetection()) {
      for (int i = 0; i < diff; i++) {
        Sphere sphere =  new Sphere(config, config.getSphereRadius(), 40, 40, new PVector(random(0, width), random(0, height)));
        sphere.init();
        sphereList.add(sphere);
      }
    } else {
      float sphereBoxWidth = (config.getSphereRadius() * radiusXFactor) + 150 * radiusXFactor;
      float sphereBoxHeight = (config.getSphereRadius() * radiusYFactor) + 150 * radiusYFactor;

      int boxesWidth = int(width / sphereBoxWidth);
      int boxesHeight = int(height / sphereBoxHeight);

      int slots;
      if (boxesWidth < 1 ||boxesHeight < 1) {
        slots = 0;
      } else {
        slots = boxesWidth * boxesHeight;
      }

      if (slots < count) {
        println("Can't draw " + count + " spheres! Only " + slots + " slots available.");
        println("Reduce either the size or the number of the sphere setting.");

        count = slots;
      }

      sphereList.clear();

      int boxRow = 0;
      for (int i = 0; i < count; i++) {
        float xPos = ((config.getSphereRadius() * radiusXFactor) + 150 * radiusXFactor) / 2; 
        float yPos = ((config.getSphereRadius() * radiusYFactor) + 150 * radiusYFactor) / 2; 

        xPos += (2 * xPos) * (i % boxesWidth);
        yPos += (2 * yPos) * boxRow;

        xPos += 50;
        yPos += 20;

        if (i % boxesWidth == boxesWidth - 1 && i != 0) {
          boxRow++;
        }

        PVector position = new PVector(xPos, yPos);

        Sphere sphere =  new Sphere(config, config.getSphereRadius(), 40, 40, position);
        sphere.init();
        sphereList.add(sphere);
      }
    }
  } else if (count < sphereList.size()) {
    int diff = sphereList.size() - count;

    for (int i = 0; i < diff; i++) {
      sphereList.remove(sphereList.size() - 1);
    }
  }
}

public void draw() {
  background(0);

  update();
  render();

  spout.sendTexture();

  if (showConsole) { 
    background(0);
    console.draw(0, height - 520, width, height);
  }
}

public void update() {
  spoutControls.updateControls();
  pControls.updateControls();
  
  textureImg = spout.receiveTexture(textureImg);

  ArrayList<Sphere> checkList = new ArrayList<Sphere>();

  if (config.isCollisionDetection()) {
    checkList.addAll(sphereList);
  }

  for (Sphere sphere : sphereList) {
    sphere.update(textureImg);
    
    if(config.isBeatReactive()) {
      boolean beat = beatListener.isOnset();
      sphere.updateSpeed(beat);
    }

    if (config.isCollisionDetection()) {
      checkList.remove(sphere);
      for (Sphere checkSphere : checkList) {
        sphere.collisionDetection(checkSphere);
      }
    }
  }
}

public void render() {
  for (Sphere sphere : sphereList) {
    sphere.render();
  }
}

public void keyPressed() {
  switch(key) {
  case 'l':
    showConsole = toggleBoolean(showConsole);
    break;
  case 'p':
    console.print();
    break;
  case 'c':
    if (!pControlsOpen) {
      pControls.openControlWindow();
      pControlsOpen = true;
    }
    break;
  }
}

public void mousePressed() {
  if (mouseButton == RIGHT) {
    JSpout.SenderDialog();
  }
}

private boolean toggleBoolean(boolean value) {
  if (value) {
    return false;
  } else {
    return true;
  }
}

public void exit() {
  spout.closeReceiver();
  spout.CloseSpoutControls();
  spout.closeSender();
  console.stop();
  super.exit();
}

/**
 * PControls
 */

public void handleToggleControlEvents(GToggleControl checkbox, GEvent event) {
  pControls.handleToggleControlEvents(checkbox, event);
}

public void handleSliderEvents(GValueControl slider, GEvent event) { 
  pControls.handleSliderEvents(slider, event);
}

public void drawController(PApplet applet, GWinData data) {
  applet.background(200);
}

public void closeController(PApplet applet, GWinData data) {
  pControlsOpen = false;
}