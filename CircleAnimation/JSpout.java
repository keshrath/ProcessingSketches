class JSpout {

  static {
    String dataModel = System.getProperty("os.arch");
    System.out.println("System: " + dataModel);
    System.out.println("loading dll libary...");
    
    if (dataModel.equals("x86_32"))  
      System.loadLibrary("JSpout_32");
    else if (dataModel.equals("x86_64") || dataModel.equals("amd64"))  
      System.loadLibrary("JSpout_64");
  }

  static native int InitSender(String name, int width, int height, int mode);

  static native int InitReceiver(String name, int[] dim, int mode);

  static native boolean ReleaseSender();

  static native boolean ReleaseReceiver();

  static native boolean WriteToSharedMemory(int w, int h, int[] pix);

  static native boolean ReadFromSharedMemory(int[] dim, int[] pix);

  static native boolean ReadTexture(int[] dim, int[] pix);

  static native boolean WriteTexture(int w, int h, int texID, int texTarget, boolean bInvert);

  static native String GetSenderName();

  static native boolean SenderDialog();
}