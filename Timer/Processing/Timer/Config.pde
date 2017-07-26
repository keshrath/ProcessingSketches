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
 * This class represents the timer configuration.
 *
 * @author Mathias Markl
 */
class Config {

  /**
   * Font styles.
   */
  public final Font FONT_ALGERIAN = new Font("Algerian-250.vlw", 140f, 100f, 100f, 90f, 200f, 0.8f, 1f, 1.2f);
  public final Font FONT_BAUHAUS_93 = new Font("Bauhaus93-250.vlw", 140f, 100f, 100f, 90f, 200f, 0.8f, 1f, 1.2f);
  public final Font FONT_BRADLEY_HAND_ITC = new Font("BradleyHandITC-250.vlw", 140f, 100f, 100f, 90f, 200f, 0.8f, 1f, 1.2f);
  public final Font FONT_BUXTON_SKETCH = new Font("BuxtonSketch-250.vlw", 150f, 110f, 110f, 100f, 220f, 0.8f, 1f, 1.2f);
  public final Font FONT_CORBEL = new Font("Corbel-250.vlw", 150f, 110f, 110f, 100f, 220f, 0.8f, 1f, 1.2f);
  public final Font FONT_GARAMOND = new Font("Garamond-250.vlw", 150f, 110f, 110f, 100f, 220f, 0.8f, 1f, 1.2f);
  public final Font FONT_GIGI_REGULAR = new Font("Gigi-Regular-250.vlw", 140f, 110f, 110f, 100f, 220f, 0.8f, 1f, 1.2f);
  public final Font FONT_LETTER_GOTHIC_STD = new Font("LetterGothicStd-250.vlw", 110f, 90f, 90f, 80f, 180f, 0.8f, 1f, 1.2f);
  public final Font FONT_MYRIAD_WEB_PRO = new Font("MyriadWebPro-250.vlw", 120f, 100f, 100f, 90f, 180f, 0.8f, 1f, 1.2f);
  public final Font FONT_CUSTOM = new Font("CustomFont-250.vlw", 140f, 110f, 110f, 100f, 220f, 0.8f, 1f, 1.2f);

  /**
   * Text align modes.
   */
  public final TextAlign ALIGN_RIGHT_TOP = new TextAlign(RIGHT, TOP, width - 20, 20);
  public final TextAlign ALIGN_RIGHT_CENTER = new TextAlign(RIGHT, CENTER, width - 20, height/2);
  public final TextAlign ALIGN_RIGHT_BOTTOM = new TextAlign(RIGHT, BOTTOM, width - 20, height);
  public final TextAlign ALIGN_CENTER_TOP = new TextAlign(CENTER, TOP, width/2, 20);
  public final TextAlign ALIGN_CENTER_CENTER = new TextAlign(CENTER, CENTER, width/2, height/2);
  public final TextAlign ALIGN_CENTER_BOTTOM = new TextAlign(CENTER, BOTTOM, width/2, height - 20);
  public final TextAlign ALIGN_LEFT_TOP = new TextAlign(LEFT, TOP, 20, 20);
  public final TextAlign ALIGN_LEFT_CENTER = new TextAlign(LEFT, CENTER, 20, height/2);
  public final TextAlign ALIGN_LEFT_BOTTOM = new TextAlign(LEFT, BOTTOM, 20, height);

  /**
   * Default settings.
   */
  private final boolean DEFAULT_SHOW_MILIS = true;
  private final boolean DEFAULT_SHOW_ANIMATION = true;

  private final Font DEFAULT_FONT_STYLE = FONT_ALGERIAN;
  private final int DEFAULT_FONT_STYLE_NUMBER = 1;

  private final int DEFAULT_TEXT_SIZE = 2;

  private final TextAlign DEFAULT_TEXT_ALIGN = ALIGN_CENTER_CENTER;
  private final int DEFAULT_TEXT_ALIGN_NUMBER = 5;

  private final boolean DEFAULT_VIDEO_LOOP = true;

  /**
   * Config variables.
   */
  private Date startDate;

  private boolean showMillis;
  private boolean showAnimation;

  private Font fontStyle;
  private int fontStyleNumber;
  private int textSize;
  private TextAlign textAlign;
  private int textAlignNumber;

  private boolean videoLoop;

  private PFont currentFont;

