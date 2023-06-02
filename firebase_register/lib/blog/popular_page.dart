import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({super.key});

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  Stream<QuerySnapshot> _popularContent =
      FirebaseFirestore.instance.collection("blog").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 243, 252),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 248, 250, 222),
        title: Text(
          "Popular Page",
          style: TextStyle(
              letterSpacing: 5.0,
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: _popularContent,
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
              height: 600,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              child: Text(
                            data["title"][0],
                          )),
                          Container(
                            child: Text(
                              data["title"],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 156, 2, 143),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25),
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: ClipRRect(
                                  child: Image.network(data["img"],
                                      fit: BoxFit.cover,
                                      width: MediaQuery.of(context).size.width),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(top: 30.0),
                                      child: Center(
                                        child: Text(
                                          data["descrip"],
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 104, 2, 129),
                                              fontWeight: FontWeight.w900,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        data["des"],
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 15, 1, 48),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }).toList());
        },
      ),
    );
  }
}
