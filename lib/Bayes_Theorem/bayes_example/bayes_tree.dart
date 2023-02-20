import 'package:flutter/material.dart';
import 'package:probability_tutor/Bayes_Theorem/bayes_example/tree.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/constants.dart';

class Node<T> {
  T value;
  Node<T>? left, right;
  Color colour;

  Node(this.value, {this.left, this.right, this.colour = darkBlue});
}

class BinaryTreeView extends StatefulWidget {
  @override
  _BinaryTreeViewState createState() => _BinaryTreeViewState();
}

class _BinaryTreeViewState extends State<BinaryTreeView> {
  Node<String> binaryTree = Node(
    "",
    left: Node(
      DValue,
      colour: Colors.blue,
      left: Node(TDValue, colour: Colors.red),
      right: Node(notTDValue),
    ),
    right: Node(
      notDValue,
      colour: Colors.teal,
      left: Node(TNotDValue, colour: Colors.purple),
      right: Node(notTNotDValue, colour: Colors.green),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 300),
      height: 150,
      child: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: BinaryTreePainter(rootNode: binaryTree, context: context),
        ),
      ),
    );
  }
}
