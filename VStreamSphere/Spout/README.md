# VStreamSphere

VStreamSphere is a Processing application to render multiple spheres. The
application implements a SpoutReceive to receive a video stream. This stream
is used to set the texture of the spheres. There are multiple controls to
change the size and number of the spheres. The controls window can be opened
by pressing the 'c' key.

The application uses Spout to communicate with Resolume and other Spout applications.

[Spout] (http://spout.zeal.co/) is a realtime video sharing framework for Windows.
Senders and receivers include FreeframeGL plugins, a Java interface for Processing,
Jitter externals for Max/Msp, VIZZable, modules for Ableton Live, and a Virtual
Webcam as a universal receiver.

An useful tutorial to Spout and Resolume can be found [here] (http://ericmedine.com/spout-controller-for-resolume/).

### Processing keys:

* 'l'   ->   Toggels the console window.
* 'p'   ->   Prints the console stream to the standard system out stream.
* 'c'   ->   Opens the control window.

### Processing mouse:

* right-click 	-> 	 Opens the Spout SenderDialog.

### PControls:

* Collision Detection   ->   If the checkbox is set to active, the spheres will check for collision with other spheres.
* Sound Reactive        ->   If the checkbox is set to active, the spheres will be sound reactive.
* Sphere Count          ->   Slider to determine the number of spheres. It's might not be possible to have to maximum number of
							 spheres and collision detection active at the same time. If that's the case a log message will be shown.
* Sphere Radius         ->   Use the slicer to set the sphere radius.
* Sphere Rptatopm       ->   Use the slider to set the sphere rotation speed.

### Resolume controls:

* Collision Detection   (On / Off)      ->   If the checkbox is set to active, the spheres will check for collision with other spheres.
* Sound Reactive        (On / Off)	 	->   If the checkbox is set to active, the spheres will be sound reactive.
* Sphere Count          (1 -   30)      ->   Slider to determine the number of spheres. It's might not be possible to have to maximum number of
										     spheres and collision detection active at the same time. If that's the case a log message will be shown.
* Sphere Radius         (50 - 250)      ->   Use the slicer to set the sphere radius.
* Sphere Rotation       (0  -   1)		->   Use the slider to set the sphere rotation speed.

###  Requirements

* At least a Windows 7 64 bit version
* ATI Radeon HD 5000 series or better (256MB of VRAM)
* NVIDIA GeForce 210 or better (256MB of VRAM)
* [Java JDK 8] (http://www.oracle.com/technetwork/java/javase/downloads/index.html) or later
* [Processing 3] (https://processing.org/) or later
* [Spout 2] (http://spout.zeal.co/)

### Installation - Resolume:

* Download the ZIP file from [(here)] (https://github.com/keshrath/VStreamSphere/archive/master.zip)
* Extract the file
* Go into the Spout folder
* Copy the whole folder to -> ..\Documents\Resolume Arena 5\extra effects
* The folder structure should look like this: ..\Documents\Resolume Arena 5\extra effects\VStreamSphere\$files$
* Start Resolume Arena 5
* Drag the VStreamSphere plugin from Sources -> FFGL Sources -> VStreamSphere to any layer
* Now you can use it like a normal Resolume source.

### Troubleshooting

* In the case that the VStreamSphere doesn't show up under FFGL Sources, check if the video preferences are set correctly.

![image](https://cloud.githubusercontent.com/assets/4851083/12148611/b3fcdfe8-b49f-11e5-93d4-c56586529043.jpg)

* In the case that the plugin won't start, check if an Explorer window is open.

If an Explorer window is open to the sketch folder, it has the same name as the sketch so it won't start. If that
happens, delete from the cell and try again.

##### Other issues

If other problems occur please write an [ticket] (https://github.com/keshrath/VStreamSphere/issues).



