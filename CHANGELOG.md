## 4.0.2+26 - Fixed escape of delimiters

 * You may now escape your specified delimiter by `\$delimiter`: Delimiter: $ `$x^2 + \$ \cdot $`

## 4.0.1+25 - Improved rendering of inline LaTeX

 * Moved from Wrap to RichText to provide better text rendering
 * Removed deprecated JS compatibility

## 4.0.0+24 - Moved to native Dart rendering instead of using JavaScipt

 * Moved all internal calls to the CaTeX library instead of JavaScipt
 * Increased rendering performance

## 3.3.0+23 - Stabilized Desktop support

 * Improved integration with `texlive` and `ImageMagick`

## 3.2.0+21 - Added custom font families

 * Inheriting text style from parent element / parenting build context

## 3.1.0+20 - Removed requirement for assets on Android and the web

 * You no longer need to copy the original KaTeX JS library into your app as it is now integrated into the package.

## 3.0.1+19 - Fixed Windows %TEMP% location

 * Fixed the temporary file's location on Windows

## 3.0.0+17 - Initial Desktop support

 * Support Fuchsia, macOS, Windows and Linux
 * Still requires local [TeX Live](https://www.tug.org/texlive/) and [ImageMagick](https://imagemagick.org/index.php) installation
 * Support for go-flutter

## 2.4.0+16 - Added offline support

 * Support for rendering equations offline on Android and the web
 * Support for custom delimiters on the web

## 2.3.0+14 - Implemented automatic width for web platform

 * Implemented automatic width for the web platform

## 2.2.0+12 - Fixed overflow on web platform

 * The compution ot the required width is now no longer limited to 200px (the initial width)

## 2.1.0+10 - Working dynamic boundaries on web platform

 * The web platform can now compute the Widget's width and height on it's own. No more need for `SizedBox` wrap.
 * Added dynamic generation of the required JavaScript code. Please update your `web/index.html` according to [README.md] and run `flutter pub run katex_flutter:main`

## 2.0.2+8 - Fixed equations displayed twice

 * Fixed some equations rendered twice due to inpropper MathML compatibility

## 2.0.1+7 - Fixed rendering of several equations

 * Fixed issues when using several different KaTeX-Widgets on web platform

## 2.0.0+6 - Support for web and mobile alongside

 * Separated mobile and web code
 * Updating the LaTeX code is not possible yet on mobile platforms
 * Automatic size and colors are not supported yet on web

## 1.1.1+5 - First support for web platforms

* Stable support for Android and iOS
* Experimental support for web platform. Auto-sizing the Widget is not supported yet on web.

## 0.0.1 - Initial release

* Not working yet. Just for testing.
