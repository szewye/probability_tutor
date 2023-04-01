import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/models/conditional_probability/event.dart';

void main() {
  group('Event: ', () {
    // To test if isIn() function works and return true or false given a sample space
    test('Correctly identify samples in the event: ', () {
      final event = Event(
        id: 'event_one',
        isIn: (sample) => sample?.startsWith('A') ?? false,
      );

      expect(event.isIn('AAA'), isTrue);
      expect(event.isIn('AAB'), isTrue);
      expect(event.isIn('ABB'), isTrue);

      expect(event.isIn('BCD'), isFalse);
      expect(event.isIn('GHI'), isFalse);
      expect(event.isIn(null), isFalse);
    });

    // To check if two events is unique even with the same id
    test('Unique identifier: ', () {
      final event_one = Event(
        id: 'event_one',
        isIn: (sample) => sample?.startsWith('A') ?? false,
      );
      final event_two = Event(
        id: 'event_one',
        isIn: (sample) => sample?.endsWith('Z') ?? false,
      );

      expect(event_one, isNot(event_two));
    });
  });
}
