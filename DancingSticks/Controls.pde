class Controls {

  private SpoutManager spout;

  private String[] controlName;
  private int[] controlType;
  private float[] controlValue;
  private String[] controlText;

  public Controls() {
    controlName = new String[20];
    controlType = new int[20];
    controlValue = new float[20];
    controlText = new String[20];
  }

  public void createControls(SpoutManager spout) {
    this.spout = spout;

    spout.CreateSpoutControl("A-Increment", "float", 0.01, 0.09, 0.05);
    spout.CreateSpoutControl("B-Increment", "float", 0.1, 0.2, 0.17);
    spout.CreateSpoutControl("Multiplier", "float", 10, 200, 100);
    spout.CreateSpoutControl("Drawer", "float", 1, 20, 18);
    spout.CreateSpoutControl("Lines", "float", 2, 25, 8);
    spout.CreateSpoutControl("Hue-Range-Low", "float", 0, 360, 80);
    spout.CreateSpoutControl("Hue-Range-High", "float", 0, 360, 140);
    spout.CreateSpoutControl("Saturation", "float", 0, 100, 80);
    spout.CreateSpoutControl("Brightness", "float", 0, 100, 80);
    spout.CreateSpoutControl("Alpha", "float", 0, 255, 10);
  }

  public boolean updateControls(Config config) {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    boolean restart = false;

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {
        
        if (controlName[i].equals("A-Increment")) {          
          float newAInc = controlValue[i];
          if (config.getAInc() != newAInc) {
            config.setAInc(newAInc);
            restart = true;
          }
        }

        if (controlName[i].equals("B-Increment")) {          
          float newBInc = controlValue[i];
          if (config.getBInc() != newBInc) {
            config.setBInc(newBInc);
            restart = true;
          }
        }

        if (controlName[i].equals("Multiplier")) {          
          float newMul = controlValue[i];
          if (config.getMulFactor() != newMul) {
            config.setMulFactor(newMul);
            restart = true;
          }
        }

        if (controlName[i].equals("Drawer")) {          
          int newDrawer = int(controlValue[i]);
          if (config.getDrawer() != newDrawer) {
            config.setDrawer(newDrawer);
            restart = true;
          }
        }

        if (controlName[i].equals("Lines")) {          
          int newLines = int(controlValue[i]);
          if (config.getLines() != newLines) {
            config.setLines(newLines);
            restart = true;
          }
        }

        if (controlName[i].equals("Hue-Range-Low")) {          
          float newHueLow = controlValue[i];
          if (config.getColRangeDown() != newHueLow) {
            config.setColRangeDown(newHueLow);
            restart = true;
          }
        }

        if (controlName[i].equals("Hue-Range-High")) {          
          float newHueHigh = controlValue[i];
          if (config.getColRangeUp() != newHueHigh) {
            config.setColRangeUp(newHueHigh);
            restart = true;
          }
        }

        if (controlName[i].equals("Saturation")) {          
          float newSaturation = controlValue[i];
          if (config.getColS() != newSaturation) {
            config.setColS(newSaturation);
            restart = true;
          }
        }

        if (controlName[i].equals("Brightness")) {          
          float newBrightness = controlValue[i];
          if (config.getColB() != newBrightness) {
            config.setColB(newBrightness);
            restart = true;
          }
        }

        if (controlName[i].equals("Alpha")) {          
          float newAlpha = controlValue[i];
          if (config.getColT() != newAlpha) {
            config.setColT(newAlpha);
            restart = true;
          }
        }
      }
    }

    return restart;
  }
}