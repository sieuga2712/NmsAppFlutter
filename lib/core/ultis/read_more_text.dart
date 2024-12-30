import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLength;
  final TextStyle style;

  ReadMoreText({
    super.key,
    required this.text,
    this.maxLength = 100,
    required this.style,
  });

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool _isExpanded = false;

  String removeHtmlTags(String htmlString) {
    var document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }

  @override
  Widget build(BuildContext context) {
    String text = removeHtmlTags(widget.text);
    if (text.length <= widget.maxLength) {
      return Text(
        text,
        style: widget.style,
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: _isExpanded
          ? Text(text, style: widget.style)
          : Text(
              '${text.substring(0, widget.maxLength)}...',
              style: widget.style,
            ),
    );
  }
}
