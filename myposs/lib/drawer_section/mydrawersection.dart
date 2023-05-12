import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myposs/home_page.dart';
import 'package:myposs/login_page/log_in_page.dart';

class MyDrawerSection extends StatefulWidget {
  const MyDrawerSection({
    super.key,
  });

  @override
  State<MyDrawerSection> createState() => _MyDrawerSectionState();
}

class _MyDrawerSectionState extends State<MyDrawerSection> {
  bool isClick = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 190.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 7, 125, 180),
                // image: DecorationImage(
                //     image: AssetImage("assets/dwr.jpg"), fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    "Admin",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 209, 233, 240)),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_alarm,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "http://mother.expressretailbd.com",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white60),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 5.0),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              height: 45.0,
              width: double.infinity,
              // color: isClick == false ? Colors.black : Colors.blue,
              padding: EdgeInsets.only(top: 14.0, left: 15.0),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 7, 125, 180),
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      child: Container(
                        height: 150.0,
                        width: double.infinity,
                        padding:
                            EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 10.0),
                              child: Text(
                                "Logout...!",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.0),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 10.0),
                              child: Text(
                                "Are You Sure Went To Log Out?",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0),
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => LogInPage()));
                                  },
                                  child: Container(
                                    height: 40.0,
                                    width: 65.0,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 55, 209, 176),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                        child: Text(
                                      "YES",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                    )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: 40.0,
                                    width: 65.0,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 55, 209, 176),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                        child: Text(
                                      "NO",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0),
                                    )),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: 45.0,
              width: double.infinity,
              // color: Color.fromARGB(255, 224, 221, 221),
              padding: EdgeInsets.only(top: 14.0, left: 15.0),
              child: Text(
                "Sign out",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 7, 125, 180),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
