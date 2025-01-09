import 'package:flutter/material.dart';

class OvalClipper extends CustomClipper<Path> {
  final double borderRadiusPercentage;

  OvalClipper({required this.borderRadiusPercentage});

  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radiusX = size.width / 2;
    final borderRadius = size.height * borderRadiusPercentage;
    final radiusY = size.height / 2 - borderRadius;

    path.addOval(Rect.fromCenter(
        center: center, width: radiusX * 2, height: radiusY * 2));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
