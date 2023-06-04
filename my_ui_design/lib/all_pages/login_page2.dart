import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/all_pages/login_page3.dart';
import 'package:my_ui_design/all_pages/roated_page2.dart';
import 'package:my_ui_design/all_pages/roated_page3.dart';

class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "images/Vector1.png",
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xffE9E9EB),
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                    fontStyle: FontStyle.normal,
                    fontFamily: "Nunito",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 160.0),
              child: Text(
                "Your Email Address",
                style: TextStyle(
                  color: Color(0xffE9E9EB),
                  fontWeight: FontWeight.w400,
                  fontSize: 22.0,
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
                hintText: "Enter your email address",
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
            SizedBox(
              height: 16,
            ),
            CustomeButton(
              title: "Continue",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage3()));
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            Text(
              "Forgot Your Password",
              style: TextStyle(
                color: Color(0xffE9E9EB),
                fontWeight: FontWeight.w400,
                fontSize: 17.0,
                fontStyle: FontStyle.normal,
                fontFamily: "Nunito",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
