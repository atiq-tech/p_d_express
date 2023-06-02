import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Stream<QuerySnapshot> _galleryStrem =
      FirebaseFirestore.instance.collection("blog").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 232, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 201, 251, 255),
        title: Text(
          "Gallery Page",
          style: TextStyle(
              letterSpacing: 5.0,
              color: Color.fromARGB(255, 2, 90, 64),
              fontWeight: FontWeight.w600,
              fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _galleryStrem,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something is wrong bro");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return Container(
              height: 400,
              padding: EdgeInsets.all(15),
              child: ClipRRect(
                child: Image.network(
                  data["img"],
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
            );
          }).toList());
        },
      ),
    );
  }
}
