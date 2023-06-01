import 'package:flutter/material.dart';

class Containerbox extends StatelessWidget {
  final Color color;
  final Widget childwidget;
  const Containerbox({Key? key, required this.color, required this.childwidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childwidget,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
    );
  }
}
