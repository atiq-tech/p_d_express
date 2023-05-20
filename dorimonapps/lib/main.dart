import 'package:dorimonapps/pages/details_page.dart';
import 'package:flutter/material.dart';

import 'pages/home_pages.dart';
import 'widgets/nobel_card.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dorimon App',
      home: HomePage(),
    );
  }
}
