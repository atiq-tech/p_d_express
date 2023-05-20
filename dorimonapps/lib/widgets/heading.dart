import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  final Color color;
  const Heading({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Text(
        "$text",
        style: TextStyle(
            color: color, fontSize: 40.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
