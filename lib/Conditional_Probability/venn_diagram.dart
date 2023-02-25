import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

class VennDiagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VennDiagramPainter(context: context),
      size: Size(300, 300),
    );
  }
}

class VennDiagramPainter extends CustomPainter {
  VennDiagramPainter({required this.context});

  BuildContext context;

  final Paint circlePaint1 = Paint()
    ..color = darkBlue
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  final Paint circlePaint2 = Paint()
    ..color = Colors.green
    ..strokeWidth = 1.5
    ..style = PaintingStyle.stroke;

  final Paint overlapPaint = Paint()
    ..color = orangyRed.withOpacity(0.8)
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = size.width / 6;
    double sRadius = size.width * 1.5 / 4;
    double xCenter1 = size.width / 2.35;
    double xCenter2 = size.width / 1.7;
    double yCenter = size.height / 1.7;

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
    // sample space s
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      sRadius,
      circlePaint1,
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

    // Text on S in the Venn diagram
    final textPainter = TextPainter(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyLarge,
        text: 'HAHA',
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: 100);

    textPainter.paint(canvas, Offset(size.width / 2.4, size.height / 4));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
