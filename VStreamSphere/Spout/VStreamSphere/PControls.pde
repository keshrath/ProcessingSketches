/** 
 * This code is copyright (c) Mathias Markl 2015
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

/**
 * This class handles the control window.
 *
 * @author Mathias Markl
 */
class PControls {

  private VStreamSphere applet;
  private GWindow controlWindow;

  private Config config;

  private GLabel lStyleControls;
  private GCheckbox cbCollisionDetection;
  private GCheckbox cbSoundReactive;
  private GLabel lSphereCount;
  private GSlider sSphereCount;
  private GLabel lSphereRadius;
  private GSlider sSphereRadius;
  private GLabel lSphereRotation;
  private GSlider sSphereRotation;

  private boolean changeSettings;
  private boolean createSphere;

  public PControls(VStreamSphere applet, Config config) {
    this.applet = applet;
    this.config = config;
  }

  public void openControlWindow() {
    controlWindow = GWindow.getWindow(applet, "PControls", (displayWidth/2) + 640 + 5, (displayHeight/2) - 360, 300, 300, JAVA2D);

    this.changeSettings = false;
    this.createSphere = false;

    /*
     * StyleControls
     */

    // height: 10px to 25px
    lStyleControls = new GLabel(controlWindow, 10, 10, 300 - (2*10), 15, "Sphere Style");
    lStyleControls.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lStyleControls.setTextBold();

    // height: 30px to 45px
    cbCollisionDetection = new GCheckbox(controlWindow, 10, 30, 300 - (2*10), 15, "Collision Detection");
    cbCollisionDetection.setLocalColorScheme(GConstants.CYAN_SCHEME);
    cbCollisionDetection.setSelected(config.isCollisionDetection());

    // height: 50px to 65px
    cbSoundReactive = new GCheckbox(controlWindow, 10, 50, 300 - (2*10), 15, "Sound Reactive");
    cbSoundReactive.setLocalColorScheme(GConstants.CYAN_SCHEME);
    cbSoundReactive.setSelected(config.isBeatReactive());

    // height: 75px to 85px
    lSphereCount = new GLabel(controlWindow, 10, 75, 300 - (2*10), 15, "Sphere Count");
    lSphereCount.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 90px to 140px
    sSphereCount = new GSlider(controlWindow, 10, 90, 300 - (2*10), 50, 12);
    sSphereCount.setLimits(config.getSphereCount(), 1, 30);
    sSphereCount.setEasing(1);
    sSphereCount.setShowValue(true);
    sSphereCount.setShowTicks(true);
    sSphereCount.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 145px to 155px
    lSphereRadius = new GLabel(controlWindow, 10, 145, 300 - (2*10), 15, "Sphere Radius");
    lSphereRadius.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 160px to 210px
    sSphereRadius = new GSlider(controlWindow, 10, 160, 300 - (2*10), 50, 12);
    sSphereRadius.setLimits(config.getSphereRadius(), 50, 250);
    sSphereRadius.setEasing(5);
    sSphereRadius.setShowValue(true);
    sSphereRadius.setShowTicks(true);
    sSphereRadius.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 215px to 225px
    lSphereRotation = new GLabel(controlWindow, 10, 215, 300 - (2*10), 15, "Sphere Rotation");
    lSphereRotation.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 230px to 280px
    sSphereRotation = new GSlider(controlWindow, 10, 230, 300 - (2*10), 50, 12);
    sSphereRotation.setLimits(config.getSphereRotationSpeed(), 0, 1);
    sSphereRotation.setEasing(0.01);
    sSphereRotation.setShowValue(true);
    sSphereRotation.setShowTicks(true);
    sSphereRotation.setLocalColorScheme(GConstants.CYAN_SCHEME);

    controlWindow.setActionOnClose(G4P.CLOSE_WINDOW);

    controlWindow.addDrawHandler(applet, "drawController");
    controlWindow.addOnCloseHandler(applet, "closeController");
  }

  public void updateControls() {
    if (changeSettings) {
      applet.changeSettings();
    } else if (createSphere) {
      applet.createSphere();
    }

    this.changeSettings = false;
    this.createSphere = false;
  }

  public void handleToggleControlEvents(GToggleControl checkbox, GEvent event) {
    if (checkbox == cbCollisionDetection) {
      if (event == GEvent.SELECTED) {
        config.setCollisionDetection(true);
      } else {
        config.setCollisionDetection(false);
      }
      this.changeSettings = true;
    } else if (checkbox == cbSoundReactive) {
      if (event == GEvent.SELECTED) {
        config.setBeatReactive(true);
      } else {
        config.setBeatReactive(false);
      }
    }
  }

  public void handleSliderEvents(GValueControl slider, GEvent event) { 
    if (slider == sSphereCount) {
      config.setSphereCount(slider.getValueI());
      this.createSphere = true;
    } else if (slider == sSphereRadius) {
      config.setSphereRadius(slider.getValueF());
      this.changeSettings = true;
    } else if (slider == sSphereRotation) {
      config.setSphereRotationSpeed(slider.getValueF());
    }
  }
}