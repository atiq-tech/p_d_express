import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ui_design/add_newPpages/add_new_project.dart';
import 'package:my_ui_design/add_newPpages/project_details_page.dart';
import 'package:my_ui_design/all_pages/roated_page2.dart';
import 'package:my_ui_design/screen/pageviewdemo_navbar.dart';
import 'package:my_ui_design/widgets/const.dart';
import 'package:my_ui_design/widgets/my_list.dart';

class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color(0xff5E5E5),
      body: Stack(
        children: [
          Positioned(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 25, 16, 0.0),
                  margin: EdgeInsets.only(bottom: 32),
                  height: 60,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://scontent.fdac14-1.fna.fbcdn.net/v/t39.30808-6/293548141_1496767507405470_8557744850596832448_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeFr4UrH4myXl5Fayaz_q-oOhTPv_YUBmneFM-_9hQGad8JXqBpZ0Nsy1LPU3AaxS_ZYdtZznD9z11skvt91ogVU&_nc_ohc=O3A0VQD_jJsAX_e4Rtz&_nc_ht=scontent.fdac14-1.fna&oh=00_AfAW3RDmEySN37nVWGvDK1XS9LqVlluoWx3tYP9vyekKjQ&oe=6361C020"),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Atiq Team",
                        style: myStyle(16, Colors.grey),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Project Task",
                    style: myStyle(16, Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, top: 16, bottom: 16),
                  height: 62,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(top: 8.0),
                          margin: EdgeInsets.only(right: 12),
                          width: 130,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: cardColor,
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: 5,
                                color: Color.fromARGB(255, 2, 163, 42),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "5",
                                      style: myStyle(22, Colors.white),
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Under",
                                          style: myStyle(16, Colors.grey),
                                        ),
                                        Text(
                                          "Review",
                                          style: myStyle(16, Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Task",
                        style: myStyle(16, Colors.grey),
                      ),
                      Text(
                        "See All",
                        style: myStyle(16, Colors.grey),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(16),
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: cardColor),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.check_box_rounded,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 10,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${myList[index].title}",
                                        style: myStyle(16, Colors.white),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: myList[index].color,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        child: Text(
                                          "${myList[index].taskName}",
                                          style: myStyle(14, Colors.black,
                                              FontWeight.w400),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: 5,
                                              decoration: BoxDecoration(
                                                color: myList[index]
                                                    .color
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                            LayoutBuilder(builder:
                                                (context, constraints) {
                                              return Container(
                                                height: 5,
                                                width: constraints.maxWidth *
                                                    myList[index].percentage /
                                                    100,
                                                decoration: BoxDecoration(
                                                  color: myList[index].color,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "5/10",
                                        style: myStyle(16, Colors.white),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        maxRadius: 8,
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "5/10",
                                        style: myStyle(16, Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })
              ],
            ),
          )),
          Positioned(
            top: 200.0,
            left: 15.0,
            child: Container(
              height: 480,
              width: 362,
              decoration: BoxDecoration(
                  color: Color(0XFF191A22),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xff8E8E93),
                    radius: 80.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Congratulations!",
                    style: myStyle(24, Color(0xffF8F8F8), FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Parto team was created successfully,\ncreate your latest project so you can work\nwith your team.",
                    style: myStyle(16, Color(0xffE9E9EB), FontWeight.w400),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomeButton(
                    title: "Next",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProjectDetailsPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
