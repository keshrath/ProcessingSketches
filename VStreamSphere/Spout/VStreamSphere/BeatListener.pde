/** 
 * This code is copyright (c) Mathias Markl 2016
 * 
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */

/**
 * This handles the sound analysis.
 *
 * @author Mathias Markl
 */
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