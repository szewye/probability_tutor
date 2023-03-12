import 'package:flutter/material.dart';

// Navigation helper for the application (for smoother transitions)
Function(BuildContext, Widget) getNavigation({int duration = 300}) {
  return (context, page) => Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionDuration: Duration(milliseconds: duration),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
}
