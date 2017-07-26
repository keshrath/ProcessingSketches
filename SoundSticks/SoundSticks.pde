import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

/**
 * SoundSticks Music Visualizer
 * SoundSticks is build as a SpoutSender to work with Resolume Arena 5.
 *
 * @author Mathias Markl
 */

private static final String NAME = "SpoutSenderSoundSticks";

// STICKS < 512 && STICKS % 2 == 0
private static final int STICKS = 50;

// STICK Data
private static final float BOX_X = 15;
private static final float BOX_Y_START = 100;
private static final float BOX_Z = 15;
private static final int COLOR = 140;

// Animation
private static final float ROTATION_SPEED = 0.001f;
private static final float GAP = 6.2f;
private static final float SHRINK_MULTI = 3.5f;
private static final float SIZE_SOUND_MULTI = 750f;
private static final float COLOR_SOUND_MULTI = 450f;

private Minim minim;
private AudioInput in;

private float rY = 0;

private SpoutManager spout;

public void settings() {
  size(1024, 800, P3D);
}

public void setup() {
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);
  
  colorMode(HSB, 360);
  noStroke();
  
  spout = new SpoutManager();
  spout.initSender(NAME, width, height);
} 

public void draw()  { 
  background(0);
  lights();
  
  int indexJumps = in.bufferSize() / (STICKS / 2);
  ArrayList<Float> mixMusic = new ArrayList<Float>();
  
  for (int i = 0; i < (STICKS / 2); i++) {
    mixMusic.add(Math.abs(in.mix.get(indexJumps * i)));
  }
  
  ArrayList<Float> mixMusicLeft = new ArrayList<Float>();
  mixMusicLeft = mixMusic;
  
  ArrayList<Float> mixMusicRight = new ArrayList<Float>();
  for (int i = mixMusic.size() - 1; i >= 0; i--) {
    mixMusicRight.add(mixMusic.get(i));
  }
  
  int shrinkLeft = STICKS / 2;
  int shrinkRight = 0;
  int colorLeft = STICKS / 2;
  int colorRight = 0;
  for (int i = 0; i < STICKS; i++) {
    pushMatrix();
    
    translate((BOX_X + GAP) * i - (BOX_X / 2), height / 2, 0);
    
    if (i < STICKS / 2) {
      rotateY(rY * (-1));
      box(BOX_X, (BOX_Y_START + SHRINK_MULTI * shrinkLeft--) + mixMusicLeft.get(i % 25) * SIZE_SOUND_MULTI, BOX_Z);
      fill(COLOR + 2 * colorLeft++, 200 + mixMusicLeft.get(i % 25) * COLOR_SOUND_MULTI, 250 + mixMusicLeft.get(i % 25) * COLOR_SOUND_MULTI);
    } else {
      if (shrinkRight == 0) {
        shrinkRight = shrinkLeft;
        colorRight = colorLeft;
      }
      rotateY(rY);
      box(BOX_X, (BOX_Y_START + SHRINK_MULTI * shrinkRight++) + mixMusicRight.get(i % 25) * SIZE_SOUND_MULTI, BOX_Z);
      fill(COLOR + 2 * colorRight--, 200 + mixMusicRight.get(i % 25) * COLOR_SOUND_MULTI, 250 + mixMusicRight.get(i % 25) * COLOR_SOUND_MULTI);
    }
    rY += ROTATION_SPEED;
    
    popMatrix();
  }
  
  spout.sendTexture();
}

public void exit() {
  spout.closeSender();
  super.exit();
} 