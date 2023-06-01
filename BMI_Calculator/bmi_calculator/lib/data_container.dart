import 'package:bmi_calculator/main_screen.dart';
import 'package:flutter/material.dart';

const TextStyle1 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 20.0,
);
const TextStyle2 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 60.0,
  fontWeight: FontWeight.w900,
);
const TextStyle3 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 30.0,
  fontWeight: FontWeight.w500,
);

class dataContainer extends StatelessWidget {
  final IconData icons;
  final String title;
  const dataContainer({Key? key, required this.icons, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: TextStyle1,
        ),
      ],
    );
  }
}
