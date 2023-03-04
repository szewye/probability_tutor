import 'package:probability_tutor/models/conditional_probability/event.dart';

const double buttonsDistance = 45;
const double mainPageRoundedButton = 20;

// Set page margin/padding
const double pagePadding = 50;
const double pageConstraint = 1200;

// Bayes' theorem part constants
const String bayesExampleContext =
    "Suppose that 1 person in 100 000 has a particular rare disease for which there is a quite accurate diagnostic test: \n • It is correct 99% of the time when given to someone with the disease. \n • It is correct 99.5% of the time when given to someone who does not have the disease. \n\n What is the probability that someone who tests positive for the disease actually has the disease?";

const String DFirstHalf = 'Let D be the event of be the event that a person ';
const String DSecondHalf = 'has the disease';
const String TFirstHalf = 'Let T be the event that a person ';
const String TSecondHalf = 'tests positive for the disease';

const String pOfDGivenT = "P (D | T)";
const String pOfTGivenD = "P (T | D)";
const String pOfD = "P(D)";
const String pOfTGivenNotD = "P(T | ¬D)";
const String pOfNotD = "P(¬D)";
const String pOfNotTGivenNotD = "P(¬T | ¬D)";

const String DTValue = "0.00198";
const String TDValue = "0.99";
const String notTDValue = "0.01";
const String DValue = "0.00001";
const String TNotDValue = "0.005";
const String notDValue = "0.99999";
const String notTNotDValue = "0.995";

// Coin conditional probability part constants
const String conditionalProbabilityContext =
    "We flip a fair coin 3 times. A couple of events can be observed through this:";

const String EFirstHalf = "Let E be the event of that ";
const String ESecondHalf = "at least 2 heads come up in a row";
const String FFirstHalf = "Let F be the event of ";
const String FSecondHalf = "the first flip comes up heads";
const String GFirstHalf = "Let G be the event of ";
const String GSecondHalf = "the first flip comes up tails";

final List<String> coinsSampleSpace = [
  "HHH",
  "HHT",
  "HTT",
  "HTH",
  "TTT",
  "TTH",
  "THH",
  "THT"
];

Event E =
    Event(id: "E", isIn: (String? sample) => sample?.contains("HH") ?? false);
Event F =
    Event(id: "F", isIn: (String? sample) => sample?.startsWith("H") ?? false);
Event G =
    Event(id: "G", isIn: (String? sample) => sample?.startsWith("T") ?? false);
