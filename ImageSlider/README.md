# SoundImages

SoundImages is a Resolume Arena 5 plugin and all settings can be controlled by Resolume.

It uses Spout2 to communicate with Resolume. Spout is a real-time video sharing framework
for Windows. (http://spout.zeal.co/) 

The program loads images form a specified folder and starts a slide show. The slide show
can be enabled to be sound reactive. In that case the image gets blended on every beat and
and on every kick, snare or hat filters are applied to the image.

### Resolume controls:

* FPS:						(1 -  60 |  30)		- Sets the frames per seconds. For example if the fps is set to 30 the slider is renders 30 times per second.
* Path: 						(Text) 	 		- The path to the image folder. (e.g. C:/Users/Mathias/Pictures)
* Clear list: 					(On/Off) 	 	- If the checkbox is set to active, the current images gets deleted if you change the path.
* Random image:		    		(On/Off)	 	- The default mode the plugin slides through the images one by one. In random mode the slider just picks one image randomly.
* Beat reactive:			    (On/Off)	 	- If active the images slide on beat.
* Minimum holding time:		(0 - 300 |   5)		- Determines how many frames the image is shown, even if a beat occurs before the time is up.
* Maximum holding time:		(0 - 600 |  60)		- Determines the maximum frames an image is shown, even if there wasn't a beat detected.
* Resize image:					(On/Off)	 	- If active the image is scaled to the screen size. 
* Fit image:					(On/Off)	 	- If active the image is resized to the screen size.
* Blend mode: 					(Text) 	 		- Insert the blend mode keyword. The following keywords are supported. (BLEND, ADD, ...) Its also possible to add multiple keywords separated by a space. In that case the blendMode is picked randomly from the provided list.
* Kick reactive:				(On/Off)	 	- If active filter are applied on every detected kick.
* Kick Filter: 					(Text) 	 		- Insert one or multiple filter keywords. Multiple keywords must be separated by a space. The following keywords are supported. (BLEND, ADD, ...)
* Kick Filter Param:			(Text)			- Insert the parameter for the filter or leave it empty to use the default value.
* Snare reactive:				(On/Off)	 	- If active filter are applied on every detected kick.
* Snare Filter: 				(Text) 	 		- Insert one or multiple filter keywords. Multiple keywords must be separated by a space. The following keywords are supported. (BLEND, ADD, ...)
* Snare Filter Param:			(Text)			- Insert the parameter for the filter or leave it empty to use the default value.
* Hat reactive:					(On/Off)	 	- If active filter are applied on every detected kick.
* Hat Filter: 					(Text) 	 		- Insert one or multiple filter keywords. Multiple keywords must be separated by a space. The following keywords are supported. (BLEND, ADD, ...)
* Hat Filter Param:				(Text)			- Insert the parameter for the filter or leave it empty to use the default value.

#### Blend mode keyword:

* BLEND 		- linear interpolation of colours: C = A*factor + B. This is the default blending mode.
* ADD 			- additive blending with white clip: C = min(A*factor + B, 255)
* SUBTRACT 		- subtractive blending with black clip: C = max(B - A*factor, 0)
* DARKEST 		- only the darkest colour succeeds: C = min(A*factor, B)
* LIGHTEST 		- only the lightest colour succeeds: C = max(A*factor, B)
* DIFFERENCE	- subtract colors from underlying image.
* EXCLUSION 	- similar to DIFFERENCE, but less extreme.
* MULTIPLY 		- multiply the colors, result will always be darker.
* SCREEN 		- opposite multiply, uses inverse values of the colors.
* REPLACE 		- the pixels entirely replace the others and don't utilize alpha (transparency) values
* CLEAR			- sets the background to black and loads the new image

#### Filter keyword:

* THRESHOLD 		- Converts the image to black and white pixels depending if they are above or below the threshold defined by the level parameter. The parameter must be between 0.0 (black) and 1.0 (white). If no level is specified, 0.5 is used.
* GRAY 				- Converts any colors in the image to grayscale equivalents. No parameter is used.
* OPAQUE 			- Sets the alpha channel to entirely opaque. No parameter is used.
* INVERT 			- Sets each pixel to its inverse value. No parameter is used.
* POSTERIZE 		- Limits each channel of the image to the number of colors specified as the parameter. The parameter can be set to values between 2 and 255, but results are most noticeable in the lower ranges.
* BLUR 				- Executes a Guassian blur with the level parameter specifying the extent of the blurring. If no parameter is used, the blur is equivalent to Guassian blur of radius 1. Larger values increase the blur.
* ERODE 			- Reduces the light areas. No parameter is used.
* DILATE 			- Increases the light areas. No parameter is used.

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