import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

class VennDiagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VennDiagramPainter(),
      size: Size(300, 300),
    );
  }
}

class VennDiagramPainter extends CustomPainter {
  final Paint circlePaint1 = Paint()
    ..color = darkBlue
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  final Paint circlePaint2 = Paint()
    ..color = Colors.blue
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  final Paint overlapPaint = Paint()
    ..color = orangyRed.withOpacity(0.2)
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 4;
    double xCenter1 = size.width / 4;
    double xCenter2 = size.width * 2.2 / 4;
    double yCenter = size.height / 2;

    // Draw circles
    canvas.drawCircle(
      Offset(xCenter1, yCenter),
      radius,
      circlePaint1,
    );
    canvas.drawCircle(
      Offset(xCenter2, yCenter),
      radius,
      circlePaint2,
    );

    // Draw overlap
    Path overlapPath = Path.combine(
      PathOperation.intersect,
      Path()
        ..addOval(
            Rect.fromCircle(center: Offset(xCenter1, yCenter), radius: radius)),
      Path()
        ..addOval(
            Rect.fromCircle(center: Offset(xCenter2, yCenter), radius: radius)),
    );
    canvas.drawPath(overlapPath, overlapPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
