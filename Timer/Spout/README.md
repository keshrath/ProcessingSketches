# Timer

Timer is a Processing application to render a custom countdown. The countdown 
can be either till a certain date or a given amount of milliseconds. There are
multiple controls to change the look of the timer. The controls window can be
opened by pressing the 'c' key.

The application uses Spout to communicate with Resolume and other Spout applications.

[Spout] (http://spout.zeal.co/) is a realtime video sharing framework for Windows.
Senders and receivers include FreeframeGL plugins, a Java interface for Processing,
Jitter externals for Max/Msp, VIZZable, modules for Ableton Live, and a Virtual
Webcam as a universal receiver.

An useful tutorial to Spout and Resolume can be found [here] (http://ericmedine.com/spout-controller-for-resolume/).

It is possible to add a custom font for the timer text. Therefor go to the project
folder and open the folder called data. Just replace the CustomFont-250.vlw file
with your own font. Make sure that the name is exactly the same.

In case you also want to change the text size, just open the Config.pde and change
the code line 37.

```java
// 140f - sizeDefault
// 110f - sizeDays
// 110f - sizeMillis
// 100f - sizeDaysMillis
// 220f - sizeAnimation
// 0.8f - smallFactor
// 1.0f - mediumFactor
// 1.2f - largeFactor

public final Font FONT_CUSTOM = new Font("CustomFont-250.vlw", 140f, 110f, 110f, 100f, 220f, 0.8f, 1f, 1.2f);
```

It's also possible to change the video. It works the same as changing the font. Just replace the movie.mov file.

### Processing keys:

* 'l'   ->   Toggels the console window.
* 'p'   ->   Prints the console stream to the standard system out stream.
* 'c'   ->   Opens the control window.

### PControls:

* Show Millis     ->   Determines if the countdown displays milliseconds or not.
* Show Animation  ->   If the checkbox is set to active, the last 30 seconds will be rendered differently.
* Fonts           ->   Use the slider to switch between different fonts.
* Size            ->   Use the slicer to switch between different text sizes.
* Text Align      ->   Use the slider to switch between differnt text layouts.
* Timer Setting   ->   Use the text field to either set a new ending date or a new time in milliseconds. Afterwards press the Button to restart the countdown with the new setting.
* Loop Video      ->   If the checkbox is set to active, the the video will loop.

### Resolume controls:

* Show Millis: 		(On/Off)     ->   Determines if the countdown displays milliseconds or not.
* Show Animation:  	(On/Off)	 ->   If the checkbox is set to active, the last 30 seconds will be rendered differently.
* Fonts:			(1 - 10)     ->   Use the slider to switch between different fonts.
* Size:				(1 -  3)     ->   Use the slicer to switch between different text sizes.
* Text Align:		(1 -  9)     ->   Use the slider to switch between differnt text layouts.
* Timer:			(Text)		 ->   Use the text field to either set a new ending date or a new time in milliseconds.
* Restart Timer: 	(Button) 	 ->   Afterwards Press the Button to restart the countdown.
* Loop Video:		(On/Off)     ->   If the checkbox is set to active, the the video will loop.

### Date formats (PControls & Resolume controls)

* dd.MM.yyyy HH:mm:ss
* yyyy-MM-dd'T'HH:mm:ss'Z'
* yyyy-MM-dd'T'HH:mm:ssZ
* yyyy-MM-dd'T'HH:mm:ss
* yyyy-MM-dd'T'HH:mm:ss.SSS'Z'
* yyyy-MM-dd'T'HH:mm:ss.SSSZ
* yyyy-MM-dd HH:mm:ss
* MM/dd/yyyy HH:mm:ss
* MM/dd/yyyy'T'HH:mm:ss.SSS'Z'
* MM/dd/yyyy'T'HH:mm:ss.SSSZ 
* MM/dd/yyyy'T'HH:mm:ss.SSS
* MM/dd/yyyy'T'HH:mm:ssZ
* MM/dd/yyyy'T'HH:mm:ss
* yyyy:MM:dd HH:mm:ss
* yyyyMMdd
* dd.MM.yyyy
* MM/dd/yyyy

#### Example

* 22.09.2016
* 10/10/2016
* 20.12.2016 22:20:30

###  Requirements

* At least a Windows 7 64 bit version
* ATI Radeon HD 5000 series or better (256MB of VRAM)
* NVIDIA GeForce 210 or better (256MB of VRAM)
* [Java JDK 8] (http://www.oracle.com/technetwork/java/javase/downloads/index.html) or later
* [Processing 3] (https://processing.org/) or later
* [Spout 2] (http://spout.zeal.co/)

### Installation - Resolume:

* Download the ZIP file from [(here)] (https://github.com/keshrath/Timer/archive/master.zip)
* Extract the file
* Go into the Spout folder
* Copy the whole folder to -> ..\Documents\Resolume Arena 5\extra effects
* The folder structure should look like this: ..\Documents\Resolume Arena 5\extra effects\Timer\$files$
* Start Resolume Arena 5
* Drag the Timer plugin from Sources -> FFGL Sources -> Timer to any layer
* Now you can use it like a normal Resolume source.

### Troubleshooting

##### In the case that the Timer doesn't show up under FFGL Sources, check if the video preferences are set correctly.

![image](https://cloud.githubusercontent.com/assets/4851083/12148611/b3fcdfe8-b49f-11e5-93d4-c56586529043.jpg)

##### In the case that the plugin won't start, check if an Explorer window is open.

If an Explorer window is open to the sketch folder, it has the same name as the sketch so it won't start. If that
happens, delete from the cell and try again.

##### Other issues

If other problems occur please write an [ticket] (https://github.com/keshrath/Timer/issues).



