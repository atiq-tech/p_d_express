import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/add_newPpages/add_new_project.dart';
import 'package:my_ui_design/widgets/const.dart';

class ProjectDetailsPage extends StatelessWidget {
  const ProjectDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: Color(0xff5E5E5),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddNewProject()));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Color(0xffFFFFFF),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Text(
                    "Project Details",
                    style: myStyle(18, Color(0xffF8F8F8), FontWeight.w700),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 20,
                    color: Color(0xffFFFFFF),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 287,
              width: 365,
              padding: EdgeInsets.only(left: 16, top: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff292B3E)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Web Design - PT Mencari\nCinta Sejati ",
                    style: myStyle(24, Color(0xffF8F8F8), FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffE5E5EA)),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        "12 Tasks",
                        style: myStyle(12, Color(0xffE9E9EB), FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Goals",
                    style: myStyle(16, Color(0xffE9E9EB), FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet,consectetur\nadipis cing elit. Sit tristique porttitor\nmagna turpis consequat,sed.At urna, cras\nultricies tristique.",
                    style: myStyle(16, Color(0xffF8F8F8), FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Image.asset("images/Vectortxt1.png"),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "March 13, 17:00 PM",
                        style: myStyle(12, Color(0xffE9E9EB), FontWeight.w500),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Image.asset("images/Vectortxt2.png"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Medium Project",
                            style:
                                myStyle(12, Color(0xffE9E9EB), FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 408,
              width: 365,
              padding: EdgeInsets.only(left: 25, top: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff292B3E)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Tasks (5/12)",
                        style: myStyle(16, Color(0xffE9E9EB), FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      width: 203,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Color(0xff363748),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      width: 101,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        color: Color(0xff9C67F9),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_box_rounded,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Research Analysis",
                        style: myStyle(16, Color(0xffE9E9EB), FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_box_rounded,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Design Systems",
                        style: myStyle(16, Color(0xffE9E9EB), FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_box_rounded,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Wireframe",
                        style: myStyle(16, Color(0xffE9E9EB), FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_box_rounded,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Mockup",
                        style: myStyle(16, Color(0xffE9E9EB), FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_box_rounded,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Prototype",
                        style: myStyle(16, Color(0xffE9E9EB), FontWeight.w500),
                      ),
                    ],
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
