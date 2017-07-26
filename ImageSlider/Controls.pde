class Controls {

  private SpoutManager spout;

  private String[] controlName;
  private int[] controlType;
  private float[] controlValue;
  private String[] controlText;

  public Controls() {
    controlName = new String[30];
    controlType = new int[30];
    controlValue = new float[30];
    controlText = new String[30];
  }

  public void createControls(SpoutManager spout) {
    this.spout = spout;

    spout.CreateSpoutControl("FPS", "float", 1, 60, 30);
    spout.CreateSpoutControl("Path", "text", "");
    spout.CreateSpoutControl("Clear list", "bool", 1);
    spout.CreateSpoutControl("Random image", "bool", 0);
    spout.CreateSpoutControl("Beat reactive", "bool", 0);
    spout.CreateSpoutControl("Minimum time", "float", 0, 300, 5);
    spout.CreateSpoutControl("Maximum time", "float", 0, 600, 60);
    spout.CreateSpoutControl("Resize image", "bool", 1);
    spout.CreateSpoutControl("Fit image", "bool", 0);
    spout.CreateSpoutControl("Blend mode", "text", "");
    spout.CreateSpoutControl("Kick reactive", "bool", 0);
    spout.CreateSpoutControl("Kick Filter", "text", "");
    spout.CreateSpoutControl("Kick Param", "text", "2");
    spout.CreateSpoutControl("Snare reactive", "bool", 0);
    spout.CreateSpoutControl("Snare Filter", "text", "");
    spout.CreateSpoutControl("Snare Param", "text", "2");
    spout.CreateSpoutControl("Hat reactive", "bool", 0);
    spout.CreateSpoutControl("Hat Filter", "text", "");
    spout.CreateSpoutControl("Hat Param", "text", "2");
  }

  public boolean updateControls(Config config) {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    boolean restart = false;

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {
        
        if (controlName[i].equals("FPS")) {   
          int newFrames = int(controlValue[i]);
          if(config.getFrames() != newFrames) {
            config.setFrames(newFrames);
            restart = true;
          }
        }

        if (controlName[i].equals("Path")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            String newPath = controlText[i];
            newPath = newPath.replace("\\", "/");
            if (!config.getPath().equals(newPath)) {
              config.setPath(newPath);
              restart = true;
            }
          }
        }

        if (controlName[i].equals("Clear list")) {
          config.setClearList((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Random image")) {
          config.setRandomImage((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Beat reactive")) {
          config.setBeatActive((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Minimum time")) {          
          config.setMinimumHoldingTime(int(controlValue[i]));
        }

        if (controlName[i].equals("Maximum time")) { 
          config.setMaximumHoldingTime(int(controlValue[i]));
        }

        if (controlName[i].equals("Resize image")) {
          config.setResizeImage((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Fit image")) {
          config.setFitImage((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Blend mode")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            config.setBlendMode(controlText[i]);
          }
        }

        if (controlName[i].equals("Kick reactive")) {
          config.setKickActive((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Kick Filter")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            config.setKickFilter(controlText[i]);
          }
        }

        if (controlName[i].equals("Kick Param")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            String param = controlText[i];
            float paramFloat = -1;

            try {
              paramFloat = Float.parseFloat(param);
            } 
            catch(NumberFormatException e) {
              paramFloat = -1;
            }

            config.setKickFilterParam(paramFloat);
          }
        }

        if (controlName[i].equals("Snare reactive")) {
          config.setSnareActive((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Snare Filter")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            config.setSnareFilter(controlText[i]);
          }
        }

        if (controlName[i].equals("Snare Param")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            String param = controlText[i];
            float paramFloat = -1;

            try {
              paramFloat = Float.parseFloat(param);
            } 
            catch(NumberFormatException e) {
              paramFloat = -1;
            }

            config.setSnareFilterParam(paramFloat);
          }
        }

        if (controlName[i].equals("Hat reactive")) {
          config.setHatActive((boolean)(controlValue[i] == 1));
        }

        if (controlName[i].equals("Hat Filter")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            config.setHatFilter(controlText[i]);
          }
        }

        if (controlName[i].equals("Hat Param")) {
          if (controlText[i] != null && !controlText[i].isEmpty()) {
            String param = controlText[i];
            float paramFloat = -1;

            try {
              paramFloat = Float.parseFloat(param);
            } 
            catch(NumberFormatException e) {
              paramFloat = -1;
            }

            config.setHatFilterParam(paramFloat);
          }
        }
      }
    }

    return restart;
  }
}