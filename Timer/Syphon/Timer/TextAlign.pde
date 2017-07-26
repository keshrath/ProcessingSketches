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
 * This class represents a text layout.
 *
 * @author Mathias Markl
 */
class TextAlign {

  private int alignX;
  private int alignY;

  private int x;
  private int y;

  public TextAlign(int alignX, int alignY, int x, int y) {
    this.alignX = alignX;
    this.alignY = alignY;
    this.x = x;
    this.y = y;
  }

  public int getAlignX() {
    return alignX;
  }

  public int getAlignY() {
    return alignY;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }
}