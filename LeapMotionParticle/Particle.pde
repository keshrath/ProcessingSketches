/**
 * PVector is a class in Processing that makes it easier to store
 * values, and make calculations based on these values. It can make
 * applying forces to objects much easier and more efficient!
 */
class Particle {
  private PVector loc; //location vector
  private PVector vel; //velocity vector
  private PVector acc; //acceleration vector
  private int sz;  //size of particle
  private float gravity;  //gravity variable
  private float mass;  //mass variable
  private int velocityLimit = 5;  //the maximum velocity a particle can travel at
  private float d;  //distance variable between particle and the target co-ordinates

  Particle(PVector _loc, int _sz, float _gravity, float _mass, boolean colorOn, int colorRangeDown, int colorRangeUp) {
    loc = _loc.get();  //when calling loc, return current location of the selected particle
    vel = new PVector(0, 0);  //set vel and acc vectors to 0 as default
    acc = new PVector(0, 0);
    sz = _sz;
    gravity = _gravity;
    mass = _mass;
  }

  /* 
   method to render the particle. control how it looks here! 
   */
  public void display() {
    ellipseMode(CENTER);

    if (colorOn) {
      fill(map(noise(d), 0, 1, colorRangeDown, colorRangeUp), map(noise(d), 0, 1, 50, 80), map(noise(d), 0, 1, 50, 80));
    } else {
      fill(360, 0, 100);
    }

    ellipse(loc.x, loc.y, sz, sz);
  }

  /* 
   math for attraction and repulsion forces
   tx and ty are the co-ordinates attraction/repulsion will be applied to 
   */
  public  void forces(float tx, float ty, boolean dirReverse) {
    PVector targetLoc = new PVector(tx, ty);  //creating new vector for attractive/repulsive x and y values
    PVector dir = PVector.sub(loc, targetLoc);  //calculate the direction between a particle and targetLoc
    d = dir.mag();  //calculate how far away the particle is from targetLoc
    dir.normalize();  //convert the measurement to a unit vector

    println("direction:" + dir);

    //calculate the strength of the force by factoring in a gravitational constant and the mass of a particle
    //multiply by distance^2
    float force = (gravity*mass) / (d*d);

    //if the mouse is pressed, turn on repulsion by multiplying direction by 1
    if (!dirReverse) {
      dir.mult(1);
    }
    //else multiply the direction by -1 to switch the direction the particle travels in (attraction)
    else {
      dir.mult(-1);
    }

    //apply directional vector
    applyForce(dir);
  }

  /*
   method to apply a force vector to the particle 
   */
  public  void applyForce(PVector force) {
    force.div(mass);
    acc.add(force);
  }

  /*
   method to update the location of the particle, and keep its velocity within a set limit
   */
  public   void update() {
    vel.add(acc);
    vel.limit(velocityLimit);
    loc.add(vel);
    acc.mult(0);
  }

  /*
   method to bounce particles of canvas edges
   */
  public   void bounds() {
    if (loc.y > height || loc.y < 0) {
      vel.y *= -1;
    }
    if (loc.x > width || loc.x < 0) {
      vel.x *= -1;
    }
  }

  /*
   main method that combines all previous methods, and takes two arguments
   tx and ty are inherited from forces(), and set the attractive/repulsive co-ords
   */
  public void run(float tx, float ty, boolean dirReverse) {
    forces(tx, ty, dirReverse);
    display();
    bounds();
    update();
  }
}