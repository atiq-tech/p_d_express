import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/widgets/travel_page1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/trav.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore Beauty\nOf Journey",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Everything you can imagine,is here",
              style: TextStyle(
                  color: Color.fromARGB(255, 46, 45, 45),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 450,
            ),
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.only(right: 70, left: 15),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TravelPage1()));
                      },
                      child: Container(
                        width: 50,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 22, 22, 22),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 10),
                                blurRadius: 10,
                              )
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 184, 175, 175),
                              size: 15,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 153, 147, 147),
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "Swipe to Explore Now",
                    style: TextStyle(
                        color: Color.fromARGB(255, 253, 252, 252),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
