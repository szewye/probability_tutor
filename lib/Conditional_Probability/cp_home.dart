import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_main_event.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Conditional_Probability_Home extends StatelessWidget {
  const Conditional_Probability_Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Conditional_Probability_Template(
        content: Title_Caption(
          caption: "Ready to proceed?",
        ),
        onPress: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Conditional_Probability_Main_Event()));
        },
      );
    });
  }
}
