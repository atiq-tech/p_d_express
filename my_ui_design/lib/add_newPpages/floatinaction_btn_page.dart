import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/add_newPpages/add_member.dart';
import 'package:my_ui_design/widgets/const.dart';

class FloatinActionPage extends StatelessWidget {
  const FloatinActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff5E5E5),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddMemberPage()));
          },
          child: Icon(Icons.add),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
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
                height: 25.0,
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
              SizedBox(height: 60.0),
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
        ));
  }
}

class rowcontainer extends StatelessWidget {
  const rowcontainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //first
      height: 150,
      width: 190,
      padding: EdgeInsets.fromLTRB(16.0, 15.0, 15.0, 5.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 31, 32, 46),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(0xff8E8E93),
                      radius: 25,
                    ),
                    Positioned(
                      left: 32,
                      bottom: 1,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff00CC39)),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Color(0xffE9E9EB),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Shoo Phar Nho",
            style: myStyle(20, Color(0xffF8F8F8)),
          ),
          Text(
            "pharno@email.com",
            style: myStyle(16, Color(0xffF8F8F8)),
          ),
        ],
      ),
    );
  }
}
