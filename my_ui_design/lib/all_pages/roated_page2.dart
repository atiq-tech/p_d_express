import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/all_pages/roated_page3.dart';
import 'package:my_ui_design/widgets/const.dart';

class RoatedPage2 extends StatelessWidget {
  const RoatedPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5E5E5),
      body: Stack(
        children: [
          Positioned(
              top: -180,
              left: -20,
              child: Transform.rotate(
                angle: pi / 5,
                child: Container(
                  width: 480,
                  height: 450,
                  decoration: BoxDecoration(
                      color: Color(0xff8E8E93),
                      borderRadius: BorderRadius.circular(40)),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Create a Task and\nAssign it to Your\nTeam Members",
                  style: myStyle(30, Color(0xffE4E4E6)),
                ),
                SizedBox(
                  height: 32,
                ),
                Image.asset("images/Slider.png"),
                // SvgPicture.asset(
                //   "assets/slider.svg",
                // ),
                SizedBox(
                  height: 36,
                ),

                CustomeButton(
                  title: "Sign Up",
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RoatedPage3()));
                  },
                ),
                SizedBox(
                  height: 16,
                ),

                CustomeButton(
                  isBlue: true,
                  title: "Login",
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RoatedPage3()));
                  },
                ),
                SizedBox(height: 40.0),
                Center(
                  child: Container(
                    height: 8.0,
                    width: 180.0,
                    decoration: BoxDecoration(
                      color: Color(0xffE9E9EB),
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  CustomeButton({super.key, this.isBlue, this.onTap, this.title});

  String? title;
  VoidCallback? onTap;
  bool? isBlue;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: double.infinity,
      color: isBlue == null ? Colors.blue : Colors.transparent,
      child: Text(
        "$title",
        style: myStyle(16, Colors.white),
      ),
      padding: EdgeInsets.symmetric(vertical: 17),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide(
              color: isBlue == null ? Colors.transparent : Colors.white70)),
    );
  }
}