  public Config() {
    int currentYear = Calendar.getInstance().get(Calendar.YEAR);

    GregorianCalendar calendar = new GregorianCalendar();

    calendar.set(Calendar.YEAR, currentYear + 1);
    calendar.set(Calendar.MONTH, 0);
    calendar.set(Calendar.DATE, 1);

    calendar.set(Calendar.HOUR_OF_DAY, 0);
    calendar.set(Calendar.MINUTE, 0);
    calendar.set(Calendar.SECOND, 0);
    calendar.set(Calendar.MILLISECOND, 0);

    startDate = calendar.getTime();

    showMillis = DEFAULT_SHOW_MILIS;
    showAnimation = DEFAULT_SHOW_ANIMATION;

    fontStyle = DEFAULT_FONT_STYLE;
    fontStyleNumber = DEFAULT_FONT_STYLE_NUMBER;
    textSize = DEFAULT_TEXT_SIZE;
    textAlign = DEFAULT_TEXT_ALIGN;
    textAlignNumber = DEFAULT_TEXT_ALIGN_NUMBER;

    videoLoop = DEFAULT_VIDEO_LOOP;

    currentFont = loadFont(fontStyle.getFontName());
  }

  public Date getStartDate() {
    return startDate;
  }

  public void setStartDate(Date startDate) {
    this.startDate = startDate;
  }

  public boolean isShowMillis() {
    return showMillis;
  }

  public void setShowMillis(boolean showMillis) {
    this.showMillis = showMillis;
  }

  public boolean isShowAnimation() {
    return showAnimation;
  }

  public void setShowAnimation(boolean showAnimation) {
    this.showAnimation = showAnimation;
  }

  public Font getFontStyle() {
    return fontStyle;
  }

  public void setFontStyle(int fontStyle) {
    this.fontStyleNumber = fontStyle;

    switch(fontStyle) {
    case 1:
      setFontStyle(FONT_ALGERIAN);
      break;
    case 2:
      setFontStyle(FONT_BAUHAUS_93);
      break;
    case 3:
      setFontStyle(FONT_BRADLEY_HAND_ITC);
      break;
    case 4:
      setFontStyle(FONT_BUXTON_SKETCH);
      break;
    case 5:
      setFontStyle(FONT_CORBEL);
      break;
    case 6:
      setFontStyle(FONT_GARAMOND);
      break;
    case 7:
      setFontStyle(FONT_GIGI_REGULAR);
      break;
    case 8:
      setFontStyle(FONT_LETTER_GOTHIC_STD);
      break;
    case 9:
      setFontStyle(FONT_MYRIAD_WEB_PRO);
      break;
    default:
      setFontStyle(FONT_CUSTOM);
      this.fontStyleNumber = 10;
    }
  }

  public int getFontStyleNumber() {
    return fontStyleNumber;
  }

  private void setFontStyle(Font fontStyle) {
    this.fontStyle = fontStyle;
    this.currentFont = loadFont(fontStyle.getFontName());
  }

  public PFont getFont() {
    return currentFont;
  }

  public int getTextSize() {
    return textSize;
  }

  public void setTextSize(int textSize) {
    this.textSize = textSize;
  }

  public TextAlign getTextAlign() {
    return textAlign;
  }

  public void setTextAlign(int textAlign) {
    this.textAlignNumber = textAlign;

    switch(textAlign) {
    case 1:
      setTextAlign(ALIGN_RIGHT_TOP);
      break;
    case 2:
      setTextAlign(ALIGN_RIGHT_CENTER);
      break;
    case 3:
      setTextAlign(ALIGN_RIGHT_BOTTOM);
      break;
    case 4:
      setTextAlign(ALIGN_CENTER_TOP);
      break;
    case 5:
      setTextAlign(ALIGN_CENTER_CENTER);
      break;
    case 6:
      setTextAlign(ALIGN_CENTER_BOTTOM);
      break;
    case 7:
      setTextAlign(ALIGN_LEFT_TOP);
      break;
    case 8:
      setTextAlign(ALIGN_LEFT_CENTER);
      break;
    default:
      setTextAlign(ALIGN_LEFT_BOTTOM);
      this.textAlignNumber = 9;
    }
  }
  
  public int getTextAlignNumber() {
    return textAlignNumber;
  }

  public void setTextAlign(TextAlign textAlign) {
    this.textAlign = textAlign;
  }

  public boolean isVideoLoop() {
    return videoLoop;
  }

  public void setVideoLoop(boolean videoLoop) {
    this.videoLoop = videoLoop;
  }
}