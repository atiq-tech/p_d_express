import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('PageView'),
        ),
        body: Container(
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.purple,
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: Color.fromARGB(255, 7, 22, 238),
                  child: PageView(
                    children: [
                      PageViewWidgets(
                        color: Colors.black,
                        text: "Page One",
                      ),
                      PageViewWidgets(
                        color: Colors.green,
                        text: "Page Two",
                      ),
                      PageViewWidgets(
                        color: Colors.brown,
                        text: "Page Three",
                      ),
                      PageViewWidgets(
                        color: Colors.indigo,
                        text: "Page Four",
                      ),
                      PageViewWidgets(
                        color: Colors.teal,
                        text: "Page Five",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageViewWidgets extends StatelessWidget {
  PageViewWidgets({Key? key, required this.text, required this.color})
      : super(key: key);
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          "$text",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
