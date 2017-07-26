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

    spout.CreateSpoutControl("X-Pos", "float", 0, 800, 219.72);
    spout.CreateSpoutControl("Y-Pos", "float", 0, 800, 400.00);
    spout.CreateSpoutControl("Zoom-Factor", "float", 0, 5, 4);
    spout.CreateSpoutControl("Max-Iterations", "float", 1, 1000, 200);
    spout.CreateSpoutControl("HueLowerB", "float", 0, 360, 201);
    spout.CreateSpoutControl("HueUpperB", "float", 0, 360, 210);
    spout.CreateSpoutControl("SaturationLowerB", "float", 0, 100, 80);
    spout.CreateSpoutControl("SaturationUpperB", "float", 0, 100, 100);
    spout.CreateSpoutControl("BrightnessLowerB", "float", 0, 100, 0);
    spout.CreateSpoutControl("BrightnessUpperB", "float", 0, 100, 95);
    spout.CreateSpoutControl("Zoom", "bool", 0);
    spout.CreateSpoutControl("Zoom-Iterations", "float", 0, 500, 60);
    spout.CreateSpoutControl("Zoom-Speed", "float", 0, 1000, 10);
    spout.CreateSpoutControl("Hint", "bool", 0);
  }

  public boolean[] updateControls(Config config) {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    boolean update = false;
    boolean redraw = false;

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {
        if (controlName[i].equals("X-Pos")) {          
          float newXPos = controlValue[i];
          if (config.getXPos() != newXPos) {
            config.setXPos(newXPos);
            update = true;
          }
        }

        if (controlName[i].equals("Y-Pos")) {          
          float newYPos = controlValue[i];
          if (config.getYPos() != newYPos) {
            config.setYPos(newYPos);
            update = true;
          }
        }

        if (controlName[i].equals("Zoom-Factor")) {          
          float newZoomFactor = controlValue[i];
          if (config.getZoomFactor() != newZoomFactor) {
            config.setZoomFactor(newZoomFactor);
            redraw = true;
          }
        }

        if (controlName[i].equals("Max-Iterations")) {          
          int newMaxIterations = int(controlValue[i]);
          if (config.getMaxIter() != newMaxIterations) {
            config.setMaxIter(newMaxIterations);
            redraw = true;
          }
        }

        if (controlName[i].equals("HueLowerB")) {          
          config.setHueLowerBound(controlValue[i]);
        }

        if (controlName[i].equals("HueUpperB")) {          
          config.setHueUpperBound(controlValue[i]);
        }

        if (controlName[i].equals("SaturationLowerB")) {          
          config.setSaturationLowerBound(controlValue[i]);
        }

        if (controlName[i].equals("SaturationUpperB")) {          
          config.setSaturationUpperBound(controlValue[i]);
        }

        if (controlName[i].equals("BrightnessLowerB")) {          
          config.setBrightnessLowerBound(controlValue[i]);
        }

        if (controlName[i].equals("BrightnessUpperB")) {          
          config.setBrightnessUpperBound(controlValue[i]);
        }

        if (controlName[i].equals("Zoom")) {
          config.setZoom((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Zoom-Iterations")) {          
          config.setZoomIter(int(controlValue[i]));
        }

        if (controlName[i].equals("Zoom-Speed")) {          
          config.setZoomSpeed(controlValue[i]);
        }

        if (controlName[i].equals("Hint")) {
          config.setHint((boolean)(controlValue[i] == 1));
        }
      }
    }

    boolean[] output = new boolean[2];
    output[0] = update;
    output[1] = redraw;
    
    return output;
  }
}