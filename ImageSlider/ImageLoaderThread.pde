class ImageLoaderThread extends Thread {
  private ImageLoader loader;
  private String name;

  public ImageLoaderThread(ImageLoader loader, String name) {
    super(loader, name);
    this.loader = loader;
    this.name = name;
  }

  public void startLoading() {
    println(name + ": start loading...");
    super.start();
  }

  public void stopLoading() {
    println(name + ": stop loading...");
    loader.stop();
  }
}