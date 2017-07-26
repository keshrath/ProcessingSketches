class ImageManager {
  private ArrayList<ImageContainer> containerList;
  private ArrayList<String> keyList;
  private boolean listLock;

  private int currentIndex;

  public ImageManager() {
    containerList = new ArrayList<ImageContainer>();
    keyList = new ArrayList<String>();
    listLock = false;
    currentIndex = 0;
  }

  synchronized public void add(ImageContainer img) {
    if (!keyList.contains(img.getFilePath())) {
      keyList.add(img.getFilePath());

      listLock = true;
      containerList.add(img);
      listLock = false;
    }

    println("ContainerList is currently holding: " + containerList.size() + " images.");
  }

  public ImageContainer getRandom() {
    while (listLock) {
      // waiting
    }

    if (containerList.isEmpty()) {
      println("ContainerList is currently holding no images.");
      return new ImageContainer("", "", loadImage("photo.jpg"));
    } else {
      return containerList.get((int) random(0, containerList.size() - 1));
    }
  }

  public ImageContainer getNext() {
    while (listLock) {
      // waiting
    }

    if (containerList.isEmpty()) {
      println("ContainerList is currently holding no images.");
      return new ImageContainer("", "", loadImage("photo.jpg"));
    } else {
      if (currentIndex >= containerList.size() - 1) {
        currentIndex = 0;
      } else {
        currentIndex++;
      }
      return containerList.get(currentIndex);
    }
  }

  public void clearList() {
    while (listLock) {
      // waiting
    }

    containerList.clear();
    keyList.clear();
    currentIndex = 0;
  }
}