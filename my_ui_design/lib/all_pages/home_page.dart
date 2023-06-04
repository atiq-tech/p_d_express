import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_ui_design/all_pages/roated_page1.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5E5E5),
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 255.0, 15.0, 0.0),
        child: Column(
          children: [
            Container(
              height: 96.0,
              width: 96.0,
              decoration: BoxDecoration(
                color: Color(0xff292B3E),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Icon(
                  Icons.auto_awesome_mosaic_outlined,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              "RANCHANG",
              style: TextStyle(
                  color: Color(0xffE4E4E6),
                  fontWeight: FontWeight.w700,
                  fontSize: 36.0,
                  fontStyle: FontStyle.normal,
                  fontFamily: "Nunito",
                  letterSpacing: 0.0037),
            ),
            SizedBox(height: 8.0),
            Text(
              "Your Personal Task Manager",
              style: TextStyle(
                color: Color(0xffE9E9EB),
                fontWeight: FontWeight.w400,
                fontSize: 17.0,
                fontStyle: FontStyle.normal,
                fontFamily: "Nunito",
              ),
            ),
            SizedBox(height: 230.0),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RoatedPage1()));
              },
              child: Container(
                padding: EdgeInsets.only(left: 17.0, right: 16.0),
                height: 56.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff246BFD),
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Getting Started",
                      style: TextStyle(
                        color: Color(0xffE9E9EB),
                        fontWeight: FontWeight.w400,
                        fontSize: 17.0,
                        fontStyle: FontStyle.normal,
                        fontFamily: "Nunito",
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffE9E9EB),
                      size: 17.0,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              height: 8.0,
              width: 180.0,
              decoration: BoxDecoration(
                color: Color(0xffE9E9EB),
                borderRadius: BorderRadius.circular(50.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
