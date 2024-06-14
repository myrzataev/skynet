import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashedLineVerticalPainter extends CustomPainter {
  final bool isCompleted;

  DashedLineVerticalPainter({required this.isCompleted});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = isCompleted ? const Color(0xff77C229) : const Color(0xffCDCDCD)
      ..strokeWidth = isCompleted ? 3.w : 2.w;

    var max = size.height;
    var dashWidth = 4.w;
    var dashSpace = 2;
    double startY = -5;
    while (startY < max) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
