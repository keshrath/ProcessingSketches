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
 * This class represents the configuration.
 *
 * @author Mathias Markl
 */
class Config {

  /**
   * Default settings.
   */
  private final boolean DEFAULT_COLLISION_DETECTION = true;
  private final boolean DEFAULT_BEAT_REACTIVE = true;
  private final int DEFAULT_SPHERE_COUNT = 5;
  private final float DEFAULT_SPHERE_RADIUS = 100;
  private final float DEFAULT_SPHERE_ROTATION_SPEED = 0.1f;

  /**
   * Config variables.
   */
  private boolean collisionDetection;
  private boolean beatReactive;
  private int sphereCount;
  private float sphereRadius;
  private float sphereRotationSpeed;

  public Config() {
    this.collisionDetection = DEFAULT_COLLISION_DETECTION;
    this.beatReactive = DEFAULT_BEAT_REACTIVE;
    this.sphereCount = DEFAULT_SPHERE_COUNT;
    this.sphereRadius = DEFAULT_SPHERE_RADIUS;
    this.sphereRotationSpeed = DEFAULT_SPHERE_ROTATION_SPEED;
  }

  public boolean isCollisionDetection() {
    return collisionDetection;
  }

  public void setCollisionDetection(boolean collisionDetection) {
    this.collisionDetection = collisionDetection;
  }

  public boolean isBeatReactive() {
    return beatReactive;
  }

  public void setBeatReactive(boolean beatReactive) {
    this.beatReactive = beatReactive;
  }

  public int getSphereCount() {
    return sphereCount;
  }

  public void setSphereCount(int sphereCount) {
    this.sphereCount = sphereCount;
  }

  public float getSphereRadius() {
    return sphereRadius;
  }

  public void setSphereRadius(float sphereRadius) {
    this.sphereRadius = sphereRadius;
  }

  public float getSphereRotationSpeed() {
    return sphereRotationSpeed;
  }

  public void setSphereRotationSpeed(float sphereRotationSpeed) {
    this.sphereRotationSpeed = sphereRotationSpeed;
  }

  public boolean isDEFAULT_COLLISION_DETECTION() {
    return DEFAULT_COLLISION_DETECTION;
  }

  public int getDEFAULT_SPHERE_COUNT() {
    return DEFAULT_SPHERE_COUNT;
  }

  public float getDEFAULT_SPHERE_RADIUS() {
    return DEFAULT_SPHERE_RADIUS;
  }

  public float getDEFAULT_SPHERE_ROTATION_SPEED() {
    return DEFAULT_SPHERE_ROTATION_SPEED;
  }
}