class BeatInfo {

  private float eRadius;
  private float kickRadius;
  private float snareRadius;
  private float hatRadius;
  
  private AudioInput in;

  public BeatInfo(AudioInput in) {
    this.in = in;
    
    eRadius = 20;
    kickRadius = 15;
    snareRadius = 15;
    hatRadius = 15;
  }

  public void render() {
    surface.setTitle("FPS: " + frameRate);
    
    strokeWeight(2);
    stroke(0, 0, 100);

    beginShape(QUAD);
    for (int i = 0; i < in.bufferSize() - 1; i++) {
      vertex((width - 100) + in.mix.get(i) * 70, i);
    }
    endShape();

    fill(0, 0, 80);
    textSize(28);
    text("Beat", 80, 30);

    if (beatListener.isOnset()) {
      eRadius = 80;
    }

    fill(map(eRadius, 80, 20, 0, 10), 100, 100);
    noStroke();
    ellipse(80, 80, eRadius, eRadius);

    eRadius *= 0.95;
    if (eRadius < 20) {
      eRadius = 20;
    }

    fill(0, 0, 80);
    textSize(28);
    text("Kick", 80, 150);

    if (beatListener.isKick()) {
      kickRadius = 60;
    }

    fill(map(kickRadius, 60, 20, 170, 180), 100, 100);
    noStroke();
    ellipse(80, 185, kickRadius, kickRadius);

    kickRadius *= 0.95;
    if (kickRadius < 15) {
      kickRadius = 15;
    }

    fill(0, 0, 80);
    textSize(28);
    text("Snare", 80, 250);

    if (beatListener.isSnare()) {
      snareRadius = 60;
    }

    fill(map(snareRadius, 60, 20, 220, 230), 100, 100);
    noStroke();
    ellipse(80, 285, snareRadius, snareRadius);

    snareRadius *= 0.95;
    if (snareRadius < 15) {
      snareRadius = 15;
    }

    fill(0, 0, 80);
    textSize(28);
    text("Hat", 80, 350);

    if (beatListener.isHat()) {
      hatRadius = 60;
    }

    fill(map(hatRadius, 60, 20, 115, 125), 100, 100);
    noStroke();
    ellipse(80, 385, hatRadius, hatRadius);

    hatRadius *= 0.95;
    if (hatRadius < 15) {
      hatRadius = 15;
    }
  }
}