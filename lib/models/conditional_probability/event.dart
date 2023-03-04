class Event {
  // Identifier for events
  String id;

  // Determine if a sample is part of the event
  bool Function(String? sample) isIn;

  Event({required this.id, required this.isIn});
}
