class ParticleNode {

  private int id;

  private float xPos, yPos;
  private float xSpeed, ySpeed;
  private float size;
  private float minDist;
  private int col;

  public ParticleNode(float x, float y, float xSpeed, float ySpeed, float size, float minDist, int id) {
    this.id = id;

    this.xPos = x;
    this.yPos = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;

    this.size = size;
    this.minDist = minDist;
    col = 0;

    generate();
  }

  public ParticleNode(float x, float y, float xSpeed, float ySpeed, float size, float minDist, int id, int col) {
    this.id = id;

    this.xPos = x;
    this.yPos = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;

    this.size = size;
    this.minDist = minDist;
    this.col = col;

    generate();
  }

  int getId() {
    return id;
  }

  float getXPos() {
    return xPos;
  }

  float getYPos() {
    return yPos;
  }

  public void generate() {
    fill(0, 0, 100);
    ellipseMode(CENTER);
    ellipse(xPos, yPos, size, size);
  }

  public void connections(ParticleNode[] others) {
    for (int i = 0; i < others.length; i++) {

      if (others[i].id != id) {
        float dx = others[i].getXPos() - xPos;
        float dy = others[i].getYPos() - yPos;

        float distance = sqrt(dx*dx+dy*dy);

        if (distance < minDist) {
          if (col == 0) {
            stroke(0, 0, map(distance, 0, minDist, 100, 0));
          } else {
            stroke(col, 80, map(distance, 0, minDist, 100, 0));
          }

          strokeWeight(map(distance, 0, minDist, 1, 0.5));
          line(xPos, yPos, others[i].getXPos(), others[i].getYPos());
        }
      }
    }
  } 

  public void move() {
    xPos = xPos + xSpeed;
    yPos = yPos + ySpeed;

    if (xPos >= width || xPos <= 0) {
      xSpeed = xSpeed * -1;
    }
    if (yPos >= height || yPos <= 0) {
      ySpeed = ySpeed * -1;
    }
  }
}