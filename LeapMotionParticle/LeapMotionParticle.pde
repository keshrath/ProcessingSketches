import java.util.Map;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ConcurrentHashMap;

import com.leapmotion.leap.Controller;
import com.leapmotion.leap.Finger;
import com.leapmotion.leap.Frame;
import com.leapmotion.leap.Hand;
import com.leapmotion.leap.Tool;
import com.leapmotion.leap.Vector;
import com.leapmotion.leap.processing.LeapMotion;

/**
 * LeapMotionParticle is a particle system which can be controlled
 * by the Leap Motion controller. The particle system was created by 
 * Henderson. It was adapted to work with the inputs of the Leap 
 * Motion controller.
 * 
 * Henderson: http://www.openprocessing.org/user/3583
 * 
 * The project also integrates the Spout library to work with
 * Resolume Arena 5.
 *
 * LeapMotionParticle commands:
 * 
 * - Press 'q' to increase the size of the particles.
 * - Press 'w' to decrease the size of the particles.
 * - Press 'a' to increase the gravity of the particles.
 * - Press 's' to decrease the gravity of the particles.
 * - Press 'y' to increase the mass of the particles.
 * - Press 'x' to decrease the mass of the particles.
 * - Press 'e' to increase the number of the particles.
 * - Press 'r' to decrease the number of the particles.
 * - Press 'c' to change the color mode. (on/off)
 *
 * @author Mathias Markl
 */

private static final String NAME = "SpoutSenderLeapMotionParticle";

// Settings
final static int DEFAULT_SIZE = 3;
final static float DEFAULT_GRAVITY = 10;
final static float DEFAULT_MASS = 10;

private int colorRangeDown = 80;
private int colorRangeUp = 150;
private boolean colorOn = false;

private int size;
private float gravity;
private float mass;

private LeapMotion leapMotion;

private ConcurrentMap<Integer, Integer> fingerColors;
private ConcurrentMap<Integer, Vector> fingerPositions;
private ConcurrentMap<Integer, Integer> handsColors;
private ConcurrentMap<Integer, Boolean> handsPositions;

private SpoutManager spout;

private float currentX;
private float currentY;
private boolean currentHand = true;

private int num = 1;
private Particle[] particle = new Particle[num];

public void settings() {
  size(800, 450, P2D);
}

public void setup() {

  colorMode(HSB, 360, 100, 100);

  smooth();
  noStroke();
  background(0, 0, 0);
  frameRate(25);
  
  noLoop();

  leapMotion = new LeapMotion(this);
  fingerColors = new ConcurrentHashMap<Integer, Integer>();
  fingerPositions = new ConcurrentHashMap<Integer, Vector>();
  handsColors = new ConcurrentHashMap<Integer, Integer>();
  handsPositions = new ConcurrentHashMap<Integer, Boolean>();

  size = DEFAULT_SIZE;
  gravity = DEFAULT_GRAVITY;
  mass = DEFAULT_MASS;

  for (int i=0; i < particle.length; i++) {
    particle[i] = new Particle(new PVector(random(0, width), random(0, height)), size, gravity, mass, colorOn, colorRangeDown, colorRangeUp);
  }

  currentX = width/2;
  currentY = height/2;

  spout = new SpoutManager();
  spout.initSender(NAME, width, height);
}

public void draw() {
  background(0, 0, 0);


  for (Map.Entry entry : fingerPositions.entrySet()) {
    Vector position = (Vector) entry.getValue();
    for (Map.Entry entryHand : handsPositions.entrySet()) {

      currentX = leapMotion.leapToSketchX(position.getX());
      currentY = leapMotion.leapToSketchY(position.getY() * 2);
      currentHand = (Boolean) entryHand.getValue();
    }
  }
  for (int i=0; i < particle.length; i++) {
    particle[i].run(currentX, currentY, currentHand);
  }

  spout.sendTexture();
}

public void onFrame(final Controller controller) {
  Frame frame = controller.frame();
  fingerPositions.clear();
  for (Finger finger : frame.fingers())
  {
    int fingerId = finger.id();
    color c = color(random(0, 255), random(0, 255), random(0, 255));
    fingerColors.putIfAbsent(fingerId, c);
    fingerPositions.put(fingerId, finger.tipPosition());
  }

  handsPositions.clear();
  for (Hand hand : frame.hands())
  {
    int handId = hand.id();
    color c = color(random(0, 255), random(0, 255), random(0, 255));
    handsColors.putIfAbsent(handId, c);
    handsPositions.put(handId, hand.isRight());
  }
}

private void update() {
  particle = new Particle[num];
  for (int i=0; i < particle.length; i++) {
    particle[i] = new Particle(new PVector(random(0, width), random(0, height)), size, gravity, mass, colorOn, colorRangeDown, colorRangeUp);
  }
}

public void keyPressed() {
  switch(key) {
  case 'q': 
    size++;
    break;
  case 'w':
    if (size > 1) { 
      size--;
    }
    break;
  case 'a': 
    gravity += 0.5;
    break;
  case 's':
    if (gravity > 1) { 
      gravity -= 0.5;
    }
    break;
  case 'y': 
    mass += 0.5;
    break;
  case 'x':
    if (mass > 1) { 
      mass -= 0.5;
    }
    break;
  case 'e': 
    num += 100;
    println(num);
    break;
  case 'r':
    if (num > 100) { 
      num -= 100;
      println(num);
    }
    break;
  case 'c': 
    if (colorOn) { 
      colorOn = false;
    } else {
      colorOn = true;
    }
    break;
  }

  update();
}

public void exit() {
  spout.closeSender();
  super.exit();
} 