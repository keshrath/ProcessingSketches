class Config {
  private int frames;
  private int screenWidth;
  private int screenHeight;

  private String path;
  private boolean clearList;
  private boolean randomImage;

  private boolean beatActive;

  private int minimumHoldingTime;
  private int maximumHoldingTime;

  private boolean copyImage;

  private boolean resizeImage;
  private boolean fitImage;

  private String blendMode;

  private boolean kickActive;
  private String kickFilter;
  private float kickFilterParam; 

  private boolean snareActive;
  private String snareFilter;
  private float snareFilterParam; 

  private boolean hatActive;
  private String hatFilter;
  private float hatFilterParam; 

  public Config() {
    this.frames = 60;
    this.screenWidth = 1280;
    this.screenHeight = 720;

    this.path = "";
    this.clearList = true;
    this.randomImage = false;

    this.beatActive = false;

    this.minimumHoldingTime = 5;
    this.maximumHoldingTime = 60;

    this.copyImage = true;

    this.resizeImage = true;
    this.fitImage = false;

    this.blendMode = "CLEAR";

    this.kickActive = false;
    this.kickFilter = "";
    this.kickFilterParam = 2;

    this.snareActive = false;
    this.snareFilter = "";
    this.snareFilterParam = 2;

    this.hatActive = false;
    this.hatFilter = "";
    this.hatFilterParam = 2;
  }

  public int getFrames() {
    return frames;
  }

  public void setFrames(int frames) {
    this.frames = frames;
  }

  public int getScreenWidth() {
    return screenWidth;
  }

  public void setScreenWidth(int screenWidth) {
    this.screenWidth = screenWidth;
  }

  public int getScreenHeight() {
    return screenHeight;
  }

  public void setScreenHeight(int screenHeight) {
    this.screenHeight = screenHeight;
  }

  public void setPath(String value) {
    this.path = value;
  }

  public String getPath() {
    return path;
  }

  public void setClearList(boolean value) {
    clearList = value;
  }

  public boolean isClearList() {
    return clearList;
  }

  public void setRandomImage(boolean value) {
    randomImage = value;
  }

  public boolean isRandomImage() {
    return randomImage;
  }

  public void setBeatActive(boolean value) {
    beatActive = value;
  }

  public boolean isBeatActive() {
    return beatActive;
  }

  public int getMinimumHoldingTime() {
    return minimumHoldingTime;
  }

  public void setMinimumHoldingTime(int minimumHoldingTime) {
    this.minimumHoldingTime = minimumHoldingTime;
  }

  public int getMaximumHoldingTime() {
    return maximumHoldingTime;
  }

  public void setMaximumHoldingTime(int maximumHoldingTime) {
    this.maximumHoldingTime = maximumHoldingTime;
  }

  public void setCopyImage(boolean value) {
    copyImage = value;
  }

  public boolean isCopyImage() {
    return copyImage;
  }

  public void setResizeImage(boolean value) {
    resizeImage = value;
  }

  public boolean isResizeImage() {
    return resizeImage;
  }

  public void setFitImage(boolean value) {
    fitImage = value;
  }

  public boolean isFitImage() {
    return fitImage;
  }

  public void setBlendMode(String value) {
    blendMode = value;
  }

  public String getBlendMode() {
    return blendMode;
  }

  public boolean isKickActive() {
    return kickActive;
  }

  public void setKickActive(boolean kickActive) {
    this.kickActive = kickActive;
  }

  public String getKickFilter() {
    return kickFilter;
  }

  public void setKickFilter(String kickFilter) {
    this.kickFilter = kickFilter;
  }

  public float getKickFilterParam() {
    return kickFilterParam;
  }

  public void setKickFilterParam(float kickFilterParam) {
    this.kickFilterParam = kickFilterParam;
  }

  public boolean isSnareActive() {
    return snareActive;
  }

  public void setSnareActive(boolean snareActive) {
    this.snareActive = snareActive;
  }

  public String getSnareFilter() {
    return snareFilter;
  }

  public void setSnareFilter(String snareFilter) {
    this.snareFilter = snareFilter;
  }

  public float getSnareFilterParam() {
    return snareFilterParam;
  }

  public void setSnareFilterParam(float snareFilterParam) {
    this.snareFilterParam = snareFilterParam;
  }

  public boolean isHatActive() {
    return hatActive;
  }

  public void setHatActive(boolean hatActive) {
    this.hatActive = hatActive;
  }

  public String getHatFilter() {
    return hatFilter;
  }

  public void setHatFilter(String hatFilter) {
    this.hatFilter = hatFilter;
  }

  public float getHatFilterParam() {
    return hatFilterParam;
  }

  public void setHatFilterParam(float hatFilterParam) {
    this.hatFilterParam = hatFilterParam;
  }
}