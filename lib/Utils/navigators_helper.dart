import 'package:flutter/material.dart';

import '../Views/complete_screen.dart';

class TNavigators {
  static navigateToCompleteView(
      {required BuildContext context,
      required String title,
      required String description}) {
    final route = MaterialPageRoute(
        builder: (context) => CompleteView(
              title: title,
              description: description,
            ));
    Navigator.push(context, route);
  }
}
