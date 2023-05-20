import 'package:flutter/material.dart';

class PowerBadge extends StatelessWidget {
  final String text;
  final Color color;
  const PowerBadge({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      margin: EdgeInsets.symmetric(vertical: 3.0),
      child: Text(
        "$text",
        style: TextStyle(
            color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
