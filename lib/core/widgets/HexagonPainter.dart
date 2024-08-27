import 'package:flutter/material.dart';

class HexagonPainter extends CustomPainter {
  final bool selected;

  HexagonPainter({required this.selected});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = selected ? Colors.green : Colors.black
      ..style = PaintingStyle.fill;

    final Path path = Path();
    final double width = size.width;
    final double height = size.height;
    path.moveTo(width * 0.5, 0);
    path.lineTo(width, height * 0.25);
    path.lineTo(width, height * 0.75);
    path.lineTo(width * 0.5, height);
    path.lineTo(0, height * 0.75);
    path.lineTo(0, height * 0.25);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
