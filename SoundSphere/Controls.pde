class Controls {

  private SpoutManager spout;

  private String[] controlName;
  private int[] controlType;
  private float[] controlValue;
  private String[] controlText;

  public Controls() {
    controlName = new String[35];
    controlType = new int[35];
    controlValue = new float[35];
    controlText = new String[35];
  }

  public void createControls(SpoutManager spout) {
    this.spout = spout;

    spout.CreateSpoutControl("Sound Reactive", "bool", 0);
    spout.CreateSpoutControl("Beat Info", "bool", 0);
    spout.CreateSpoutControl("Show Sphere", "bool", 1);
    spout.CreateSpoutControl("Rotation", "bool", 1);
    spout.CreateSpoutControl("Zoom", "bool", 0);
    spout.CreateSpoutControl("On-Sphere", "bool", 1);
    spout.CreateSpoutControl("Fixed Start", "bool", 0);
    spout.CreateSpoutControl("Random Color", "bool", 0);
    spout.CreateSpoutControl("Point Color", "bool", 0);
    spout.CreateSpoutControl("Show Lines", "bool", 0);
    spout.CreateSpoutControl("Triangle Only", "bool", 0);
    spout.CreateSpoutControl("No Triangles", "bool", 0);

    spout.CreateSpoutControl("Particles", "float", 0, 200, 100);
    spout.CreateSpoutControl("xPos", "float", 0, 800, 400);
    spout.CreateSpoutControl("yPos", "float", 0, 450, 225);
    spout.CreateSpoutControl("zPos", "float", 0, 500, 200);
    spout.CreateSpoutControl("RotateX Speed", "float", 0.001, 0.05, 0.005);
    spout.CreateSpoutControl("RotateY Speed", "float", 0.001, 0.05, 0.005);
    spout.CreateSpoutControl("radiusMin", "float", 30, 130, 75);
    spout.CreateSpoutControl("radiusMax", "float", 50, 150, 90);
    spout.CreateSpoutControl("minZoom", "float", 0, 500, 180);
    spout.CreateSpoutControl("maxZoom", "float", 0, 500, 350);
    spout.CreateSpoutControl("Zoom Speed", "float", 0, 2, 0.2);
    spout.CreateSpoutControl("Sphere ColH", "float", 0, 360, 0);
    spout.CreateSpoutControl("Sphere ColS", "float", 0, 100, 0);
    spout.CreateSpoutControl("Sphere ColB", "float", 0, 100, 100);
    spout.CreateSpoutControl("Sphere ColA", "float", 0, 100, 40);
    spout.CreateSpoutControl("Sphere Details", "float", 0, 100, 20);
    spout.CreateSpoutControl("Theta Speed", "float", 0.005, 0.03, 0.01);
    spout.CreateSpoutControl("Phi Speed", "float", 0.005, 0.03, 0.01);
    spout.CreateSpoutControl("Particle ColH", "float", 0, 360, 0);
    spout.CreateSpoutControl("Particle ColS", "float", 0, 100, 0);
    spout.CreateSpoutControl("Particle ColB", "float", 0, 100, 100);
    spout.CreateSpoutControl("Particle ColA", "float", 0, 100, 0);
    spout.CreateSpoutControl("Min Distance", "float", 0, 100, 25);
  }

  public boolean updateControls(Config config) {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    boolean restart = false;

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {
        
        if (controlName[i].equals("Sound Reactive")) {
          config.setSound((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Beat Info")) {
          config.setBeatInfo((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Show Sphere")) {
          config.setSphere((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Rotation")) {
          config.setRotation((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Zoom")) {
          config.setZoom((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("On-Sphere")) {
          config.setOnSphere((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Fixed Start")) {
          boolean newFixedStart = (boolean) (controlValue[i] == 1);
          if (config.isFixedStartPoint() != newFixedStart) {
            config.setFixedStartPoint(newFixedStart);
            restart = true;
          }
        }

        if (controlName[i].equals("Random Color")) {
          boolean randomCol = (boolean) (controlValue[i] == 1);
          if (config.isRandomCol() != randomCol) {
            config.setRandomCol(randomCol);
            restart = true;
          }
        }

        if (controlName[i].equals("Point Color")) {
          config.setPointsFixedCol((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Show Line")) {
          config.setLines((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Triangle Only")) {
          config.setTrianglesOnly((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("No Triangles")) {
          config.setNoTriangles((boolean) (controlValue[i] == 1));
        }

        if (controlName[i].equals("Particles")) {
          int newNumParticles = int(controlValue[i]);
          if (config.getParticles() != newNumParticles) {
            config.setParticles(newNumParticles);
            restart = true;
          }
        }

        if (controlName[i].equals("xPos")) {
          config.setXPos(controlValue[i]);
        }

        if (controlName[i].equals("yPos")) {
          config.setYPos( controlValue[i]);
        }

        if (controlName[i].equals("zPos")) {
          config.setZPos(controlValue[i]);
        }

        if (controlName[i].equals("RotateX Speed")) {
          config.setRotateXSpeed(controlValue[i]);
        }

        if (controlName[i].equals("RotateY Speed")) {
          config.setRotateYSpeed(controlValue[i]);
        }

        if (controlName[i].equals("radiusMin")) {
          float newRadiusMin = controlValue[i];
          if (config.getRadiusMin() != newRadiusMin) {
            config.setRadiusMin(newRadiusMin);
            restart = true;
          }
        }

        if (controlName[i].equals("radiusMax")) {          
          float newRadiusMax = controlValue[i];
          if (config.getRadiusMax() != newRadiusMax) {
            config.setRadiusMax(newRadiusMax);
            restart = true;
          }
        }

        if (controlName[i].equals("minZoom")) {
          config.setMinZoom( controlValue[i]);
        }

        if (controlName[i].equals("maxZoom")) {
          config.setMaxZoom(controlValue[i]);
        }

        if (controlName[i].equals("Zoom Speed")) {
          float newZoomSpeed = controlValue[i];
          if (config.getZoomSpeed() != newZoomSpeed) {
            config.setZoomSpeed(newZoomSpeed);
            restart = true;
          }
        }

        if (controlName[i].equals("Sphere ColH")) {
          float newColH = controlValue[i];
          if (config.getSphereColH() != newColH) {
            config.setSphereColH(newColH);
            restart = true;
          }
        }

        if (controlName[i].equals("Sphere ColS")) {         
          float newColS = controlValue[i];
          if (config.getSphereColS() != newColS) {
            config.setSphereColS(newColS);
            restart = true;
          }
        }

        if (controlName[i].equals("Sphere ColB")) {          
          float newColB = controlValue[i];
          if (config.getSphereColB() != newColB) {
            config.setSphereColB(newColB);
            restart = true;
          }
        }

        if (controlName[i].equals("Sphere ColA")) {
          float newColT = controlValue[i];
          if (config.getSphereColT() != newColT) {
            config.setSphereColT(newColT);
            restart = true;
          }
        }

        if (controlName[i].equals("Sphere Details")) {
          config.setSphereDetails(int(controlValue[i]));
        }

        if (controlName[i].equals("Theta Speed")) {          
          float newThetaSpeed = controlValue[i];
          if (config.getThetaSpeed() != newThetaSpeed) {
            config.setThetaSpeed(newThetaSpeed);
            restart = true;
          }
        }

        if (controlName[i].equals("Phi Speed")) {          
          float newPhiSpeed = controlValue[i];
          if (config.getPhiSpeed() != newPhiSpeed) {
            config.setPhiSpeed(newPhiSpeed);
            restart = true;
          }
        }

        if (controlName[i].equals("Particle ColH")) {
          float newColH = controlValue[i];
          if (config.getParticleColH() != newColH) {
            config.setParticleColH(newColH);
            restart = true;
          }
        }

        if (controlName[i].equals("Particle ColS")) {
          float newColS = controlValue[i];
          if (config.getParticleColS() != newColS) {
            config.setParticleColS(newColS);
            restart = true;
          }
        }

        if (controlName[i].equals("Particle ColB")) {
          float newColB = controlValue[i];
          if (config.getParticleColB() != newColB) {
            config.setParticleColB(newColB);
            restart = true;
          }
        }

        if (controlName[i].equals("Particle ColA")) {          
          float newColT = controlValue[i];
          if (config.getParticleColT() != newColT) {
            config.setParticleColT(newColT);
            restart = true;
          }
        }

        if (controlName[i].equals("Min Distance")) {
          config.setMinDist(controlValue[i]);
        }
      }
    }

    return restart;
  }
}