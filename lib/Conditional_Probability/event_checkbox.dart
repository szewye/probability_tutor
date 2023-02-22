import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

class EventCheckBox extends StatefulWidget {
  EventCheckBox({
    Key? key,
    required this.id,
    required this.selection,
    required this.onSelected,
    required this.page,
    required this.value,
    this.tickColour = offWhite,
    this.circleColour = orangyRed,
  }) : super(key: key);

  final int id;
  final int? selection;
  final Function(int? id) onSelected;
  final Widget page;
  final String value;
  final Color tickColour;
  final Color circleColour;

  @override
  State<EventCheckBox> createState() => _EventCheckBox();
}

class _EventCheckBox extends State<EventCheckBox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.value),
      checkColor: widget.tickColour,
      activeColor: widget.circleColour,
      checkboxShape: CircleBorder(),
      controlAffinity: ListTileControlAffinity.leading,
      value: widget.selection == widget.id,
      onChanged: (bool? value) {
        widget.onSelected(widget.id);
        navigate();
      },
    );
  }

  void navigate() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget.page));
  }
}
