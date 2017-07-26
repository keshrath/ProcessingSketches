class ImageContainer {
  private String fileName;
  private String filePath;
  private PImage img;

  public ImageContainer(String fileName, String filePath, PImage img) {
    this.fileName = fileName;
    this.filePath = filePath;
    this.img = img;
  }

  public String getFileName() {
    return fileName;
  }

  public String getFilePath() {
    return filePath;
  }

  public PImage getImg() {
    return img;
  }
}