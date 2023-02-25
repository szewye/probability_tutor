import 'package:probability_tutor/constants.dart';

int intersection(String? mainEvent, String? conditionEvent) {
  switch (mainEvent) {
    case "E":
      switch (conditionEvent) {
        case "E":
          var intersections = eSubSampleSpace.intersection(eSubSampleSpace);
          return intersections.length;
        case "F":
          var intersections = eSubSampleSpace.intersection(fSubSampleSpace);
          return intersections.length;
        case "G":
          var intersections = eSubSampleSpace.intersection(gSubSampleSpace);
          return intersections.length;
        default:
          return 0;
      }
    case "F":
      switch (conditionEvent) {
        case "E":
          var intersections = fSubSampleSpace.intersection(eSubSampleSpace);
          return intersections.length;
        case "F":
          var intersections = fSubSampleSpace.intersection(fSubSampleSpace);
          return intersections.length;
        case "G":
          var intersections = fSubSampleSpace.intersection(gSubSampleSpace);
          return intersections.length;
        default:
          return 0;
      }
    case "G":
      switch (conditionEvent) {
        case "E":
          var intersections = gSubSampleSpace.intersection(eSubSampleSpace);
          return intersections.length;
        case "F":
          var intersections = gSubSampleSpace.intersection(fSubSampleSpace);
          return intersections.length;
        case "G":
          var intersections = gSubSampleSpace.intersection(gSubSampleSpace);
          return intersections.length;
        default:
          return 0;
      }
    default:
      return 0;
  }
}

int numberOfSubSampleSpace(String? event) {
  switch (event) {
    case "E":
      return eSubSampleSpace.length;
    case "F":
      return fSubSampleSpace.length;
    case "G":
      return gSubSampleSpace.length;
    default:
      return 0;
  }
}
