import 'package:flutter_test/flutter_test.dart';
import 'package:probability_tutor/models/conditional_probability/event.dart';
import 'package:probability_tutor/models/conditional_probability/probability_query.dart';

void main() {
  group("ProbabilityQuery: ", () {
    test('mainSubSampleSpace returns correct sub sample space: ', () {
      // Set up a sample space and main event
      List<String?> sampleSpace = ['HH', 'HT', 'TT', 'TH'];
      Event mainEvent = Event(
        id: 'H',
        isIn: (String? sample) => sample != null && sample.startsWith('H'),
      );

      // Set up a prob query with the main event and sample space
      ProbQuery query =
          ProbQuery(sampleSpace: sampleSpace, mainEvent: mainEvent);

      // Test the sub sample space with a subset of the sample space
      List<String?> subset = ['HH', 'TT'];
      expect(query.mainSubSampleSpace(space: subset), ['HH']);

      // Test the sub sample space with the full sample space
      expect(query.mainSubSampleSpace(), ['HH', 'HT']);
    });

    test('conditionSubSampleSpace returns correct sub sample space: ', () {
      // Set up a sample space and condition event
      List<String?> sampleSpace = ['HH', 'HT', 'TT', 'TH'];
      Event conditionEvent = Event(
        id: 'T',
        isIn: (String? sample) => sample != null && sample.startsWith('T'),
      );

      // Set up a prob query with the condition event and sample space
      ProbQuery query =
          ProbQuery(sampleSpace: sampleSpace, conditionEvent: conditionEvent);

      // Test the sub sample space with a subset of the sample space
      List<String?> subset = ['HH', 'TT'];
      expect(query.conditionSubSampleSpace(space: subset), ['TT']);

      // Test the sub sample space with the full sample space
      expect(query.conditionSubSampleSpace(), ['TT', 'TH']);
    });
  });
}
