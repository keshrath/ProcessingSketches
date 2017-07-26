class Config {
  private float mulFactor;

  private float aInc;
  private float bInc;

  private int drawer;
  private int lines;

  private float colRangeDown;
  private float colRangeUp;

  private float colS;
  private float colB;
  private float colT;

  public Config() {
    this.mulFactor = 100;

    this.aInc = 0.05;
    this.bInc = 0.17;

    this.drawer = 18;
    this.lines = 8;

    this.colRangeDown = 80;
    this.colRangeUp = 140;

    this.colS = 80;
    this.colB = 80;
    this.colT = 10;
  }

  public float getMulFactor() {
    return mulFactor;
  }

  public void setMulFactor(float mulFactor) {
    this.mulFactor = mulFactor;
  }

  public float getAInc() {
    return aInc;
  }

  public void setAInc(float aInc) {
    this.aInc = aInc;
  }

  public float getBInc() {
    return bInc;
  }

  public void setBInc(float bInc) {
    this.bInc = bInc;
  }

  public int getDrawer() {
    return drawer;
  }

  public void setDrawer(int drawer) {
    this.drawer = drawer;
  }

  public int getLines() {
    return lines;
  }

  public void setLines(int lines) {
    this.lines = lines;
  }

  public float getColRangeDown() {
    return colRangeDown;
  }

  public void setColRangeDown(float colRangeDown) {
    this.colRangeDown = colRangeDown;
  }

  public float getColRangeUp() {
    return colRangeUp;
  }

  public void setColRangeUp(float colRangeUp) {
    this.colRangeUp = colRangeUp;
  }

  public float getColS() {
    return colS;
  }

  public void setColS(float colS) {
    this.colS = colS;
  }

  public float getColB() {
    return colB;
  }

  public void setColB(float colB) {
    this.colB = colB;
  }

  public float getColT() {
    return colT;
  }

  public void setColT(float colT) {
    this.colT = colT;
  }
}