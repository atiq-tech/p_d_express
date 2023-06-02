import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Stream<QuerySnapshot> _detailsStrem =
      FirebaseFirestore.instance.collection("blog").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 229, 248),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 183, 176, 248),
        title: Text(
          "Details Page",
          style: TextStyle(
              color: Color.fromARGB(255, 2, 90, 64),
              fontWeight: FontWeight.w600,
              fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _detailsStrem,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print("Something is wrong bro");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Container(
                height: 280,
                padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                child: Card(
                  color: Color.fromARGB(255, 250, 220, 243),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: ClipRRect(
                              child: Image.network(data["img"],
                                  fit: BoxFit.cover,
                                  height: MediaQuery.of(context).size.height),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 215, 250, 247),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Center(
                                  child: Text(
                                    data["title"],
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 4, 44, 175),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                data["descrip"],
                                style: TextStyle(
                                    color: Color.fromARGB(255, 189, 4, 142),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  data["des"],
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 41, 3, 129),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                  maxLines: 6,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  customDialog(data["img"], data["title"],
                                      data["des"], data["descrip"]);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(20),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 155, 5),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Text(
                                      "Show Details",
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  customDialog(String img, String title, String des, String descrip) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white, width: 4),
                borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: ClipRRect(
                        child: Image.network(img,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Center(
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Center(
                                  child: Text(
                                    descrip,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 161, 5, 148),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  des,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 46, 1, 46),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
