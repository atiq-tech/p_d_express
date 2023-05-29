import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: Color.fromARGB(255, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "facebook",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color.fromARGB(255, 51, 49, 49),
                      child: Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color.fromARGB(255, 53, 51, 51),
                      child: Icon(
                        Icons.search,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color.fromARGB(255, 53, 51, 51),
                      child: Icon(
                        Icons.add,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 80.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                  width: double.infinity,
                  height: 60.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Color.fromARGB(255, 53, 51, 51),
                        child: Icon(
                          Icons.home,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Color.fromARGB(255, 53, 51, 51),
                        child: Icon(
                          Icons.groups,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Color.fromARGB(255, 53, 51, 51),
                        child: Icon(
                          Icons.photo_camera,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Color.fromARGB(255, 53, 51, 51),
                        child: Icon(
                          Icons.person,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Color.fromARGB(255, 53, 51, 51),
                        child: Icon(
                          Icons.apps,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            image: DecorationImage(
                              image: AssetImage("assets/profilemy.jpg"),
                            )),
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: 140.0,
              left: 0.0,
              right: 0.0,
              child: Divider(
                thickness: 3,
                height: 5.0,
                color: Color.fromARGB(255, 255, 3, 255),
              ),
            ),
            Positioned(
              top: 144.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: Color.fromARGB(255, 2, 2, 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          image: DecorationImage(
                            image: AssetImage("assets/profilemy.jpg"),
                          )),
                    ),
                    Container(
                      width: 310.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: Color.fromARGB(255, 44, 42, 42),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 15.0),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              hintText: "What's on your mind?"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 205.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                width: double.infinity,
                height: 240.0,
                color: Color.fromARGB(255, 54, 58, 56),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 150.0,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/profilemy.jpg"),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 10.0),
                      child: Container(
                        width: 150.0,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/profilemy.jpg"),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 10.0),
                      child: Container(
                        width: 150.0,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/profilemy.jpg"),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 10.0),
                      child: Container(
                        width: 150.0,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/profilemy.jpg"),
                            )),
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
  }
}
