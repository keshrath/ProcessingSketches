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

/**
 * This class handles the spout controls.
 *
 * @author Mathias Markl
 */
class SpoutControls {

  private VStreamSphere applet;
  private Config config;
  private SpoutManager spout;

  private String[] controlName;
  private int[] controlType;
  private float[] controlValue;
  private String[] controlText;

  public SpoutControls() {
    controlName = new String[20];
    controlType = new int[20];
    controlValue = new float[20];
    controlText = new String[20];
  }

  public void createControls(VStreamSphere applet, Config config, SpoutManager spout) {
    this.applet = applet;
    this.config = config;
    this.spout = spout;

    spout.CreateSpoutControl("Collision D.", "bool", 1);
    spout.CreateSpoutControl("Sound Reactive", "bool", 1);
    spout.CreateSpoutControl("Sphere Count", "float", 1, 30, 5);
    spout.CreateSpoutControl("Sphere Radius", "float", 50, 250, 100);
    spout.CreateSpoutControl("Sphere Rotation", "float", 0, 1, 0.1);
  }

  public void updateControls() {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    String currentTimerText = null;

    if (nControls > 0) {
      boolean changeSettings = false;
      boolean createSphere = false;
      
      for (int i = 0; i < nControls; i++) {

        if (controlName[i].equals("Collision D.")) {
          boolean newValue = (boolean) (controlValue[i] == 1);

          if (newValue != config.isCollisionDetection()) {
            config.setCollisionDetection(newValue);
            changeSettings = true;
          }
        }

        if (controlName[i].equals("Sound Reactive")) {
          config.setBeatReactive((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Sphere Count")) {
          config.setSphereCount(int(controlValue[i]));
          createSphere = true;
        }

        if (controlName[i].equals("Sphere Radius")) {
          float newValue = controlValue[i];

          if (newValue != config.getSphereRadius()) {
            config.setSphereRadius(newValue);
            changeSettings = true;
          }
        }

        if (controlName[i].equals("Sphere Radius")) {
          config.setSphereRotationSpeed(controlValue[i]);
        }
      }

      if (changeSettings) {
        applet.changeSettings();
      } else if (createSphere) {
        applet.createSphere();
      }
    }
  }
}