import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/model/travel_class.dart';
import 'package:practice_ui/widgets/travel_page2.dart';

class TravelPage1 extends StatefulWidget {
  @override
  State<TravelPage1> createState() => _TravelPage1State();
}

class _TravelPage1State extends State<TravelPage1> {
  final AllData = Traveldata.generatedMySourecList();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 254),
      body: Container(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              //first content
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      "https://scontent.fdac14-1.fna.fbcdn.net/v/t39.30808-6/293548141_1496767507405470_8557744850596832448_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFr4UrH4myXl5Fayaz_q-oOhTPv_YUBmneFM-_9hQGad8JXqBpZ0Nsy1LPU3AaxS_ZYdtZznD9z11skvt91ogVU&_nc_ohc=8vf1mclLE6cAX8ZFcNR&_nc_ht=scontent.fdac14-1.fna&oh=00_AfAyujyRLFavXcTzmxkdKvGIIuqL6OITIsYx7acm0MAUnw&oe=6365B4A0"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back 🤚",
                      style: TextStyle(
                          color: Color.fromARGB(255, 112, 105, 105),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Ronald Richards   ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 180, 89, 56),
                  radius: 25,
                  child: Icon(Icons.notifications),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 211, 244, 245),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.tune),
                border: OutlineInputBorder(),
                hintText: 'Discover a City',
                hintStyle: TextStyle(
                    color: Color.fromARGB(255, 161, 156, 156),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (AllData[index].isClick == false) {
                            AllData[index].isClick = true;
                          } else {
                            AllData[index].isClick = false;
                          }
                        });
                      },
                      child: Container(
                        width: 160,
                        decoration: BoxDecoration(
                          color: AllData[index].isClick == true
                              ? Color.fromARGB(255, 240, 131, 6)
                              : Color.fromARGB(255, 207, 201, 201),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                // height: 100,
                                // width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("${AllData[index].img}"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${AllData[index].company}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(
                        width: 15,
                      ),
                  itemCount: 5),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Explore Cities",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (AllData[index].isClick == false) {
                            AllData[index].isClick = true;
                          } else {
                            AllData[index].isClick = false;
                          }
                        });
                      },
                      child: Container(
                          child: Text(
                        "${AllData[index].company}",
                        style: TextStyle(
                            color: AllData[index].isClick == false
                                ? Color.fromARGB(255, 170, 162, 162)
                                : Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(
                        width: 15,
                      ),
                  itemCount: 5),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 8,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                      width: 200,
                      padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: Offset(0, 10),
                                      blurRadius: 10,
                                    ),
                                  ],
                                  image: DecorationImage(
                                      image: AssetImage(AllData[index].img),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (AllData[index].isClick == false) {
                                            AllData[index].isClick = true;
                                          } else {
                                            AllData[index].isClick = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 175, 95, 2),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Icon(
                                          Icons.favorite,
                                          color: AllData[index].isClick == true
                                              ? Color.fromARGB(255, 241, 4, 4)
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Mount Bromo",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        Text(
                                          "⭐4.9",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 192, 180, 180),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 16,
                                              color: Color.fromARGB(
                                                  255, 153, 143, 143),
                                            ),
                                            Text(
                                              "Thailand",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 146, 137, 137),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$890",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 216, 89, 5),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "/person",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 238, 176, 141),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ));
                },
                separatorBuilder: (_, index) => SizedBox(
                  width: 15,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Popular Categories",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
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
                      "England",
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
                                "images/img7.jpg",
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
                      "Flights",
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TravelPage2()));
              },
              child: Container(
                height: 80,
                width: double.infinity,
                padding: EdgeInsets.only(right: 15, left: 15),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 197, 149, 149),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Icon(
                      Icons.location_history,
                      size: 30,
                    ),
                    Icon(
                      Icons.apps,
                      size: 30,
                    ),
                    Icon(
                      Icons.favorite,
                      size: 30,
                    ),
                    Icon(
                      Icons.person,
                      size: 30,
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








// Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding:
//                               const EdgeInsets.only(left: 150, right: 10.0),
//                           child: InkWell(
//                             onTap: () {
                            //  setState(() {
                            //    if (AllData[index].isClick == false) {
                            //    AllData[index].isClick = true;                               } else {
                            //      AllData[index].isClick = false;                               }
                            // });                           },
//                             child: Icon(
//                               Icons.favorite,
//                               size: 30,
//                               color: AllData[index].isClick == true
//                                   ? Color.fromARGB(255, 241, 4, 4)
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10.0, right: 10),
//                           child: Image.asset(
//                             "${AllData[index].img}",
//                             width: 250,
//                             height: 80,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "${AllData[index].company}",
//                           style: TextStyle(
//                               color: Color.fromARGB(255, 5, 5, 5),
//                               fontSize: 20,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("${AllData[index].title}",
//                                 style: TextStyle(
//                                     color: Color.fromARGB(255, 70, 66, 66),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w500)),
//                           ],
//                         ),
//                         Text("${AllData[index].price}",
//                             style: TextStyle(
//                                 color: Color.fromARGB(255, 24, 182, 3),
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w600)),
//                       ],
//                     ),
