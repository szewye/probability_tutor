import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/Monty_Hall_Problem/dropdown_selection.dart';

void main() {
  // To test the dropdown widget
  testWidgets('DropDown selection: ', (WidgetTester tester) async {
    final items = ['keep', 'change']
        .map((String value) =>
            DropdownMenuItem(value: value, child: Text(value)))
        .toList();

    String? selectedValue = 'keep';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DropDown<String>(
            items: items,
            value: 'keep',
            onPress: (String? new_value) {
              selectedValue = new_value;
            },
          ),
        ),
      ),
    );

    // Ensure the dropdown button and its default value are shown
    expect(find.byType(DropDown<String>), findsOneWidget);
    expect(find.text('keep'), findsOneWidget);

    // Tap the dropdown button and ensure the dropdown list is shown
    await tester.tap(find.byType(DropDown<String>), warnIfMissed: false);
    await tester.pumpAndSettle();

    // There should be a list of options from the dropdown
    expect(find.byType(ListView), findsOneWidget);

    // Tap the second option and ensure it is selected
    await tester.tap(find.text('change').last, warnIfMissed: false);
    await tester.pumpAndSettle();

    expect(find.text('change').last, findsOneWidget);
    expect(find.byType(DropDown<String>), findsOneWidget);
    expect(selectedValue, 'change');
  });
}
