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
 * This class handles the control window.
 *
 * @author Mathias Markl
 */
class PControls {

  private Timer applet;
  private GWindow controlWindow;

  private Config config;

  private GLabel lStyleControls;
  private GCheckbox cbShowMillis;
  private GCheckbox cbShowAnimation;
  private GLabel lFonts;
  private GSlider sFonts;
  private GLabel lSize;
  private GSlider sSize;
  private GLabel lAlign;
  private GSlider sAlign;

  private GLabel lTimerControls;
  private GTextField txfTime;
  private GButton bRestart;

  private GLabel lVideoControls;
  private GCheckbox cbLoopVideo;

  public PControls(Timer applet, Config config) {
    this.applet = applet;
    this.config = config;
  }

  public void openControlWindow() {
    controlWindow = GWindow.getWindow(applet, "PControls", (displayWidth/2) + 640 + 5, (displayHeight/2) - 360, 300, 420, JAVA2D);

    /*
     * StyleControls
     */

    // height: 10px to 25px
    lStyleControls = new GLabel(controlWindow, 10, 10, 300 - (2*10), 15, "Countdown Style");
    lStyleControls.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lStyleControls.setTextBold();

    // height: 30px to 45px
    cbShowMillis = new GCheckbox(controlWindow, 10, 30, 300 - (2*10), 15, "Show Millis");
    cbShowMillis.setLocalColorScheme(GConstants.CYAN_SCHEME);
    cbShowMillis.setSelected(config.isShowMillis());

    // height: 50px to 65px
    cbShowAnimation = new GCheckbox(controlWindow, 10, 50, 300 - (2*10), 15, "Show Animation");
    cbShowAnimation.setLocalColorScheme(GConstants.CYAN_SCHEME);
    cbShowAnimation.setSelected(config.isShowAnimation());

    // height: 75px to 85px
    lFonts = new GLabel(controlWindow, 10, 75, 35, 10, "Fonts");
    lFonts.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 80px to 140px
    sFonts = new GSlider(controlWindow, 10, 80, 300 - (2*10), 60, 12);
    sFonts.setLimits(config.getFontStyleNumber(), 1, 10);
    sFonts.setEasing(1);
    sFonts.setShowValue(true);
    sFonts.setShowTicks(true);
    sFonts.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 135px to 145px
    lSize = new GLabel(controlWindow, 10, 135, 30, 10, "Size");
    lSize.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 140px to 200px
    sSize = new GSlider(controlWindow, 10, 140, 300 - (2*10), 60, 12);
    sSize.setLimits(config.getTextSize(), 1, 3);
    sSize.setEasing(1);
    sSize.setShowValue(true);
    sSize.setShowTicks(true);
    sSize.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 195px to 205px
    lAlign = new GLabel(controlWindow, 10, 195, 60, 15, "Text Align");
    lAlign.setLocalColorScheme(GConstants.CYAN_SCHEME);

    // height: 210px to 260px
    sAlign = new GSlider(controlWindow, 10, 210, 300 - (2*10), 50, 12);
    sAlign.setLimits(config.getTextAlignNumber(), 1, 9);
    sAlign.setEasing(1);
    sAlign.setShowValue(true);
    sAlign.setShowTicks(true);
    sAlign.setLocalColorScheme(GConstants.CYAN_SCHEME);

    /*
     * TimerControls
     */

    // height: 270px to 295px
    lTimerControls = new GLabel(controlWindow, 10, 270, 300 - (2*10), 15, "Timer Setting");
    lTimerControls.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lTimerControls.setTextBold();

    // height: 300px to 320px
    txfTime = new GTextField(controlWindow, 10, 300, 300 - (2*10), 20);
    txfTime.setPromptText("22.09.1990 or 10000");

    // height: 330px to 350px
    bRestart = new GButton(controlWindow, 10, 330, 300 - (2*10), 20, "Restart Timer");
    bRestart.setLocalColorScheme(GConstants.CYAN_SCHEME);

    /*
     * VideoControls
     */

    // height: 360px to 375px
    lVideoControls = new GLabel(controlWindow, 10, 360, 300 - (2*10), 15, "Video Setting");
    lVideoControls.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lVideoControls.setTextBold();

    // height: 380px to 395px
    cbLoopVideo = new GCheckbox(controlWindow, 10, 380, 300 - (2*10), 15, "Loop Video");
    cbLoopVideo.setLocalColorScheme(GConstants.CYAN_SCHEME);
    cbLoopVideo.setSelected(true);

    controlWindow.setActionOnClose(G4P.CLOSE_WINDOW);

    controlWindow.addDrawHandler(applet, "drawController");
    controlWindow.addOnCloseHandler(applet, "closeController");
  }

  public void handleToggleControlEvents(GToggleControl checkbox, GEvent event) {
    if (checkbox == cbShowMillis) {
      if (event == GEvent.SELECTED) {
        config.setShowMillis(true);
      } else {
        config.setShowMillis(false);
      }
    } else if (checkbox == cbShowAnimation) {
      if (event == GEvent.SELECTED) {
        config.setShowAnimation(true);
      } else {
        config.setShowAnimation(false);
      }
    } else if (checkbox == cbLoopVideo) {
      if (event == GEvent.SELECTED) {
        config.setVideoLoop(true);
      } else {
        config.setVideoLoop(false);
      }
    }
  }

  public void handleSliderEvents(GValueControl slider, GEvent event) { 
    if (slider == sFonts) {
      config.setFontStyle(slider.getValueI());
    } else if (slider == sSize) {
      config.setTextSize(slider.getValueI());
    } else if (slider == sAlign) {
      config.setTextAlign(slider.getValueI());
    }
  }

  public void handleTextEvents(GEditableTextControl textcontrol, GEvent event) {
  }

  public void handleButtonEvents(GButton button, GEvent event) {
    if (button == bRestart) {
      String text = txfTime.getText();

      if (!text.isEmpty()) {
        Integer textInteger = CountdownTimer.parseInteger(text);
        if (textInteger != null) {
          applet.restartTimer(textInteger);
        } else {
          Date textDate = CountdownTimer.parseDate(text);
          if (textDate != null) {
            applet.restartTimer(textDate);
          } else {
            println("Text (" + text + ") couldn't be parsed. Timer couldn't restart");
          }
        }
      }
    }
  }
}