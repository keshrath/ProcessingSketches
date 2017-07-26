import java.awt.*;

/**
 * SpoutReceiver to stream the arena output onto a 3D cube.
 * The SpoutReceiver3DCube can also act as a sender to stream
 * the 3D cube back to arena.
 * 
 * 3DCube commands:
 * 
 * - Press 'b' to change the bounce mode. (on/off)
 * - Press 'e' to increase the rotation speed for the x axis.
 * - Press 'r' to decrease the rotation speed for the x axis.
 * - Press 'd' to increase the rotation speed for the y axis.
 * - Press 'f' to decrease the rotation speed for the y axis.
 * - Press 'c' to increase the rotation speed for the z axis.
 * - Press 'v' to decrease the rotation speed for the z axis.
 *
 * @author Mathias Markl
 */

private static final String NAME = "SpoutReceiver3DCube";

private PImage img;
private SpoutManager spout;

// Rotation
private float rotatespeedX = 0.01;
private float rotatespeedY = 0.01;  
private float rotatespeedZ = 0.00;  

// Bounce
private boolean bounce = false;
private float cubXPos;
private float cubYPos;
private float xspeed = 1.2;
private float yspeed = 1.5;
private int xdirection = 1;
private int ydirection = 1;

public void setup() {
  size(640, 360, P3D);
  background(0);
  
  // Dummy image to start the cube animation
  img = loadImage("start.bmp");
  textureMode(NORMAL);
  
  spout = new SpoutManager();
  
  spout.initReceiver("", img);
  spout.initSender(NAME, width, height);
  
  cubXPos = width/2.0;
  cubYPos = height/2.0;
} 

public void draw() {
  clear(); 
  img = spout.receiveTexture(img);
  
  noStroke();
  translate(cubXPos, cubYPos, -100);
  
  rotateX(frameCount * rotatespeedX);
  rotateY(frameCount * rotatespeedY);  
  rotateZ(frameCount * rotatespeedZ);  
   
  scale(120);
  TexturedCube(img);
  
  spout.sendTexture();
  
  if(bounce) {
    cubXPos = cubXPos + ( xspeed * xdirection );
    cubYPos = cubYPos + ( yspeed * ydirection );
    
    if (cubXPos > width - 100 || cubXPos < 100) {
      xdirection  *= -1;
    }
    if (cubYPos > height - 100 || cubYPos < 100) {
      ydirection  *= -1;
    }
  }
}

private void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(img);
  
  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  
  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);
  
  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  
  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
  
  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);
  
  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  
  endShape();
}

public void mousePressed() {
  if (mouseButton == RIGHT) {
    JSpout.SenderDialog();
  }
}

public void keyPressed() {
  if(key == 'b') {
    if(bounce) {
      bounce = false; 
    } else {
      bounce = true; 
    }
  }
  if(key == 'e') {
    rotatespeedX += 0.005;
  }
  if(key == 'r') {
    rotatespeedX -= 0.005;
  }
  if(key == 'd') {
    rotatespeedY += 0.005;
  }
  if(key == 'f') {
    rotatespeedY -= 0.005;
  }
  if(key == 'c') {
    rotatespeedZ += 0.005;
  }
  if(key == 'v') {
    rotatespeedZ -= 0.005;
  }
}

public void exit() {
  spout.closeSender();
  spout.closeReceiver();
  super.exit();
} 