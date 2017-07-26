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
 * This class represents the sphere. 
 *
 * It's inspired by the TexturedSphere example written by Gillian Ramsay and
 * based on a post from the Processing forum posted by yellowcap. The collision
 * detection is based on Ira Greenberg's Circle Collision with Swapping 
 * Velocities example.
 *
 * @author Mathias Markl
 */
class Sphere {

  private Config config;

  private float radius;

  private int detailsX;
  private int detailsY;

  private float[] xGrid;
  private float[] yGrid;

  private float[][][] allPoints;

  private PImage texture;

  private PVector position;
  private PVector velocity;

  private float rotationX;
  private float rotationZ;

  public Sphere(Config config, float radius, int detailsX, int detailsY, PVector position) {
    this.config = config;
    this.radius = radius;
    this.detailsX = detailsX;
    this.detailsY = detailsY;

    xGrid = new float[detailsX + 1];
    yGrid = new float[detailsY + 1];

    allPoints = new float[detailsX + 1][detailsY + 1][3];

    this.position = position;

    velocity = PVector.random2D();
    velocity.mult(3);

    rotationX = random(100);
    rotationZ = random(100);
  }

  public PVector getPosition() {
    return position;
  }

  public PVector getVelocity() {
    return velocity;
  }

  public float getRadius() {
    return radius;
  }

  public void init() {
    for (int i = 0; i <= detailsX; i++) {
      xGrid[i] = i / (float) detailsX;
    } 

    for (int j = 0; j <= detailsY; j++) {
      yGrid[j] = j / (float) detailsY;
    }

    for (int i = 0; i <= detailsX; i++) {
      for (int j = 0; j <= detailsY; j++) {
        allPoints[i][j] = mercatorPoint(radius, xGrid[i], yGrid[j]);
      }
    }
  }

  private float[] mercatorPoint(float R, float x, float y) {
    float[] thisPoint = new float[3];
    float phi = x * TWO_PI;
    float theta = PI - y * PI;

    thisPoint[0] = R*sin(theta)*cos(phi);
    thisPoint[1] = R*sin(theta)*sin(phi);
    thisPoint[2] = R*cos(theta);

    return thisPoint;
  }

  public void update(PImage texture) {
    this.texture = texture;

    position.add(velocity);

    if (position.x > width - radius * radiusXFactor) {
      position.x = width - radius * radiusXFactor;
      velocity.x *= -1;
    } else if (position.x < radius * radiusXFactor) {
      position.x = radius * radiusXFactor;
      velocity.x *= -1;
    }

    if (position.y > height - radius * radiusYFactor) {
      position.y = height - radius * radiusYFactor;
      velocity.y *= -1;
    } else if (position.y < radius * radiusYFactor) {
      position.y = radius * radiusYFactor;
      velocity.y *= -1;
    }
  }

  public void collisionDetection(Sphere other) {
    PVector bVect = PVector.sub(other.getPosition(), position);
    float bVectMag = bVect.mag();

    if (bVectMag < (radius + other.getRadius())) {
      float theta  = bVect.heading();
      float sine = sin(theta);
      float cosine = cos(theta);

      PVector[] bTemp = { new PVector(), new PVector() };
      bTemp[1].x  = cosine * bVect.x + sine * bVect.y;
      bTemp[1].y  = cosine * bVect.y - sine * bVect.x;

      PVector[] vTemp = { new PVector(), new PVector() };

      vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;

      PVector[] vFinal = { new PVector(), new PVector() };

      float m = radius * 0.1;
      float mOther = other.getRadius() * 0.1;

      vFinal[0].x = ((m - mOther) * vTemp[0].x + 2 * mOther * vTemp[1].x) / (m + mOther);
      vFinal[0].y = vTemp[0].y;

      vFinal[1].x = ((mOther - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + mOther);
      vFinal[1].y = vTemp[1].y;


      bTemp[0].x += vFinal[0].x;
      bTemp[1].x += vFinal[1].x;

      PVector[] bFinal = { new PVector(), new PVector() };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      other.getPosition().x = position.x + bFinal[1].x;
      other.getPosition().y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.getVelocity().x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.getVelocity().y = cosine * vFinal[1].y + sine * vFinal[1].x;
    } 
    
    // Error Detection
    if (bVectMag < radius * 0.7) {
      println(bVectMag);
      position.x = other.getPosition().x + other.getRadius() + 50;
    }
  }

  public void updateSpeed(boolean beat) {
    int xSpeed;
    int ySpeed;

    if (velocity.x < 0) {
      xSpeed = -1;
    } else {
      xSpeed = 1;
    }

    if (velocity.y < 0) {
      ySpeed = -1;
    } else {
      ySpeed = 1;
    }

    if (beat) {
      if (config.isCollisionDetection()) {
        velocity.x = random(15, 20) * xSpeed;
        velocity.y = random(15, 20) * ySpeed;
      } else {
        velocity.x = random(25, 30) * xSpeed;
        velocity.y = random(25, 30) * ySpeed;
      }
    } else {
      if (config.isCollisionDetection()) {
        if (velocity.x > 5) {
          velocity.x *= 0.99;
        }

        if (velocity.y > 5) {
          velocity.y *= 0.99;
        }
      } else {
        if (velocity.x > 5) {
          velocity.x *= 0.95;
        }

        if (velocity.y > 5) {
          velocity.y *= 0.95;
        }
      }
    }
  }

  public void render() {
    pushMatrix();

    noStroke();
    noFill();

    translate(position.x, position.y, 0);

    rotateX(radians(-95));  
    rotateZ(radians(95));

    rotationX += config.getSphereRotationSpeed();
    rotationZ += config.getSphereRotationSpeed();

    rotateX(rotationX);  
    rotateZ(rotationZ);

    for (int j = 0; j < detailsY; j++) {
      beginShape(TRIANGLE_STRIP);

      if (texture != null) {
        texture(texture);
      } else {
        fill(255, 0, 0);
      }

      for (int i = 0; i <= detailsX; i++) {
        vertex(allPoints[i][j+1][0], allPoints[i][j+1][1], allPoints[i][j+1][2], xGrid[i], yGrid[j+1]);
        vertex(allPoints[i][j][0], allPoints[i][j][1], allPoints[i][j][2], xGrid[i], yGrid[j]);
      }

      endShape(CLOSE);
    }

    popMatrix();
  }
}