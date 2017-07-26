class Fractal {

  private Config config;

  private int maxIter;

  private double startX;
  private double startY;
  
  private double x;
  private double y;

  private double zoomFactor;

  public Fractal(Config config, int maxIter, double x, double y, double zoomFactor) {
    this.config = config;

    this.maxIter = maxIter;

    this.startX = x;
    this.startY = y;

    this.x = x;
    this.y = y;

    this.zoomFactor = zoomFactor;
  }

  public void setMaxIter(int maxIter) {
    this.maxIter = maxIter;
  }

  public void setX(double x) {
    this.x = startX + (x - (width / 2)) * (zoomFactor / width);
  }

  public void setY(double y) {
    this.y = startY + (y - (height / 2)) * (zoomFactor / height);
  }

  public void setZoomFactor(double zoomFactor) {
    this.zoomFactor = zoomFactor;
  }

  public void update(double x, double y, double zoomFactor) {
    this.x += (x - (width / 2)) * (zoomFactor / width);
    this.y += (y - (height / 2)) * (zoomFactor / height);

    this.zoomFactor = zoomFactor;
  }

  public void render() {
    loadPixels();

    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        double cR = x + (i - width / 2) * (zoomFactor / width);
        double cI = y + (j - height / 2) * (zoomFactor / height);

        int interCount = computeIteration(cR, cI);
        pixels[j * width + i] = getColor(interCount);
      }
    }

    updatePixels();
  }

  private int computeIteration(double cR, double cI) {
    double zR = 0;
    double zI = 0;

    int iterCount = 0;

    while (zR * zR + zI * zI <= 4 && iterCount < maxIter) {
      double currentZR = zR;

      zR = zR * zR - zI * zI + cR;
      zI = 2 * zI * currentZR + cI;

      iterCount++;
    }

    return iterCount;
  }

  private int getColor(int iterCount) {
    if (iterCount == maxIter) {
      return color(0, 0, 0);
    } else {
      return color(map(iterCount, 0, maxIter, config.getHueLowerBound(), config.getHueUpperBound()), 
        map(iterCount, 0, maxIter, config.getSaturationLowerBound(), config.getSaturationUpperBound()), 
        map(iterCount, 0, maxIter, config.getBrightnessLowerBound(), config.getBrightnessUpperBound()));
    }
  }
}