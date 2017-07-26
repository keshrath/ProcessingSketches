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

/**
 * This class handles the spout controls.
 *
 * @author Mathias Markl
 */
class SpoutControls {

  private Timer applet;
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

  public void createControls(Timer applet, Config config, SpoutManager spout) {
    this.applet = applet;
    this.config = config;
    this.spout = spout;

    spout.CreateSpoutControl("Show Millis", "bool", 1);
    spout.CreateSpoutControl("Show Animation", "bool", 1);
    spout.CreateSpoutControl("Fonts", "float", 1, 10, 1);
    spout.CreateSpoutControl("Size", "float", 1, 3, 2);
    spout.CreateSpoutControl("Text Align", "float", 1, 9, 5);
    spout.CreateSpoutControl("Timer", "text", "");
    spout.CreateSpoutControl("Restart Timer", "event", 0);
    spout.CreateSpoutControl("Loop Video", "bool", 1);
  }

  public void updateControls() {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    String currentTimerText = null;

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {
        print("(" + i + ") : [" + controlName[i] + "] : Type [" + controlType[i] + "] : Value [" + controlValue[i] + "] : Text [" + controlText[i] + "]" + "\n");

        if (controlName[i].equals("Show Millis")) {
          config.setShowMillis((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Show Animation")) {
          config.setShowAnimation((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Fonts")) {
          config.setFontStyle((int) controlValue[i]);
        }

        if (controlName[i].equals("Size")) {
          config.setTextSize((int) controlValue[i]);
        }

        if (controlName[i].equals("Text Align")) {
          config.setTextAlign((int) controlValue[i]);
        }

        if (controlName[i].equals("Timer")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            currentTimerText = controlText[i];
          }
        }

        if (controlName[i].equals("Restart Timer")) {
          println(currentTimerText);
          if (controlValue[i] == 1 && currentTimerText != null && !currentTimerText.isEmpty()) {

            Integer textInteger = CountdownTimer.parseInteger(currentTimerText);
            if (textInteger != null) {
              applet.restartTimer(textInteger);
            } else {
              Date textDate = CountdownTimer.parseDate(currentTimerText);
              if (textDate != null) {
                applet.restartTimer(textDate);
              } else {
                println("Text (" + currentTimerText + ") couldn't be parsed. Timer couldn't restart");
              }
            }
          }

          spout.CreateSpoutControl("Restart Timer", "event", 0);
        }

        if (controlName[i].equals("Loop Video")) {
          config.setVideoLoop((boolean) (controlValue[i] == 1));
        }
      }
    }
  }
}