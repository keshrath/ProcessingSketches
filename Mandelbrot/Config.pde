class Config {

  private float xPos;
  private float yPos;

  private double zoomFactor;
  private int maxIter;

  private float hueLowerBound;
  private float hueUpperBound;
  private float saturationLowerBound;
  private float saturationUpperBound;
  private float brightnessLowerBound;
  private float brightnessUpperBound;

  private boolean zoom;
  private int zoomIter;
  private double zoomSpeed;

  private boolean hint;

  public Config() {
    this.xPos = 219.72;
    this.yPos = 400;

    this.zoomFactor = 4;
    this.maxIter = 200;

    this.hueLowerBound = 201;
    this.hueUpperBound = 210;
    this.saturationLowerBound = 80;
    this.saturationUpperBound = 100;
    this.brightnessLowerBound = 0;
    this.brightnessUpperBound = 95;

    this.zoom = false;
    this.zoomIter = 60;
    this.zoomSpeed = 10;

    this.hint = false;
  }

  public float getXPos() {
    return xPos;
  }
  public void setXPos(float xPos) {
    this.xPos = xPos;
  }
  public float getYPos() {
    return yPos;
  }
  public void setYPos(float yPos) {
    this.yPos = yPos;
  }
  public double getZoomFactor() {
    return zoomFactor;
  }
  public void setZoomFactor(double zoomFactor) {
    this.zoomFactor = zoomFactor;
  }
  public int getMaxIter() {
    return maxIter;
  }
  public void setMaxIter(int maxIter) {
    this.maxIter = maxIter;
  }
  public float getHueLowerBound() {
    return hueLowerBound;
  }
  public void setHueLowerBound(float hueLowerBound) {
    this.hueLowerBound = hueLowerBound;
  }
  public float getHueUpperBound() {
    return hueUpperBound;
  }
  public void setHueUpperBound(float hueUpperBound) {
    this.hueUpperBound = hueUpperBound;
  }
  public float getSaturationLowerBound() {
    return saturationLowerBound;
  }
  public void setSaturationLowerBound(float saturationLowerBound) {
    this.saturationLowerBound = saturationLowerBound;
  }
  public float getSaturationUpperBound() {
    return saturationUpperBound;
  }
  public void setSaturationUpperBound(float saturationUpperBound) {
    this.saturationUpperBound = saturationUpperBound;
  }
  public float getBrightnessLowerBound() {
    return brightnessLowerBound;
  }
  public void setBrightnessLowerBound(float brightnessLowerBound) {
    this.brightnessLowerBound = brightnessLowerBound;
  }
  public float getBrightnessUpperBound() {
    return brightnessUpperBound;
  }
  public void setBrightnessUpperBound(float brightnessUpperBound) {
    this.brightnessUpperBound = brightnessUpperBound;
  }

  public boolean isZoom() {
    return zoom;
  }
  public void setZoom(boolean zoom) {
    this.zoom = zoom;
  }
  public int getZoomIter() {
    return zoomIter;
  }
  public void setZoomIter(int zoomIter) {
    this.zoomIter = zoomIter;
  }
  public double getZoomSpeed() {
    return zoomSpeed;
  }
  public void setZoomSpeed(double zoomSpeed) {
    this.zoomSpeed = zoomSpeed;
  }

  public boolean showHint() {
    return hint;
  }

  public void setHint(boolean hint) {
    this.hint = hint;
  }
} 