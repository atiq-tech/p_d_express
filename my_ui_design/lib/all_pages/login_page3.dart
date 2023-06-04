import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/all_pages/login_page4.dart';
import 'package:my_ui_design/all_pages/roated_page2.dart';

class LoginPage3 extends StatelessWidget {
  const LoginPage3({super.key});

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
                  "images/Sliderpic.png",
                ),
              ),
            ]),
            SizedBox(height: 30.0),
            Text(
              "Complete Your Profiles",
              style: TextStyle(
                color: Color(0xffE9E9EB),
                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
                fontFamily: "Nunito",
              ),
            ),
            SizedBox(height: 20.0),
            CircleAvatar(
              backgroundColor: Color(0xff8E8E93),
              radius: 50.0,
              child: Icon(Icons.camera_alt),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 200.0),
              child: Text(
                "Your Full Name",
                style: TextStyle(
                  color: Color(0xffE9E9EB),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Color(0xff8A8A8E),
                  size: 20.0,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 204, 200, 200), width: 2),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                hintText: "Enter your full name",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 252, 252, 252),
                  fontWeight: FontWeight.w400,
                  fontSize: 17.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: "Nunito",
                ),
              ),
              enabled: false,
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 200.0),
              child: Text(
                "Your Password",
                style: TextStyle(
                  color: Color(0xffE9E9EB),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: "Nunito",
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.key,
                  color: Color(0xff8A8A8E),
                  size: 20.0,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 204, 200, 200), width: 2),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                hintText: "Enter your password",
                hintStyle: TextStyle(
                  color: Color(0xffE9E9EB),
                  fontWeight: FontWeight.w400,
                  fontSize: 17.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: "Nunito",
                ),
              ),
              enabled: false,
            ),
            SizedBox(
              height: 16,
            ),
            CustomeButton(
              title: "Continue",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage4()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
