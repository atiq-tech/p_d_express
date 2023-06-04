import 'package:flutter/material.dart';

import 'package:my_ui_design/widgets/const.dart';

class Project extends StatelessWidget {
  const Project({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5E5E5),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
          child: Column(
            children: [
              Row(
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
                    "Project",
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
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Container(
                    height: 32,
                    width: 44,
                    decoration: BoxDecoration(
                      color: Color(0xff246BFD),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "16",
                        style: myStyle(16, Color(0xffF8F8F8), FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "All",
                    style: myStyle(16, Color(0xffF8F8F8), FontWeight.w700),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    height: 32,
                    width: 34,
                    decoration: BoxDecoration(
                      color: Color(0xff292B3E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "5",
                        style: myStyle(16, Color(0xff8A8A8E), FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Ongoing",
                    style: myStyle(16, Color(0xff8A8A8E), FontWeight.w500),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    height: 32,
                    width: 34,
                    decoration: BoxDecoration(
                      color: Color(0xff292B3E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "7",
                        style: myStyle(16, Color(0xff8A8A8E), FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Under Review",
                    style: myStyle(16, Color(0xff8A8A8E), FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.blue,
                endIndent: 290,
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              listContainer(),
              SizedBox(
                height: 10,
              ),
              listContainer(),
              SizedBox(
                height: 10,
              ),
              listContainer(),
              SizedBox(
                height: 10,
              ),
              listContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

class listContainer extends StatelessWidget {
  const listContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 150,
      padding: EdgeInsets.only(left: 16, top: 10),
      decoration: BoxDecoration(
        color: Color(0xff292B3E),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Web Design",
                style: myStyle(18, Color(0xffF8F8F8), FontWeight.w600),
              ),
              SizedBox(
                width: 120.0,
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff00CC39)),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                "2 Days Left",
                style: myStyle(12, Color(0xffE9E9EB), FontWeight.w500),
              ),
              SizedBox(
                width: 15.0,
              ),
              Icon(
                Icons.more_vert,
                size: 20,
                color: Color(0xffE9E9EB),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "PT. Ikatan Cinta",
            style: myStyle(14, Color(0xffE9E9EB), FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: 272,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0xff363748),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 80,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Color(0xff9C67F9),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "35%",
                style: myStyle(16, Color(0xffE9E9EB), FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffE5E5EA)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffE5E5EA)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffE5E5EA)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffE5E5EA)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
