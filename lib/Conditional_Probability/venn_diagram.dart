import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';
import 'package:probability_tutor/models/prob_query.dart';

class VennDiagram extends StatelessWidget {
  final ProbQuery probQuery;

  const VennDiagram({super.key, required this.probQuery});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: VennDiagramPainter(context: context, probQuery: probQuery),
      size: Size(300, 300),
    );
  }
}

class VennDiagramPainter extends CustomPainter {
  VennDiagramPainter({required this.context, required this.probQuery});

  BuildContext context;
  ProbQuery probQuery;

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

    // main event circle
    canvas.drawCircle(
      Offset(xCenter1, yCenter),
      radius,
      circlePaint1,
    );
    // condition event circle
    canvas.drawCircle(
      Offset(xCenter2, yCenter),
      radius,
      circlePaint2,
    );
    // sample space s circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      sRadius,
      circlePaint1,
    );

    // Draw overlap for main and condition event
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

    // Text on coin sample sapce in the Venn diagram
    final sampleSpaceSPainter = textPainter(
        "${setToString(probQuery.sampleSpace, withDelimiter: true)}");

    // Text on main event sub sample sapce in the Venn diagram
    final mainEventPainter =
        textPainter("${setToString(probQuery.mainSubSampleSpace())}");

    // Text on condition event sub sample sapce in the Venn diagram
    final conditionEventPainter =
        textPainter("${setToString(probQuery.conditionSubSampleSpace())}");

    // Text on overlap sample sapce in the Venn diagram
    final overlapPainter = textPainter(
        "${setToString(probQuery.mainSubSampleSpace(space: probQuery.conditionSubSampleSpace()))}");

    sampleSpaceSPainter.layout(minWidth: 0, maxWidth: 120);
    mainEventPainter.layout(minWidth: 0, maxWidth: 80);
    conditionEventPainter.layout(minWidth: 0, maxWidth: 80);
    overlapPainter.layout(minWidth: 0, maxWidth: 80);

    sampleSpaceSPainter.paint(
        canvas, Offset(size.width / 3.2, size.height / 4.5));
    mainEventPainter.paint(canvas, Offset(size.width / 3.3, size.height / 2));
    conditionEventPainter.paint(
        canvas, Offset(size.width / 1.6, size.height / 2));
    overlapPainter.paint(canvas, Offset(size.width / 2.2, size.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  TextPainter textPainter(String content, {Color contentColor = darkBlue}) {
    return TextPainter(
      text: TextSpan(
        style:
            Theme.of(context).textTheme.bodySmall?.apply(color: contentColor),
        text: content,
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
  }

  String setToString(List<String?> lst, {bool withDelimiter = false}) {
    String str = "";
    for (int i = 0; i < lst.length; ++i) {
      String? element = lst[i];

      if (element != null) {
        str += element;

        if (i < lst.length - 1) {
          if (withDelimiter) {
            str += ", ";
          } else {
            str += "\n";
          }
        }
      }
    }

    return str;
  }
}
