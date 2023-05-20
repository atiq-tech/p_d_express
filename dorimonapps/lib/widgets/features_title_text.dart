import 'package:flutter/material.dart';

class FeaturesTitleText extends StatelessWidget {
  final String text;
  const FeaturesTitleText({
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
            color: Color.fromARGB(255, 61, 60, 60),
            fontWeight: FontWeight.bold,
            fontSize: 19.0),
      ),
    );
  }
}
