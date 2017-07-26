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
 * This class represents a font style.
 *
 * @author Mathias Markl
 */
class Font {

  private String fontName;

  private float sizeDefault;
  private float sizeDays;
  private float sizeMillis;
  private float sizeDaysMillis;
  private float sizeAnimation;

  private float smallFactor;
  private float mediumFactor;
  private float largeFactor;

  public Font(String fontName, float sizeDefault, float sizeDays, float sizeMillis, float sizeDaysMillis, 
    float sizeAnimation, float smallFactor, float mediumFactor, float largeFactor) {
    this.fontName = fontName;
    this.sizeDefault = sizeDefault;
    this.sizeDays = sizeDays;
    this.sizeMillis = sizeMillis;
    this.sizeDaysMillis = sizeDaysMillis;
    this.sizeAnimation = sizeAnimation;
    this.smallFactor = smallFactor;
    this.mediumFactor = mediumFactor;
    this.largeFactor = largeFactor;
  }
  
  public float getSizeFactor(int mode) {
    if (mode == 1) {
      return smallFactor;
    } else if (mode == 2) {
      return mediumFactor;
    } else {
      return largeFactor;
    }
  }

  public String getFontName() {
    return fontName;
  }

  public float getSizeDefault() {
    return sizeDefault;
  }

  public float getSizeDays() {
    return sizeDays;
  }

  public float getSizeMillis() {
    return sizeMillis;
  }

  public float getSizeDaysMillis() {
    return sizeDaysMillis;
  }

  public float getSizeAnimation() {
    return sizeAnimation;
  }

  public float getSmallFactor() {
    return smallFactor;
  }

  public float getMediumFactor() {
    return mediumFactor;
  }

  public float getLargeFactor() {
    return largeFactor;
  }
}