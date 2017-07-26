/** 
 * This code is copyright (c) Mathias Markl 2015
 * 
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 2 of the License, or (at your option) any later
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
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;

import at.mukprojects.console.*;
import at.mukprojects.countdown.*;

import g4p_controls.*;

import processing.video.*;

/**
 * Timer is a Processing application to render a custom countdown. The countdown 
 * can be either till a certain date or a given amount of milliseconds. There are
 * multiple controls to change the look of the timer. The controls window can be
 * opened by pressing the 'c' key.
 *
 * Processing keys:
 * - 'l'   ->   Toggels the console window.
 * - 'p'   ->   Prints the console stream to the standard system out stream.
 * - 'c'   ->   Opens the control window.
 *
 * PControls:
 * - Show Millis     ->   Determines if the countdown displays milliseconds or not.
 * - Show Animation  ->   If the checkbox is set to active, the last 30 seconds 
 *                        will be rendered differently.
 * - Fonts           ->   Use the slider to switch between different fonts.
 * - Size            ->   Use the slicer to switch between different text sizes.
 * - Text Align      ->   Use the slider to switch between differnt text layouts.
 * - Timer Setting   ->   Use the text field to either set a new ending date or a
 *                        new time in milliseconds. Afterwards press the Button to
 *                        restart the countdown with the new setting.
 * - Loop Video      ->   If the checkbox is set to active, the the video will loop.
 *
 * @author Mathias Markl
 */
 
private static final String SPOUT_NAME = "Timer";

private Console console;
private boolean showConsole;

private Config config;

private PControls pControls;
private boolean pControlsOpen;

private CountdownTime countdown;
private CountdownTimer timerTask;

private boolean finished;

private TimeDrawer drawer;

private Movie movie;
private PImage currentImage;

private SpoutManager spout;
private SpoutControls spoutControls;

public void settings() {
  size(1280, 720, P3D);
}

public void setup() {
  imageMode(CENTER);

  init();
  startTimer();
}

public void init() {
  console = new Console(this);
  console.start();
  console.checkDuplicateAppender();
  showConsole = false;

  config = new Config();

  pControls = new PControls(this, config);
  pControlsOpen = false;
  
  spout = new SpoutManager();
  spout.initSender(SPOUT_NAME, width, height);
  
  spoutControls = new SpoutControls();
  spoutControls.createControls(this, config, spout);
  
  spout.OpenSpoutControls(SPOUT_NAME);
}

public void startTimer() {
  timerTask = new CountdownTimer();
  countdown = timerTask.start(config.getStartDate(), 8);

  finished = false;

  setUpDrawer();
  setUpMovie();
}

public void startTimer(int millis) {
  timerTask = new CountdownTimer();
  countdown = timerTask.start(millis, 8);

  finished = false;

  setUpDrawer();
  setUpMovie();
}

public void startTimer(Date date) {
  timerTask = new CountdownTimer();
  countdown = timerTask.start(date, 8);

  finished = false;

  setUpDrawer();
  setUpMovie();
}

public void setUpDrawer() {
  drawer = new TimeDrawer(config);
}

public void setUpMovie() {

  if (movie != null) {
    movie.stop();
  }
  movie = new Movie(this, "movie.mov");
}

public void restartTimer(int millis) {
  stopTimer();
  startTimer(millis);
}

public void restartTimer(Date date) {
  stopTimer();
  startTimer(date);
}

public void stopTimer() {
  timerTask.stop();
}

public void draw() {
  background(0);

  updateTimer();
  renderTimer();

  spout.sendTexture();

  if (showConsole) {
    console.draw(0, height - 520, width, height);
  }
}

public void updateTimer() {
  spoutControls.updateControls();
}

public void renderTimer() {

  long timer = countdown.get();

  if (timer <= 0) {
    if (!finished) {

      if (config.isVideoLoop()) {
        movie.loop();
      } else {
        movie.play();
      }

      timerTask.stop();
      finished = true;
    }

    if (currentImage != null) {
      image(currentImage, width / 2, height / 2);
    }
  } else {
    drawer.render();
  }
}

public void movieEvent(Movie m) {
  m.read();

  PImage img = createImage(movie.width, movie.height, RGB);
  img.copy(m, 0, 0, m.width, m.height, 0, 0, m.width, m.height);

  float wImg = img.width;
  float hImg = img.height;
  float ratio = 1;

  if (wImg > 0 && hImg > 0) {
    if (wImg > hImg) {
      ratio = width / wImg;
    } else if (wImg < hImg) {
      ratio = height / hImg;
    } else {
      ratio = height / hImg;
    }

    img.resize(int(img.width * ratio), int(img.height * ratio));
  }

  currentImage = img;
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

private boolean toggleBoolean(boolean value) {
  if (value) {
    return false;
  } else {
    return true;
  }
}

public void exit() {
  stopTimer();
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

public void handleTextEvents(GEditableTextControl textcontrol, GEvent event) { 
  pControls.handleTextEvents(textcontrol, event);
}

public void handleButtonEvents(GButton button, GEvent event) {
  pControls.handleButtonEvents(button, event);
}

public void drawController(PApplet applet, GWinData data) {
  applet.background(200);
}

public void closeController(PApplet applet, GWinData data) {
  pControlsOpen = false;
}