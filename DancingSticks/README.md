# DancingSticks

DancingSticks is a Resolume Arena 5 plugin and all settings can be controlled by Resolume.

It uses Spout2 to communicate with Resolume. Spout is a real-time video sharing framework
for Windows. (http://spout.zeal.co/) 

The program renders multiple sticks, which are rotating around a circle. Multiple settings
can be modified by Resolume. So many different looking animations can be created by just
changing the parameters.

### Resolume controls:

* A-Increment:	   (0.01 - 0.09 | 0.05)	- Determines the increment of the value a.
* B-Increment:	   (0.1  - 0.2  | 0.17)	- Determines the increment of the value b.
* Multiplier:	   (10   - 200  |  100) - Sets the value of the multiplier.
* Drawer:		   (1    -  20  |   18) - Determines how many drawer are rendered.
* Lines:		   (2    -  25  |    8) - Determines how many sticks are rendered.
* Hue-Range-Low:   (0    - 360  |   80)	- Lowest Hue value.
* Hue-Range-High:  (0    - 360  |  140)	- Highest Hue value.
* Saturation:	   (0    - 100  |   80)	- Sets the saturation.
* Brightness:	   (0    - 100  |   80)	- Sets the brightness.
* Alpha:	   	   (0    - 255  |   10)	- Sets the alpha value.

### Requirements:

* At least a Windows 7 64 bit version
* ATI Radeon HD 5000 series or better (256MB of VRAM)
* NVIDIA GeForce 210 or better (256MB of VRAM)
* Processing 3 or later (https://processing.org/)
* Spout 2 (http://spout.zeal.co/)

### Installation:

* Download the zip file
* Extract the file
* Copy the whole folder to -> ../Resolume Arena 5.0.0/plugins/vfx
* The folder structure should look like this: ../Resolume Arena 5.0.0/plugins/vfx/DancingSticks/$files$
* Start Resolume Arena 5
* Drag the DancingSticks plugin from Sources -> FFGL Sources -> DancingSticks to any layer
* Now you can use it like a normal Resolume source.