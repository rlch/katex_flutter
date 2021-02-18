# katex\_flutter

Render scientific LaTeX equations using the KaTeX library.

- **Mathematics / Maths Equations** (Algebra, Calculus, Geometry, Geometry etc...)
- **Physics Equations**
- **Signal Processing Equations**
- **Chemistry Equations**
- **Statistics / Stats Equations**
- **Inherit text style from parent widgets**

*Note: The previously bad pub.dev score was due to a known error in the analysis server and not our fault.*

LaTeX rendering is done using **[CaTeX](https://pub.dev/packages/catex)** and using RichText.

**katex_flutter** is working on Android, iOS, the Web and the Desktop platform.

We are now using native Flutter widgets to render the LaTeX code. This significantly increases the rendering performance
compared to previous versions.

## API

**Note: we recently did significant API changes. Please update any prior code.**
```dart
KaTeX(
  @required laTeXCode,         // A Text() containing the LaTeX code to be rendered
  delimiter = r'$',            // The delimiter to be used for inline LaTeX
  displayDelimiter = r'$$',    // The delimiter to be used for Display (centered, "important") LaTeX
  );
```

## What's the difference to CaTeX library?

CaTeX is simply taking any input for Math rendering.
We split up into Text and Math parts. You can use a separator (eg. the common "$" or "$$").
Content between these separators is rendered as math while anything outside of these separators
is rendered as normal Flutter Text. This makes Text containing only some single formula parts much easier.

## Use this package as a library

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  katex_flutter: ^4.0.1
```
You can install packages from the command line with Flutter:

```shell
flutter pub get
```
Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

Now in your Dart code, you can use:

```dart
import 'package:katex_flutter/katex_flutter.dart';

...

// A static LaTeX block which may not change on `setState()`
return KaTeX(laTeXCode: Text("\\alpha", style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.red)))

// A dynamic LaTeX block which is rebuilt on `setState()` (less efficient but required sometimes)
return Builder(builder: (context) => KaTeX(laTeXCode: Text("\\alpha", style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.red))))
```

## Source code

The source code is hosted on [GitLab](https://gitlab.com/testapp-system/katex_flutter). It's licensed under the terms and conditions of the [`EUPL-1.2`](LICENSE).

This package was initially created for the education project **[TestApp](https://testapp.schule/)**.
