import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TravelPage2 extends StatelessWidget {
  const TravelPage2({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
          color: Colors.black,
          padding: EdgeInsets.only(top: 60),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 8, left: 15, right: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 18,
                      ),
                      Text("Back")
                    ],
                  ),
                ),
                Container(
                  width: 360,
                  height: 360,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/img5.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(25)),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 20,
                        top: 40,
                        bottom: 40,
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: 70,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 50,
                                  height: 55,
                                  margin: EdgeInsets.only(left: 8, right: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    image: DecorationImage(
                                        image: AssetImage("images/img2.jpg"),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                );
                              },
                              separatorBuilder: (_, index) =>
                                  SizedBox(height: 8),
                              itemCount: 6),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  "images/trav.jpg",
                                ),
                              )),
                        ),
                        Text(
                          "Italy",
                          style: TextStyle(
                              color: Color.fromARGB(255, 117, 110, 110),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "images/img6.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          "South Africa",
                          style: TextStyle(
                              color: Color.fromARGB(255, 117, 110, 110),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "images/img7.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          "Canada",
                          style: TextStyle(
                              color: Color.fromARGB(255, 117, 110, 110),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "images/img8.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Text(
                          "Amazoon",
                          style: TextStyle(
                              color: Color.fromARGB(255, 117, 110, 110),
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                  indent: 0,
                  endIndent: 0,
                  height: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mount Bromo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "⭐4.7(9k Views)",
                      style: TextStyle(
                          color: Color.fromARGB(255, 192, 180, 180),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 18,
                          color: Color.fromARGB(255, 153, 143, 143),
                        ),
                        Text(
                          "Italia",
                          style: TextStyle(
                              color: Color.fromARGB(255, 146, 137, 137),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 248, 123, 39),
                        ),
                        Text(
                          "Map Direction",
                          style: TextStyle(
                              color: Color.fromARGB(255, 243, 135, 46),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 255.0),
                  child: Text(
                    "Description",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "The name Bromo comes from the Javanese area  of the Brahma, the Hindu god of creation. Mount Bromo is the located in the middle of a plain called Sea of the Sand it",
                  style: TextStyle(
                      color: Color.fromARGB(255, 153, 144, 144),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 60,
                  width: 360,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 238, 230, 230),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Color.fromARGB(255, 207, 126, 5),
                                  width: 3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$890",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 216, 89, 5),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "/person",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 238, 176, 141),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 253, 250, 250),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
