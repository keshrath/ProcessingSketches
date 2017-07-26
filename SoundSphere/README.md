# SoundSphere

SoundSphere is a Resolume Arena 5 plugin and all settings can be controlled by Resolume.

It uses Spout2 to communicate with Resolume. Spout is a real-time video sharing framework
for Windows. (http://spout.zeal.co/) 

The program renders a 3D sphere with multiple particles. It's possible to activate a
sound library. In that case the sphere will be sound reactive and change his size and
color based on the mix line input.

### Resolume controls:

* Sound Reactive:			(On/Off) 	 	- Enables the sphere to be sound reactive. 
* Beat Info: 				(On/Off) 	 	- Show some sound information. (beat, kick, snare, hat)
* Show Sphere: 				(On/Off) 	 	- Determines whether the sphere is drawn or not.
* Rotation:		    		(On/Off)	 	- Starts/Stops the rotation of the sphere.
* Zoom:			    		(On/Off)	 	- Starts/Stops the zoom effect.
* On-Sphere:				(On/Off)	 	- Determines whether particles move on or inside the sphere.
* Fixed Start:  			(On/Off)		- Fixed particle start position.
* Random Color:				(On/Off)	 	- If active the particles have a random color.
* Point Color:				(On/Off)	 	- If active the particles don't change their color.
* Show Lines:				(On/Off)	 	- Determines whether the triangles have a stroke or not.
* Triangle Only				(On/Off)	 	- If active only the generated triangles are rendered.
* No Triangles				(On/Off)	 	- If active no triangles are rendered.
* Particles:	   (0     -  200 |   100)	- Change the value to determine how many particles should be drawn.
* xPos:		       (0     -  800 |   400) 	- Change the value to move the x position of the sphere.
* yPos:		       (0     -  450 |   225) 	- Change the value to move the y position of the sphere.
* zPos:		   	   (0     -  500 |   200) 	- Change the value to move the z position of the sphere.
* RotateX Speed:   (0.001 - 0.05 | 0.005)	- Sets the rotation for the x axis.
* RotateY Speed:   (0.001 - 0.05 | 0.005)	- Sets the rotation for the y axis.
* radiusMin: 	   (30    -  130 |    75)	- Determines the minimum radius of the sphere.
* radiusMax: 	   (50    -  150 |    90)	- Determines the maximum radius of the sphere.
* minZoom:	   	   (0     -  500 |   185)	- Sets the minimum zoom value. [minZoom <= zPos <= maxZoom]
* maxZoom:	   	   (0     -  500 |   350)	- Sets the maximum zoom value. [minZoom <= zPos <= maxZoom]
* Zoom Speed:	   (0.0   -  1.0 |  0.02)	- Sets the zoom speed. This value indicates how fast the camera zooms in or out.
* Sphere ColH: 	   (0     -  360 |     0)	- Sets the Hue value of the sphere color.
* Sphere ColS: 	   (0     -  100 |     0)	- Sets the Saturation value of the sphere color.
* Sphere ColB: 	   (0     -  100 |   100)	- Sets the Brightness value of the sphere color.
* Sphere ColA: 	   (0     -  100 |     0)	- Sets the Alpha value of the sphere color.
* Sphere Details:  (0     -  100 |    20)	- Determines how detailed the sphere is drawn.
* Theta Speed:     (0.005 - 0.03 |  0.01) 	- Sets the maximum theta speed for the particles.
* Phi Speed:       (0.005 - 0.03 |  0.01) 	- Sets the maximum phi speed for the particles.
* Particle ColH:   (0     -  360 |     0)	- Sets the Hue value of the particle color.
* Particle ColS:   (0     -  100 |     0)	- Sets the Saturation value of the particle color.
* Particle ColB:   (0     -  100 |   100)	- Sets the Brightness value of the particle color.
* Particle ColA:   (0     -  100 |     0)	- Sets the Alpha value of the particle color.
* Min Distance:	   (0     -  100 |    20) 	- Determines the minimum distance from which the particles start to connect.

Some setting combinations are very CPU-intensive. So if you have any performance issues,
you might not use the following setting combinations:

* Drawing the triangles are quite CPU-intensive, so don't use to many particles and triangles at the same time.
* Drawing many triangles are also CPU-intensive, so you shouldn't use the option "Fixed Start" combined with triangles.

If you still have issues with lag, you should consider to reduce the number of particles.

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
* The folder structure should look like this: ../Resolume Arena 5.0.0/plugins/vfx/SoundSphere/$files$
* Start Resolume Arena 5
* Drag the SoundSphere plugin from Sources -> FFGL Sources -> SoundSphere to any layer
* Now you can use it like a normal Resolume source.