class BeatListener implements AudioListener {
  private BeatDetect soundEnergy;
  private BeatDetect freqEnergy;

  private AudioBuffer mix;

  BeatListener(AudioInput source, int sensitivity) {
    this.mix = source.mix;

    soundEnergy = new BeatDetect();
    freqEnergy = new BeatDetect(source.bufferSize(), source.sampleRate());

    soundEnergy.setSensitivity(sensitivity);  
    freqEnergy.setSensitivity(sensitivity);  

    source.addListener(this);
  }

  BeatListener(AudioPlayer source, int sensitivity) {
    this.mix = source.mix;

    soundEnergy = new BeatDetect();
    freqEnergy = new BeatDetect(source.bufferSize(), source.sampleRate());

    soundEnergy.setSensitivity(sensitivity);  
    freqEnergy.setSensitivity(sensitivity);  

    source.addListener(this);
  }

  public void samples(float[] samps) {
    soundEnergy.detect(mix);
    freqEnergy.detect(mix);
  }

  public void samples(float[] sampsL, float[] sampsR) {
    soundEnergy.detect(mix);
    freqEnergy.detect(mix);
  }

  public boolean isOnset() {
    return soundEnergy.isOnset ();
  }

  public int detectSize() {
    return freqEnergy.detectSize();
  }

  public boolean isRange(int low, int high, int threshold) {
    return freqEnergy.isRange (low, high, threshold);
  }

  public boolean isOnset(int i) {
    return freqEnergy.isOnset(i);
  }

  public boolean isKick() {
    return freqEnergy.isKick();
  }

  public boolean isSnare() {
    return freqEnergy.isSnare();
  }

  public boolean isHat() {
    return freqEnergy.isHat();
  }
}