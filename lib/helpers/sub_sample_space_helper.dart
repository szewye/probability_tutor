import 'package:probability_tutor/constants.dart';

// check if user sleected the right sub sample for the event they chose previously
bool rightSample(String sample, String eventChosen) {
  switch (eventChosen) {
    case "E":
      return sample.contains("HH");
    case "F":
      return sample.startsWith("H");
    case "G":
      return sample.startsWith("T");
    default:
      return false;
  }
}

// check if user finished selecting all sub sample space
bool completeSubSampleSpace(Set<String> sampleSpace, String eventChosen) {
  switch (eventChosen) {
    case "E":
      return sampleSpace.containsAll(eSubSampleSpace);
    case "F":
      return sampleSpace.containsAll(fSubSampleSpace);
    case "G":
      return sampleSpace.containsAll(gSubSampleSpace);
    default:
      return false;
  }
}
