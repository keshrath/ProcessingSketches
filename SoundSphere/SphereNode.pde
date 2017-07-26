class SphereNode {

  private BeatListener beatListener;
  private Config config;

  private SphereSpace parentSphere;
  private TriangleContainer container;

  private int id;

  private float radius;
  private float theta;
  private float phi;

  private float thetaSpeed;
  private float phiSpeed;

  private float r;
  private float rHistory;
  private float rSphereHistory;
  private float speed;
  
  private float x;
  private float y;
  private float z;

  private float minDist;
  private ArrayList<SphereNode> pairs;

  private float colH;
  private float colS;
  private float colB;
  private float colT;
  
  private float colHNoise;
  private float colSNoise;
  private float colBNoise;
  
  private float colHPoint;
  private float colSPoint;
  private float colBPoint;
  private float colTPoint;

  public SphereNode(BeatListener beatListener, SphereSpace parentSphere, TriangleContainer container, Config config, int id, float minDist,
      float radius, float theta, float phi, float thetaSpeed, float phiSpeed, float startColH, float startColS, float startColB) {
    this.beatListener = beatListener;
    this.parentSphere = parentSphere;
    this.container = container;
    this.config = config;
    this.id = id;

    this.radius = radius;

    this.theta = theta;
    this.phi = phi;

    this.thetaSpeed = thetaSpeed;
    this.phiSpeed = phiSpeed;

    this.minDist = minDist;
    this.pairs = new ArrayList<SphereNode>();

    this.colH = startColH;
    this.colS = startColS;
    this.colB = startColB;
    this.colT = 70;
    
    this.colHPoint = startColH;
    this.colSPoint = startColS;
    this.colBPoint = startColB;
    this.colTPoint = 70;
    
    this.colHNoise = startColH;
    this.colSNoise = startColS;
    this.colBNoise = startColB;
  }

  public int getId() {
    return id;
  }

  public PVector getPVector() {
    return new PVector(x, y, z);
  }

  public float getX() {
    return x;
  }

  public float getY() {
    return y;
  }

  public float getZ() {
    return z;
  }

  public ArrayList<SphereNode> getPairs() {
    return pairs;
  }

  public void init() {
    calculateCoordinates();
  }
  
  public void changeColorSetting(float colH, float colS, float colB, float colT) {
    this.colH = colH;
    this.colS = colS;
    this.colB = colB;
    this.colT = colT;
    
    this.colHPoint = colH;
    this.colSPoint = colS;
    this.colBPoint = colB;
    this.colTPoint = colT;
  }
  
  public void changeMinDistSetting(float minDist) {
    this.minDist = minDist;
  }

  public void update() {
    theta += thetaSpeed;
    phi += phiSpeed;

    calculateCoordinates();
    
    if(config.useSound()) {
      if (beatListener.isKick()) {
        colH = map(noise(colHNoise), 0, 1, 0, 360);
        colHNoise += 0.03;
      }
  
      if (beatListener.isSnare()) {
        colB = map(noise(colBNoise), 0, 1, 50, 90);
        colBNoise += 0.03;
      }
  
      if (beatListener.isKick()) {
        colS = map(noise(colSNoise), 0, 1, 60, 100);
        colSNoise += 0.03;
      }
    }
  }

  private void calculateCoordinates() {
    float rSphere = parentSphere.getRadius();
    float dif = rSphere - rSphereHistory;
    rSphereHistory = rSphere;
      
    if(!config.onSphere()) {
      if(speed == 0) {
        speed = random(-1, 1);
        rHistory = random(rSphere * 0.5, rSphere);
      }
      
      r = rHistory + speed + dif;
      
      if(r > rSphere || r < 0) {
        speed *= -1;
         r = rHistory + (2 * speed);
      }
    } else {
      speed = 0;
      r = rSphere;
    }

    x = cos(theta) * sin(phi) * r;
    y = sin(theta) * sin(phi) * r;
    z = cos(phi) * r;
  }

  public void render() {
    pushMatrix();

    translate(x, y, z);

    if(config.havePointsFixedCol()) {
      fill(colHPoint, colSPoint, colBPoint, colTPoint);
    } else {
      fill(colH, colS, colB, colT);
    }
    
    noStroke();
    ellipse(0, 0, radius, radius);

    popMatrix();
  }

  public void calculatePairs(ArrayList<SphereNode> items) {
    pairs = new ArrayList<SphereNode>();

    for (SphereNode node : items) {
      if (node.getId() != this.id) {
        if (this.getPVector().dist(node.getPVector()) < minDist) {
          pairs.add(node);
        }
      }
    }
  }

  public void renderPairs() {
    for (SphereNode node : pairs) {
      pushMatrix();
      
      noFill();
      strokeWeight(0.7);
      
      if(config.havePointsFixedCol() && config.showLines()) {
        stroke(colHPoint, colSPoint, colBPoint, colTPoint);
      } else if(!config.havePointsFixedCol() && config.showLines()) {
        stroke(colH, colS * 1.2, colB * 1.2, colT * 1.2);
      } else {
        stroke(colH, colS, colB, colT);
      }
      
      line(x, y, z, node.getX(), node.getY(), node.getZ());
      
      popMatrix();
    }
  }

  public void renderTriangles() {
    for (SphereNode node : pairs) {
      for (SphereNode pair : node.getPairs()) {
        if (pair.getPairs().contains(this) && !container.triangleExists(this, node, pair)) {
          container.addTriangle(this, node, pair);
          drawTriangle(node, pair);
        }
      }
    }
  }

  private void drawTriangle(SphereNode node, SphereNode pair) {
    pushMatrix();
    
    fill(colH, colS, colB, colT);
    noStroke();
    
    beginShape(TRIANGLE);
    vertex(x, y, z);
    vertex(node.getX(), node.getY(), node.getZ());
    vertex(pair.getX(), pair.getY(), pair.getZ());
    endShape();
    
    popMatrix();
  }

  @Override
  public boolean equals(Object other) {
    if (other != null) {
      if (other instanceof SphereNode) {
        return this.id == ((SphereNode) other).getId();
      }
    }

    return false;
  }

  @Override
  public String toString() {
    return id + ": [x: " + x + ", y: " + y + ", z: " + z + "]";
  }
}