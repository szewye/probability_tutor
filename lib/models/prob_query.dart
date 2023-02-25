import 'package:probability_tutor/models/event.dart';

class ProbQuery {
  Event? mainEvent;
  Event? conditionEvent;

  List<String?> sampleSpace; // Whole sample space

  ProbQuery({required this.sampleSpace, this.mainEvent, this.conditionEvent});

  // Sub sample space for the main event
  // Return list of all sub sample space for the main event
  List<String?> mainSubSampleSpace({List<String?>? space}) {
    if (mainEvent != null) {
      if (space != null) {
        return space
            .where((String? sample) => mainEvent!.isIn(sample))
            .toList();
      } else {
        return sampleSpace
            .where((String? sample) => mainEvent!.isIn(sample))
            .toList();
      }
    }

    return [];
  }

  // Sub sample space for the condition event
  // Return list of all sub sample space for the condition event
  List<String?> conditionSubSampleSpace({List<String?>? space}) {
    if (mainEvent != null) {
      if (space != null) {
        return space
            .where((String? sample) => conditionEvent!.isIn(sample))
            .toList();
      } else {
        return sampleSpace
            .where((String? sample) => conditionEvent!.isIn(sample))
            .toList();
      }
    }

    return [];
  }
}
