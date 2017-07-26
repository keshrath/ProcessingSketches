class ImageLoader implements Runnable {
  private boolean running;
  private long checkingTimerMil;
  private String path;
  private ImageManager manager; 

  public ImageLoader(long checkingTimerMil, String path, ImageManager manager) {
    this.checkingTimerMil = checkingTimerMil;
    this.path = path;
    this.manager = manager;
    running  = true;
  }

  @Override
  public void run() {
    while (running) {

      println("Loader run...");
      load();

      try {
        Thread.sleep(checkingTimerMil);
      } 
      catch (Exception e) {
        e.printStackTrace();
      }
    }
  }

  public void stop() {
    running = false;
  }

  private void load() {
    File pathLocation = new File(path);

    if (pathLocation.isFile()) {
      addFile(pathLocation);
    } else if (pathLocation.isDirectory()) {
      File[] files = pathLocation.listFiles();
      for (int i = 0; i < files.length && running; i++) {
        addFile(files[i]);
      }
    } else {
      println("The path (" + path + ") is invalid!");
    }
  }

  private void addFile(File file) {
    if (file.getName().endsWith(".gif") || file.getName().endsWith(".jpg") ||
      file.getName().endsWith(".tga") || file.getName().endsWith(".png")) {
      PImage img = loadImage(file.getAbsolutePath());
      ImageContainer container = new ImageContainer(file.getName(), file.getAbsolutePath(), img);
      manager.add(container);
    } else {
      println("The file (" + file.getName() + ") has an invalid file extension");
    }
  }
}