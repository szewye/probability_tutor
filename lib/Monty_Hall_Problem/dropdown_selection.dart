import 'package:flutter/material.dart';
import 'package:probability_tutor/colours.dart';

// Dropdown box for the Monty Hall problem simulation part
// where users can select the number of game they want to see the system plays
// and which strategy to use
class DropDown<T> extends StatelessWidget {
  const DropDown({
    Key? key,
    required this.items,
    this.value,
    required this.onPress,
    required this.height,
    required this.width,
  }) : super(key: key);

  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onPress;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: offWhite,
          ),
          items: items,
          dropdownColor: darkBlue,
          onChanged: onPress,
        ),
      ),
    );
  }
}
