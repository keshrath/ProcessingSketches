import processing.opengl.*;

class SpoutManager {

  PGraphicsOpenGL pgl;
  int memorymode;

  SpoutManager () {
    pgl = (PGraphicsOpenGL) g;
    memorymode = -1;
  }  

  public void initSender(String name, int Width, int Height) {
    memorymode = JSpout.InitSender(name, Width, Height, 0);

    if (memorymode == 0)
      print("Sender initialized texture sharing\n");
    else if (memorymode == 1)
      print("Sender texture sharing not supported - using memory sharing\n");
    else if (memorymode == -1)
      print("Sender sharing initialization failed\n");
  }

  public void sendTexture() {
    pgl.beginPGL();
    pgl.loadTexture();  
    Texture tex = pgl.getTexture();
    JSpout.WriteTexture(tex.glWidth, tex.glHeight, tex.glName, tex.glTarget, true);
    pgl.endPGL();
  }

  public void closeSender() {
    if (JSpout.ReleaseSender())
      print("Sender closed" + "\n");
    else
      print("No sender to close" + "\n");
  }
}