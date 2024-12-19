import 'package:nms_app/core/values/app_theme_values.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  ButtonCustom({
    super.key,
    required this.title,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return // Khoảng cách giữa button và các widget khác
        ElevatedButton(
      onPressed: () => this.onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6), // Bo góc cho button
        ),
      ),
      child: Text(
        title,
        style:
            TextStyle(fontSize: AppSizeValues.FontSizeMedium, color: textColor),
      ),
    );
  }
}
