import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Conditional_Probability/sample_space_button.dart';
import 'package:probability_tutor/colours.dart';

void main() {
  group("SampleSpaceButton: ", () {
    // To check the button's colour and text
    testWidgets('Button:', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
          home: SampleSpaceButton(
        text: 'TTT',
      )));

      expect(find.text('TTT'), findsOneWidget);
      final finder = find.widgetWithText(SampleSpaceButton, 'TTT');
      final widget = tester.widget<SampleSpaceButton>(finder);

      expect(widget.textColour, darkBlue);
    });

    // To test if the button works when on press with a dummy function
    testWidgets('On press: ', (WidgetTester tester) async {
      bool works = false;
      await tester.pumpWidget(MaterialApp(
          home: SampleSpaceButton(
        text: 'TTT',
        onPress: () {
          works = true;
        },
      )));

      await tester.tap(find.text('TTT'));
      await tester.pumpAndSettle();

      expect(works, true);
    });
  });
}
