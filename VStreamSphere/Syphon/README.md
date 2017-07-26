# VStreamSphere

VStreamSphere is a Processing application to render multiple spheres. The
application implements a SyphonClient to receive a video stream. This stream
is used to set the texture of the spheres. There are multiple controls to
change the size and number of the spheres. The controls window can be opened
by pressing the 'c' key.

The application uses Syphon to communicate with Resolume and other Syphon applications.

[Syphon] (http://syphon.v002.info/) is an open source Mac OS X technology that
allows applications to share frames with one another in realtime.

A pair of applications to test Syphon functionality can be downloaded from [here] (https://github.com/Syphon/Simple/releases/download/public-beta-2/Syphon.Demo.Apps.Public.Beta.2.dmg).

### Processing keys:

* 'l'   ->   Toggels the console window.
* 'p'   ->   Prints the console stream to the standard system out stream.
* 'c'   ->   Opens the control window.

### Processing mouse:

* left-click    ->   Switch to the next client.
* right-click   ->   Load all available Syphon clients.

### PControls:

* Collision Detection   ->   If the checkbox is set to active, the spheres will check for collision with other spheres.
* Sound Reactive        ->   If the checkbox is set to active, the spheres will be sound reactive.
* Sphere Count          ->   Slider to determine the number of spheres. It's might not be possible to have to maximum number of
							 spheres and collision detection active at the same time. If that's the case a log message will be shown.
* Sphere Radius         ->   Use the slicer to set the sphere radius.
* Sphere Rptatopm       ->   Use the slider to set the sphere rotation speed.

###  Requirements

* MacOS X 10.6 (Snow Leopard) or later
* [Java JDK 8] (http://www.oracle.com/technetwork/java/javase/downloads/index.html) or later
* [Processing 3] (https://processing.org/) or later

### Troubleshooting

If problems occur please write an [ticket] (https://github.com/keshrath/VStreamSphere/issues).
