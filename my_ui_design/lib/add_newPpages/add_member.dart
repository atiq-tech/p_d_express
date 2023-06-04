import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/add_newPpages/floatinaction_btn_page.dart';

import 'package:my_ui_design/all_pages/login_page1.dart';
import 'package:my_ui_design/all_pages/roated_page2.dart';
import 'package:my_ui_design/screen/pageviewdemo_navbar.dart';
import 'package:my_ui_design/widgets/const.dart';

class AddMemberPage extends StatelessWidget {
  const AddMemberPage({super.key});

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
              padding: EdgeInsets.only(top: 80.0),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              color: Color.fromARGB(255, 12, 12, 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffE4E4E6),
                          size: 20.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 155.0),
                        child: Text(
                          "Atiq Team",
                          style: myStyle(20, Color(0xffE4E4E6)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 45.0,
                  ),
                  Row(
                    children: [
                      rowcontainer(),
                      SizedBox(
                        width: 12.0,
                      ),
                      rowcontainer(),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      rowcontainer(),
                      SizedBox(
                        width: 10.0,
                      ),
                      rowcontainer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 184.0,
            child: Container(
              height: 620,
              width: 394,
              padding: EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
              decoration: BoxDecoration(
                color: Color(0xff292B3E),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 340.0),
                    child: Image.asset("images/Vector1.png"),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 240,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Color(0xff8E8E93),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Add New Member",
                    style: myStyle(18, Color(0xffF8F8F8), FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Make your team good with us. invite your team\nmembers. to get going",
                    style: myStyle(16, Color(0xffF8F8F8)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Team Members",
                    style: myStyle(18, Color(0xffF8F8F8)),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_add_alt_1,
                        color: Color(0xff8A8A8E),
                        size: 25.0,
                      ),
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xff8A8A8E),
                        size: 35.0,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 204, 200, 200),
                            width: 2),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: "Select Your Team",
                      hintStyle: TextStyle(
                        color: Color(0xff8A8A8E),
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "Nunito",
                      ),
                    ),
                    enabled: false,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Color(0xff8A8A8E),
                        size: 25,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        "Add Member",
                        style: myStyle(17, Color(0xffF8F8F8), FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomeButton(
                    title: "Invite",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PageViewDemo()));
                    },
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Container(
                      height: 8.0,
                      width: 160.0,
                      decoration: BoxDecoration(
                        color: Color(0xffE9E9EB),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
