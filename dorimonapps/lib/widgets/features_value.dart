import 'package:flutter/material.dart';

class FeaturesValueText extends StatelessWidget {
  final String text;
  const FeaturesValueText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        "$text",
        style: TextStyle(
            color: Color.fromARGB(255, 168, 166, 166),
            fontWeight: FontWeight.bold,
            fontSize: 16.0),
      ),
    );
  }
}
