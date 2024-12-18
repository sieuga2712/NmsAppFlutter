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
    return ElevatedButton(
      onPressed: () => this.onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        title,
        style:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: textColor),
      ),
    );
  }
}
