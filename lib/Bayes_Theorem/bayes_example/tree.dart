import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/bayes_tree.dart';
import 'package:probability_tutor/colours.dart';

// To draw out a binary tree
class BinaryTreePainter extends CustomPainter {
  final Node<String>? rootNode;
  final BuildContext context;

  BinaryTreePainter({this.rootNode, required this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = darkBlue; // colour for the line

    _drawNode(canvas, paint, rootNode, size.width / 2, 10, size.width / 4);
  }

  @override
  bool shouldRepaint(BinaryTreePainter oldDelegate) {
    return true;
  }

  // Draw tree nodes with data
  void _drawNode(Canvas canvas, Paint paint, Node<String>? node, double x,
      double y, double dx) {
    final textPainter = TextPainter(
      text: TextSpan(
        style:
            Theme.of(context).textTheme.bodyLarge?.apply(color: node?.colour),
        text: '${node?.value}',
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: 100);

    textPainter.paint(
        canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));

    if (node?.left != null) {
      final x2 = x - dx;
      final y2 = y + 60;
      canvas.drawLine(Offset(x, y + 15), Offset(x2, y2 - 15), paint);
      _drawNode(canvas, paint, node?.left, x2, y2, dx / 2);
    }

    if (node?.right != null) {
      final x2 = x + dx;
      final y2 = y + 60;
      canvas.drawLine(Offset(x, y + 15), Offset(x2, y2 - 15), paint);
      _drawNode(canvas, paint, node?.right, x2, y2, dx / 2);
    }
  }
}
