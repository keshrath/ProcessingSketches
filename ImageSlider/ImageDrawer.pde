class ImageDrawer {

  private static final String WORD_SPLIT_REGEX = "[[ ]*|[,]*|[\\.]*|[:]*|[/]*|[!]*|[?]*|[+]*]+";

  private ImageManager manager;
  private Config config;
  private BeatListener beatListener;

  private PImage currentImage;
  private int holdingTime;

  private int modeIndex;

  public ImageDrawer(ImageManager manager, Config config, BeatListener beatListener) {
    this.manager = manager;
    this.config = config;
    this.beatListener = beatListener;

    this.holdingTime = 0;
    this.modeIndex = 0;
  }

  public void init() {
    imageMode(CENTER);
    loadImg();
  }

  private void loadImg() {
    if (config.isRandomImage()) {
      currentImage = manager.getRandom().getImg().copy();
    } else {
      currentImage = manager.getNext().getImg().copy();
    }
  }

  public void update() {
    if (((config.isBeatActive() && beatListener.isOnset()) || config.getMaximumHoldingTime() <= holdingTime) && config.getMinimumHoldingTime() <= holdingTime) {
      loadImg();
      setBlendMode();
      holdingTime = 0;
    } else {
      holdingTime++;
    }

    if (config.isFitImage()) {
      currentImage = fitToScreen(currentImage);
    }

    if (config.isResizeImage()) {
      currentImage = scaleToScreen(currentImage);
    }
  }

  public void render() {
    if (holdingTime == 0) { 
      image(currentImage, width/2, height/2);
    }

    if (beatListener.isKick() && config.isKickActive()) {
      addFilter(config.getKickFilter(), config.getKickFilterParam());
    }

    if (beatListener.isSnare() && config.isSnareActive()) {
      addFilter(config.getSnareFilter(), config.getSnareFilterParam());
    }

    if (beatListener.isHat() && config.isHatActive()) {
      addFilter(config.getHatFilter(), config.getHatFilterParam());
    }
  }

  private PImage scaleToScreen(PImage img) {
    float wImg = currentImage.width;
    float hImg = currentImage.height;
    float ratio = 1;

    if (wImg > hImg) {
      ratio = width / wImg;
    } else if (wImg < hImg) {
      ratio = height / hImg;
    } else {
      ratio = height / hImg;
    }

    img.resize(int(currentImage.width * ratio), int(currentImage.height * ratio));
    return img;
  }

  private PImage fitToScreen(PImage img) {
    img.resize(width, height);
    return img;
  }

  private void setBlendMode() {
    String[] blendModeList = config.getBlendMode().split(WORD_SPLIT_REGEX);

    String mode = "";

    if (blendModeList.length > 1) {
      mode = blendModeList[modeIndex];

      modeIndex++;
      if (modeIndex >= blendModeList.length) {
        modeIndex = 0;
      }
    } else if (blendModeList.length == 1) {
      mode = blendModeList[0];
    }

    if (mode.toUpperCase().equals("BLEND")) {
      blendMode(BLEND);
    } else if (mode.toUpperCase().equals("ADD")) {
      blendMode(ADD);
    } else if (mode.toUpperCase().equals("SUBTRACT")) {
      blendMode(SUBTRACT);
    } else if (mode.toUpperCase().equals("DARKEST")) {
      blendMode(DARKEST);
    } else if (mode.toUpperCase().equals("LIGHTEST")) {
      blendMode(LIGHTEST);
    } else if (mode.toUpperCase().equals("DIFFERENCE")) {
      blendMode(DIFFERENCE);
    } else if (mode.toUpperCase().equals("EXCLUSION")) {
      blendMode(EXCLUSION);
    } else if (mode.toUpperCase().equals("MULTIPLY")) {
      blendMode(MULTIPLY);
    } else if (mode.toUpperCase().equals("SCREEN")) {
      blendMode(SCREEN);
    } else if (mode.toUpperCase().equals("REPLACE")) {
      blendMode(REPLACE);
    } else if (mode.toUpperCase().equals("CLEAR")) {
      background(0);
      blendMode(REPLACE);
    } else {
      println("Unkown blend mode! ImageCollector will use the mode \"REPLACE\".");
      blendMode(REPLACE);
    }
  }

  private void addFilter(String filter, float param) {
    String[] filterList = filter.split(WORD_SPLIT_REGEX);

    for (String filterString : filterList) {
      if (filterString.toUpperCase().equals("THRESHOLD")) {
        if (param != -1) {
          filter(THRESHOLD, param);
        } else {
          filter(THRESHOLD);
        }
      } else if (filterString.toUpperCase().equals("GRAY")) {
        filter(GRAY);
      } else if (filterString.toUpperCase().equals("OPAQUE")) {
        filter(OPAQUE);
      } else if (filterString.toUpperCase().equals("INVERT")) {
        filter(INVERT);
      } else if (filterString.toUpperCase().equals("POSTERIZE")) {
        if (param != -1) {
          filter(POSTERIZE, param);
        } else {
          filter(POSTERIZE);
        }
      } else if (filterString.toUpperCase().equals("BLUR")) {
        if (param != -1) {
          filter(BLUR, param);
        } else {
          filter(BLUR);
        }
      } else if (filterString.toUpperCase().equals("ERODE")) {
        filter(ERODE);
      } else if (filterString.toUpperCase().equals("DILATE")) {
        filter(DILATE);
      } else {
        println("Unkown filter \"" + filterString + "\"!");
      }
    }
  }
}