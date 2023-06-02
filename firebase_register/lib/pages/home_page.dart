import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_register/blog/details_page.dart';
import 'package:firebase_register/blog/gallery_page.dart';
import 'package:firebase_register/blog/popular_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myPages = [DetailsPage(), GalleryPage(), PopularPage()];
  int indexPages = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Home Page"),
      //   centerTitle: true,
      // ),
      body: myPages[indexPages],
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
        ],
        onTap: (index) {
          setState(() {
            indexPages = index;
          });
        },
      ),
    );
  }
}
