import 'package:flutter/material.dart';
import 'package:probability_tutor/Conditional_Probability/conditional_probability_template.dart';
import 'package:probability_tutor/Conditional_Probability/cp_home.dart';
import 'package:probability_tutor/colours.dart';
import 'package:probability_tutor/font_style/title_caption.dart';

class Conditional_Probability_Condition_Event extends StatefulWidget {
  @override
  _Conditional_Probability_Condition_Event createState() =>
      _Conditional_Probability_Condition_Event();
}

class _Conditional_Probability_Condition_Event
    extends State<Conditional_Probability_Condition_Event> {
  bool _E = false;
  bool _F = false;
  bool _G = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Conditional_Probability_Template(
        content: Column(
          children: [
            Title_Caption(
              caption: "select the condition event",
              captionColour: darkBlue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("hint: P(X | "),
                Text(
                  "Y",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.apply(color: Colors.orange, fontWeightDelta: 2),
                ),
                Text(")"),
              ],
            ),
            SizedBox(height: 10),
            Container(
              constraints: BoxConstraints(maxWidth: 100),
              child: Column(
                children: [
                  CheckboxListTile(
                    title: Text("E"),
                    checkColor: offWhite,
                    activeColor: Colors.orange,
                    checkboxShape: CircleBorder(),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _E,
                    onChanged: (bool? value) {
                      setState(() {
                        _E = value!;
                        _F = false;
                        _G = false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text("F"),
                    checkColor: offWhite,
                    activeColor: Colors.orange,
                    checkboxShape: CircleBorder(),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _F,
                    onChanged: (bool? value) {
                      setState(() {
                        _E = false;
                        _F = value!;
                        _G = false;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text("G"),
                    checkColor: offWhite,
                    activeColor: Colors.orange,
                    checkboxShape: CircleBorder(),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _G,
                    onChanged: (bool? value) {
                      setState(() {
                        _E = false;
                        _F = false;
                        _G = value!;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        onPress: () {},
      );
    });
  }
}
