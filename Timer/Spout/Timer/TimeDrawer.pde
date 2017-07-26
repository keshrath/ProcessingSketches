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
 * This class handles the drawing of the countdown.
 *
 * @author Mathias Markl
 */
class TimeDrawer {

  private Config config;

  public TimeDrawer(Config config) {
    this.config = config;
  }

  public void render() {
    long timer = countdown.get();

    long days = TimeUnit.MILLISECONDS.toDays(timer);
    long hours = TimeUnit.MILLISECONDS.toHours(timer) - TimeUnit.DAYS.toHours(TimeUnit.MILLISECONDS.toDays(timer));
    long minutes = TimeUnit.MILLISECONDS.toMinutes(timer) - TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(timer));
    long seconds =  TimeUnit.MILLISECONDS.toSeconds(timer) - TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(timer));
    long milliseconds = timer - TimeUnit.SECONDS.toMillis(TimeUnit.MILLISECONDS.toSeconds(timer));

    float sizeFactor = config.getFontStyle().getSizeFactor(config.getTextSize());

    if (config.isShowMillis() && days > 0) {
      textFont(config.getFont(), config.getFontStyle().getSizeDaysMillis() * sizeFactor);
    } else if (config.isShowMillis() && days == 0) {
      textFont(config.getFont(), config.getFontStyle().getSizeMillis() * sizeFactor);
    } else if (!config.isShowMillis() && days > 0) {
      textFont(config.getFont(), config.getFontStyle().getSizeDays() * sizeFactor);
    } else {
      textFont(config.getFont(), config.getFontStyle().getSizeDefault() * sizeFactor);
    }

    textAlign(config.getTextAlign().getAlignX(), config.getTextAlign().getAlignY());

    if (config.isShowAnimation() && timer <= (30 * 1000)) {
      if (timer <= (10 * 1000)) {
        textSize((10 - seconds) * 15 + config.getFontStyle().getSizeAnimation() * sizeFactor);
        text(seconds + "", config.getTextAlign().getX(), config.getTextAlign().getY());
      } else {
        textSize(config.getFontStyle().getSizeAnimation() * sizeFactor);
        text(seconds + "", config.getTextAlign().getX(), config.getTextAlign().getY());
      }
    } else {
      String timerText = "";

      if (days >= 1) {
        timerText += days + " Days - ";
      }  

      if (hours < 10) {
        timerText += "0";
      }
      timerText += hours + ":";

      if (minutes < 10) {
        timerText += "0";
      }
      timerText += minutes + ":";

      if (seconds < 10) {
        timerText += "0";
      }
      timerText += seconds;

      if (config.isShowMillis()) {
        timerText += ":";
        if (milliseconds < 100) {
          timerText += "0";
        }
        if (milliseconds < 10) {
          timerText += "0";
        }
        timerText += milliseconds;
      }

      text(timerText, config.getTextAlign().getX(), config.getTextAlign().getY());
    }
  }
}