# Timer

Timer is a Processing application to render a custom countdown. The countdown 
can be either till a certain date or a given amount of milliseconds. There are
multiple controls to change the look of the timer. The controls window can be
opened by pressing the 'c' key.

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

### Date formats (PControls)

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

* [Java JDK 8] (http://www.oracle.com/technetwork/java/javase/downloads/index.html) or later
* [Processing 3] (https://processing.org/) or later

### Troubleshooting

If problems occur please write an [ticket] (https://github.com/keshrath/Timer/issues).