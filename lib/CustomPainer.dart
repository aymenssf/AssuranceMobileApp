import 'dart:ui';

import 'package:flutter/material.dart';

class CardCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Color(0xFF004A93)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.47, size.height * 0.46);
    path.quadraticBezierTo(
        size.width * 0.90, size.height * 0.50, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}