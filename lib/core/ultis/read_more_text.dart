import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as html_parser;

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLength;
  final TextStyle style;

  const ReadMoreText({
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

  String _plainText(String htmlString) {
    final document = html_parser.parse(htmlString);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final String fullText = widget.text;
    final String plainText = _plainText(fullText);

    // Nếu nội dung ngắn hơn hoặc bằng maxLength, hiển thị toàn bộ HTML
    // Nếu ngắn hơn maxLength -> render toàn bộ HTML
    if (plainText.length <= widget.maxLength) {
      return Html(
        data: fullText,
        style: {
          "body": Style.fromTextStyle(widget.style),
        },
      );
    }

    // Nếu nội dung dài hơn maxLength
    final String truncatedText =
        plainText.substring(0, widget.maxLength) + '...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Html(
          data: _isExpanded ? fullText : truncatedText,
          style: {
            "body": Style.fromTextStyle(widget.style),
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded; // Thay đổi trạng thái
            });
          },
          child: Text(
            _isExpanded ? 'Thu gọn' : 'Xem thêm',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: widget.style.fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
