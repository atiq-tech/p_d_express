import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/all_pages/login_page3.dart';
import 'package:my_ui_design/all_pages/login_page5.dart';
import 'package:my_ui_design/all_pages/roated_page2.dart';

class LoginPage4 extends StatelessWidget {
  const LoginPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff5E5E5),
      body: Container(
        padding: EdgeInsets.fromLTRB(16.0, 70.0, 16.0, 90.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xffE9E9EB),
                  size: 18.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 120.0),
                child: Image.asset(
                  "images/Sliderpic1.png",
                ),
              ),
            ]),
            SizedBox(height: 30.0),
            CustomeButton(
              title: "Create Your Own Team",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage4()));
              },
            ),
            SizedBox(height: 20.0),
            Text(
              "or",
              style: TextStyle(
                color: Color(0xffE9E9EB),
                fontWeight: FontWeight.w400,
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
                fontFamily: "Nunito",
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage5()));
              },
              child: Container(
                height: 60.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(color: Color(0xffE9E9EB))),
                child: Center(
                  child: Text(
                    "Join Team",
                    style: TextStyle(
                      color: Color(0xffE9E9EB),
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                      fontFamily: "Nunito",
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
