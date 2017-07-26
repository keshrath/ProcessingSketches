/**
 * ConnectingParticles is build as a SpoutSender to work with Resolume Arena 5.
 * 
 * ConnectingParticles commands:
 * 
 * - Press 'c' to change the colorMode (on/off)
 * - Press 'q' to increase the number of particles
 * - Press 'w' to decrease the number of particles
 *
 * @author Mathias Markl
 */
 
private static final String NAME = "SpoutSenderConnectingParticles";

private int num = 150;
private ParticleNode[] nodes;

private boolean colorMode = false;

private SpoutManager spout;

public void settings() {
  size(800, 450, P2D);
}

public void setup() {
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  generateWorld();
  
  spout = new SpoutManager();
  spout.initSender(NAME, width, height);
}

public void generateWorld() {
  nodes = new ParticleNode[num];

  for (int i=0; i<num; i++) {
    if (colorMode) {
      nodes[i] = new ParticleNode(random(0, width), random(0, height), random(-2, 2), random(-2, 2), 4, 100, i, int(random(0, 360)));
    } else {
      nodes[i] = new ParticleNode(random(0, width), random(0, height), random(-2, 2), random(-2, 2), 4, 100, i);
    }
  }

  println("Nodes: " + num);
}

public void draw() {
  background(0);

  for (int i=0; i<num; i++) {
    nodes[i].generate();
    nodes[i].connections(nodes);
    nodes[i].move();
  }
  
  spout.sendTexture();
}

public void keyPressed() {
  switch(key) {
  case 'q':
    num += 10;
    generateWorld();
    break;
  case 'w':
    if (num > 10) {
      num -= 10;
      generateWorld();
    }
    break;
  case 'c':
    if (colorMode) {
      colorMode = false;
    } else {
      colorMode = true;
    }    
    generateWorld();
    break;
  }
}

public void exit() {
  spout.closeSender();
  super.exit();
} 