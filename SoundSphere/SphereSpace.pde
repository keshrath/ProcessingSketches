class SphereSpace {

  private BeatListener beatListener;
  private Config config;

  private float xPos;
  private float yPos;
  private float zPos;

  private float radius;
  private float radiusMax;
  private float radiusMin;
  private int growTimer;
  private int timer;

  private float rotateX;
  private float rotateY;

  private float maxZoom;
  private float minZoom;
  private float zoom;

  private float colH;
  private float colS;
  private float colB;
  private float colT;

  private float colHNoise;
  private float colSNoise;
  private float colBNoise;

  private ArrayList<SphereNode> items;
  private int currentId;
  private TriangleContainer container;
  
  private int details;

  public SphereSpace(BeatListener beatListener, Config config) {
    this(beatListener, config, width / 2, height / 2, 200, 90, 75, 10, 180, 350, 0.2, 0, 0, 80);
  }

  public SphereSpace(BeatListener beatListener, Config config, float xPos, float yPos, float zPos, float radiusMax, float radiusMin, 
      int growTimer, float minZoom, float maxZoom, float zoom, float startColH, float startColS, float startColB) {
    this.beatListener = beatListener;
    this.config = config;

    this.xPos = xPos;
    this.yPos = yPos;
    this.zPos = zPos;

    this.radius = radiusMin;
    this.radiusMax = radiusMax;
    this.radiusMin = radiusMin;
    this.growTimer = growTimer;
    this.timer = 0;

    this.items = new ArrayList<SphereNode>();
    this.currentId = 0;
    this.container = new TriangleContainer();

    this.rotateX = 0;
    this.rotateY = 0;

    this.minZoom = minZoom;
    this.maxZoom = maxZoom;
    this.zoom = zoom;

    this.colH = startColH;
    this.colS = startColS;
    this.colB = startColB;
    this.colT = 40;

    this.colHNoise = startColH;
    this.colSNoise = startColS;
    this.colBNoise = startColB;
    
    this.details = 20;
  }

  public float getRadius() {
    return radius;
  }

  public void init(int particles) {
    items = new ArrayList<SphereNode>();
    
    for (int i = 0; i < particles; i++) {
      sphere.addSphereNode();
    }
  }

  public void addSphereNode() {
    SphereNode sphereNode = null;
    
    float theta;
    float phi;
    
    if(config.isFixedStartPoint()) {
      theta = TWO_PI;
      phi = TWO_PI;
    } else {
      theta = random(TWO_PI);
      phi = random(TWO_PI);
    }
    
    if(config.isRandomCol()) {
      sphereNode = new SphereNode(beatListener, this, container, config, currentId, 25, 2, theta, 
        phi, random(-0.01, 0.01), random(config.getThetaSpeed() * -1, config.getThetaSpeed()),
        random(config.getPhiSpeed() * -1, config.getPhiSpeed()), 80, 90);
    } else {
      sphereNode = new SphereNode(beatListener, this, container, config, currentId, 25, 2, theta, 
        phi, random(config.getThetaSpeed() * -1, config.getThetaSpeed()),
        random(config.getPhiSpeed() * -1, config.getPhiSpeed()), colH, colS, colB);
    }
      
    items.add(sphereNode);
    sphereNode.init();

    currentId++;
  }
  
  public void changePosSetting(float xPos, float yPos, float zPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.zPos = zPos;
  }
  
  public void changeRadiusSetting(float radiusMin, float radiusMax) {
    this.radius = radiusMin;
    this.radiusMax = radiusMax;
    this.radiusMin = radiusMin;
  }
  
  public void changeZoomSetting(float minZoom, float maxZoom) {
    this.minZoom = minZoom;
    this.maxZoom = maxZoom;
  }
  
  public void changeZoomSpeedSetting(float zoomSpeed) {
    this.zoom = zoomSpeed;
  }
  
  public void changeColorSetting(float colH, float colS, float colB, float colT) {
    this.colH = colH;
    this.colS = colS;
    this.colB = colB;
    this.colT = colT;
    
    for (SphereNode node : items) {
      node.changeColorSetting(config.getParticleColH(), config.getParticleColS(), config.getParticleColB(), config.getParticleColT());
    }
  }
  
  public void changeDetailSettings(int details) {
    this.details = details;
  }

  public void update() {
    if(config.useSound()) {
      if (beatListener.isOnset()) {
        timer = growTimer;
      }
  
      if (timer > 0) {
        radius *= 1.05;
  
        if (radius > radiusMax) {
          radius = radiusMax;
        }
  
        timer--;
      } else {
        radius *= 0.95;
  
        if (radius < radiusMin) {
          radius = radiusMin;
        }
      }  

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

    if(config.doRotation()) {
      rotateX += config.getRotateXSpeed();
      rotateY += config.getRotateYSpeed();
    }
    
    if(config.doZoom()) {
      if (zPos > maxZoom || zPos < minZoom) {
        zoom *= -1;
        zPos += zoom;
      } else {
        zPos += zoom;
      }
      config.setZPos(zPos);
    }

    for (SphereNode node : items) {
      node.changeMinDistSetting(config.getMinDist());
  
      node.update();
      node.calculatePairs(items);
    }
  }

  public void render() {
    translate(xPos, yPos, zPos);

    rotateX(rotateX);
    rotateY(rotateY);

    container.clear();
    for (SphereNode node : items) {
      if(!config.isTrianglesOnly()) {
        node.render();
        node.renderPairs();
      }
      if(!config.isNoTriangles()) {
        node.renderTriangles();
      }
    }

    if(config.showSphere()) {
      noFill();
      stroke(colH, colS, colB, colT);
      strokeWeight(1);
      sphereDetail(details);
      sphere(radius);
    }
  }
}