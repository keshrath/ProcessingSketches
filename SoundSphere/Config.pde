class Config {

  private boolean sound;
  private boolean beatInfo;

  private boolean sphere;
  private boolean rotate;
  private boolean zoom;

  private boolean onSphere;
  private boolean fixedStartPoint;
  private boolean randomCol;
  private boolean pointsFixedCol;
  private boolean lines;
  private boolean trianglesOnly;
  private boolean noTriangles;

  private int particles;

  private float xPos;
  private float yPos;
  private float zPos;

  private float rotateXSpeed;
  private float rotateYSpeed;

  private float radiusMin;
  private float radiusMax;

  private float minZoom;
  private float maxZoom;
  private float zoomSpeed;

  private float sphereColH;
  private float sphereColS;
  private float sphereColB;
  private float sphereColT;

  private float thetaSpeed;
  private float phiSpeed;

  private float particleColH;
  private float particleColS;
  private float particleColB;
  private float particleColT;

  private int sphereDetails;

  private float minDist;

  public Config() {
    this.sound = false;
    this.beatInfo = true;
    this.sphere = true;
    this.rotate = true;
    this.zoom = false;
    this.onSphere = true;
    this.fixedStartPoint = false;
    this.randomCol = false;
    this.pointsFixedCol = false;
    this.lines = false;
    this.trianglesOnly = false;
    this.noTriangles = false;

    this.particles = 100;

    this.xPos = width / 2;
    this.yPos = height / 2;
    this.zPos = 200;

    this.rotateXSpeed = 0.005;
    this.rotateYSpeed = 0.005;

    this.radiusMin = 75;
    this.radiusMax = 90;

    this.minZoom = 180;
    this.maxZoom = 350;
    this.zoomSpeed = 0.2;

    this.sphereColH = 0;
    this.sphereColS = 0;
    this.sphereColB = 100;
    this.sphereColT = 40;

    this.sphereDetails = 20;

    thetaSpeed = 0.01;
    phiSpeed = 0.01;

    this.particleColH = 0;
    this.particleColS = 0;
    this.particleColB = 80;
    this.particleColT = 90;

    this.minDist = 25;
  }

  public void setSound(boolean value) {
    sound = value;
  }

  public boolean useSound() {
    return sound;
  }

  public void setBeatInfo(boolean value) {
    beatInfo = value;
  }

  public boolean showBeatInfo() {
    return beatInfo;
  }

  public void setSphere(boolean value) {
    sphere = value;
  }

  public boolean showSphere() {
    return sphere;
  }

  public void setRotation(boolean value) {
    rotate = value;
  }

  public boolean doRotation() {
    return rotate;
  }

  public void setZoom(boolean value) {
    zoom = value;
  }

  public boolean doZoom() {
    return zoom;
  }

  public void setOnSphere(boolean value) {
    onSphere = value;
  }

  public boolean onSphere() {
    return onSphere;
  }
  
  public void setFixedStartPoint(boolean value) {
    fixedStartPoint = value;
  }
  
  public boolean isFixedStartPoint() {
    return fixedStartPoint;
  }

  public void setRandomCol(boolean value) {
    randomCol = value;
  }

  public boolean isRandomCol() {
    return randomCol;
  }

  public void setPointsFixedCol(boolean value) {
    pointsFixedCol = value;
  }

  public boolean havePointsFixedCol() {
    return pointsFixedCol;
  }

  public void setLines(boolean value) {
    lines = value;
  }

  public boolean showLines() {
    return lines;
  }

  public void setTrianglesOnly(boolean value) {
    trianglesOnly = value;
  }

  public boolean isTrianglesOnly() {
    return trianglesOnly;
  }

  public void setNoTriangles(boolean value) {
    noTriangles = value;
  }

  public boolean isNoTriangles() {
    return noTriangles;
  }

  public void setParticles(int num) {
    particles = num;
  }

  public int getParticles() {
    return particles;
  }

  public void setXPos(float pos) {
    xPos = pos;
  }

  public float getXPos() {
    return xPos;
  }

  public void setYPos(float pos) {
    yPos = pos;
  }

  public float getYPos() {
    return yPos;
  }

  public void setZPos(float pos) {
    zPos = pos;
  }

  public float getZPos() {
    return zPos;
  }

  public void setRotateXSpeed(float speed) {
    rotateXSpeed = speed;
  }

  public float getRotateXSpeed() {
    return rotateXSpeed;
  }

  public void setRotateYSpeed(float speed) {
    rotateYSpeed = speed;
  }

  public float getRotateYSpeed() {
    return rotateYSpeed;
  }

  public void setRadiusMin(float radius) {
    radiusMin = radius;
  }

  public float getRadiusMin() {
    return radiusMin;
  }

  public void setRadiusMax(float radius) {
    radiusMax = radius;
  }

  public float getRadiusMax() {
    return radiusMax;
  }

  public void setMinZoom(float zoom) {
    minZoom = zoom;
  }

  public float getMinZoom() {
    return minZoom;
  }

  public void setMaxZoom(float zoom) {
    maxZoom = zoom;
  }

  public float getMaxZoom() {
    return maxZoom;
  }

  public void setZoomSpeed(float speed) {
    zoomSpeed = speed;
  }

  public float getZoomSpeed() {
    return zoomSpeed;
  }

  public void setSphereColH(float col) {
    sphereColH = col;
  }

  public float getSphereColH() {
    return sphereColH;
  }

  public void setSphereColS(float col) {
    sphereColS = col;
  }

  public float getSphereColS() {
    return sphereColS;
  }

  public void setSphereColB(float col) {
    sphereColB = col;
  }

  public float getSphereColB() {
    return sphereColB;
  }

  public void setSphereColT(float col) {
    sphereColT = col;
  }

  public float getSphereColT() {
    return sphereColT;
  }

  public void setSphereDetails(int details) {
    this.sphereDetails = details;
  }

  public int getSphereDetails() {
    return sphereDetails;
  }

  public void setThetaSpeed(float speed) {
    thetaSpeed = speed;
  }

  public float getThetaSpeed() {
    return thetaSpeed;
  }

  public void setPhiSpeed(float speed) {
    phiSpeed = speed;
  }

  public float getPhiSpeed() {
    return phiSpeed;
  }

  public void setParticleColH(float col) {
    particleColH = col;
  }

  public float getParticleColH() {
    return particleColH;
  }

  public void setParticleColS(float col) {
    particleColS = col;
  }

  public float getParticleColS() {
    return particleColS;
  }

  public void setParticleColB(float col) {
    particleColB = col;
  }

  public float getParticleColB() {
    return particleColB;
  }

  public void setParticleColT(float col) {
    particleColT = col;
  }

  public float getParticleColT() {
    return particleColT;
  }

  public void setMinDist(float dist) {
    minDist = dist;
  }

  public float getMinDist() {
    return minDist;
  }
}