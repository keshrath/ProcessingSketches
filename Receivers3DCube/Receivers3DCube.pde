import java.awt.*;

/**
 * SpoutReceiver to stream the arena output onto a 3D cube.
 * The SpoutReceiver3DCube can also act as a sender to stream
 * the 3D cube back to arena.
 *
 * Receiver names:
 * 
 * - Screen 1 - Resolume Arena
 * - Screen 2 - Resolume Arena
 * - Screen 3 - Resolume Arena
 * - Screen 4 - Resolume Arena
 * - Screen 5 - Resolume Arena
 * - Screen 6 - Resolume Arena
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

private static final String NAME = "SpoutReceivers3DCube";

private PImage img1;
private PImage img2;
private PImage img3;
private PImage img4;
private PImage img5;
private PImage img6;

private SpoutManager spoutSender;

private SpoutManager spoutReceiver1;
private SpoutManager spoutReceiver2;
private SpoutManager spoutReceiver3;
private SpoutManager spoutReceiver4;
private SpoutManager spoutReceiver5;
private SpoutManager spoutReceiver6;

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

  img1 = loadImage("start.bmp");
  img2 = loadImage("start.bmp");
  img3 = loadImage("start.bmp");
  img4 = loadImage("start.bmp");
  img5 = loadImage("start.bmp");
  img6 = loadImage("start.bmp");

  textureMode(NORMAL);

  spoutSender = new SpoutManager();
  spoutSender.initSender(NAME, width, height);

  spoutReceiver1 = new SpoutManager();
  spoutReceiver1.initReceiver("Screen 1 - Resolume Arena", img1);
  spoutReceiver2 = new SpoutManager();
  spoutReceiver2.initReceiver("Screen 2 - Resolume Arena", img2);
  spoutReceiver3 = new SpoutManager();
  spoutReceiver3.initReceiver("Screen 3 - Resolume Arena", img3);
  spoutReceiver4 = new SpoutManager();
  spoutReceiver4.initReceiver("Screen 4 - Resolume Arena", img4);
  spoutReceiver5 = new SpoutManager();
  spoutReceiver5.initReceiver("Screen 5 - Resolume Arena", img5);
  spoutReceiver6 = new SpoutManager();
  spoutReceiver6.initReceiver("Screen 6 - Resolume Arena", img6);



  cubXPos = width/2.0;
  cubYPos = height/2.0;
} 

public void draw() {
  background(0);

  img1 = spoutReceiver1.receiveTexture(img1);
  img2 = spoutReceiver2.receiveTexture(img2);
  img3 = spoutReceiver3.receiveTexture(img3);
  img4 = spoutReceiver4.receiveTexture(img4);
  img5 = spoutReceiver5.receiveTexture(img5);
  img6 = spoutReceiver6.receiveTexture(img6);

  noStroke();
  translate(cubXPos, cubYPos, -100);

  rotateX(frameCount * rotatespeedX);
  rotateY(frameCount * rotatespeedY);  
  rotateZ(frameCount * rotatespeedZ);  

  scale(120);
  TexturedCube();

  spoutSender.sendTexture();

  if (bounce) {
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

private void TexturedCube() {
  beginShape(QUADS);
  texture(img1);
  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(img2);
  // +Z "front" face
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(img3);
  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex( 1, 1, -1, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(img4);
  // +Y "bottom" face
  vertex(-1, 1, 1, 0, 0);
  vertex( 1, 1, 1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(img5);
  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(img6);
  // +X "right" face
  vertex( 1, -1, 1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex( 1, 1, 1, 0, 1);
  endShape();
}

public void keyPressed() {
  if (key == 'b') {
    if (bounce) {
      bounce = false;
    } else {
      bounce = true;
    }
  }
  if (key == 'e') {
    rotatespeedX += 0.005;
  }
  if (key == 'r') {
    rotatespeedX -= 0.005;
  }
  if (key == 'd') {
    rotatespeedY += 0.005;
  }
  if (key == 'f') {
    rotatespeedY -= 0.005;
  }
  if (key == 'c') {
    rotatespeedZ += 0.005;
  }
  if (key == 'v') {
    rotatespeedZ -= 0.005;
  }
}

public void exit() {
  spoutSender.closeSender();
  spoutReceiver1.closeReceiver();
  spoutReceiver2.closeReceiver();
  spoutReceiver3.closeReceiver();
  spoutReceiver4.closeReceiver();
  spoutReceiver5.closeReceiver();
  spoutReceiver6.closeReceiver();
  super.exit();
} 