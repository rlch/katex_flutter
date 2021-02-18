library katex_flutter;

import 'package:catex/catex.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// The basic WebView for displaying the created HTML String
class KaTeX extends StatefulWidget {
  // a Text used for the rendered code as well as for the style
  final Text laTeXCode;

  // The delimiter to be used for inline LaTeX
  final String delimiter;

  // The delimiter to be used for Display (centered, "important") LaTeX
  final String displayDelimiter;

  KaTeX(
      {Key key,
      @required this.laTeXCode,
      this.delimiter = r'$',
      this.displayDelimiter = r'$$'});

  @override
  State<KaTeX> createState() => CaTeXState();
}

class CaTeXState extends State<KaTeX> {
  @override
  Widget build(BuildContext context) {
    // Fetching the Widget's LaTeX code as well as it's [TextStyle]
    final String laTeXCode = widget.laTeXCode.data;
    TextStyle defaultTextStyle = widget.laTeXCode.style;

    // Building [RegExp] to find any Math part of the LaTeX code by looking for the specified delimiters
    final String delimiter = widget.delimiter.replaceAll(r'$', r'\$');
    final String displayDelimiter =
        widget.displayDelimiter.replaceAll(r'$', r'\$');

    final String rawRegExp =
        '(($delimiter)([^$delimiter]*[^\\\\\\$delimiter])($delimiter)|($displayDelimiter)([^$displayDelimiter]*[^\\\\\\$displayDelimiter])($displayDelimiter))';
    List<RegExpMatch> matches =
        RegExp(rawRegExp, dotAll: true).allMatches(laTeXCode).toList();

    // If no single Math part found, returning the raw [Text] from widget.laTeXCode
    if (matches.isEmpty) return widget.laTeXCode;

    // Otherwise looping threw all matches and building a [RichText] from [TextSpan] and [WidgetSpan] widgets
    List<InlineSpan> textBlocks = List();
    int lastTextEnd = 0;

    matches.forEach((laTeXMatch) {
      // If there is an offset between the lat match (beginning of the [String] in first case), first adding the found [Text]
      if (laTeXMatch.start > lastTextEnd)
        textBlocks.add(
            TextSpan(text: laTeXCode.substring(lastTextEnd, laTeXMatch.start)));
      // Adding the [CaTeX] widget to the children
      if (laTeXMatch.group(3) != null)
        textBlocks.add(WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: CaTeX(laTeXMatch.group(3).trim())));
      else
        textBlocks.addAll([
          TextSpan(text: '\n'),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: DefaultTextStyle.merge(
                child: CaTeX(laTeXMatch.group(6).trim())),
            /*style: Theme.of(context).textTheme.headline4.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.bodyText1.fontSize * 2)*/
          ),
          TextSpan(text: '\n')
        ]);
      lastTextEnd = laTeXMatch.end;
    });

    // If there is any text left after the end of the last match, adding it to children
    if (lastTextEnd < laTeXCode.length) {
      textBlocks.add(TextSpan(text: laTeXCode.substring(lastTextEnd)));
    }

    // Returning a RichText containing all the [TextSpan] and [WidgetSpan] created previously while
    // obeying the specified style in widget.laTeXCode
    return Text.rich(TextSpan(
        children: textBlocks,
        style: (defaultTextStyle == null)
            ? Theme.of(context).textTheme.bodyText1
            : defaultTextStyle));
  }
}
