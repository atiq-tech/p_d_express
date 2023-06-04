import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/all_pages/login_page3.dart';
import 'package:my_ui_design/all_pages/login_page6.dart';
import 'package:my_ui_design/all_pages/roated_page2.dart';

class LoginPage5 extends StatelessWidget {
  const LoginPage5({super.key});

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
                  "images/Sliderpic2.png",
                ),
              ),
            ]),
            SizedBox(height: 35.0),
            Text(
              "Create Your Own Team?",
              style: TextStyle(
                color: Color(0xffE9E9EB),
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
                fontStyle: FontStyle.normal,
                fontFamily: "Nunito",
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 160.0),
              child: Text(
                "Your Team Name",
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
                  Icons.person_add_alt_sharp,
                  color: Color(0xff8A8A8E),
                  size: 30.0,
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 204, 200, 200), width: 2),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                hintText: "e.g Parto Team",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 252, 252, 252),
                  fontWeight: FontWeight.w400,
                  fontSize: 18.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: "Nunito",
                ),
              ),
              enabled: false,
            ),
            SizedBox(height: 120.0),
            CustomeButton(
              title: "Continue",
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage6()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
