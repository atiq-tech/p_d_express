import 'dart:math';
import 'dart:ui';

import 'package:bmi_calculator/containerbox.dart';
import 'package:bmi_calculator/data_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color.fromARGB(255, 145, 146, 242);
const inActiveColor = Color(0xFF212121);

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleboxColor = activeColor;
  Color femaleboxColor = inActiveColor;
  int height = 180;
  int weight = 70;
  int age = 25;
  String result = "";
  String resultDetails = "result here";
  double bmi = 0;
  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleboxColor == inActiveColor) {
        maleboxColor == activeColor;
        femaleboxColor == inActiveColor;
      } else {
        maleboxColor == inActiveColor;
        femaleboxColor == activeColor;
      }
    } else {
      if (femaleboxColor == inActiveColor) {
        femaleboxColor == activeColor;
        maleboxColor == inActiveColor;
      } else {
        femaleboxColor == inActiveColor;
        maleboxColor == activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return "You have a higher than normal body weight.try to exercise more.😥😪😥...";
    }
    if (bmi <= 18.5) {
      return "You have a normal body weight.Good job";
    } else {
      return "You have a lower than normal body weight.You can eat a bit more.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 179, 194, 249),
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(1);
                      });
                    },
                    child: Containerbox(
                      color: activeColor,
                      childwidget: dataContainer(
                        icons: FontAwesomeIcons.mars,
                        title: "MALE  👨‍⚕️",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(2);
                      });
                    },
                    child: Containerbox(
                      color: inActiveColor,
                      childwidget: dataContainer(
                        icons: FontAwesomeIcons.venus,
                        title: "FEMALE  👨‍⚕️",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Containerbox(
              color: inActiveColor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "❤️HIGHT❤️",
                    style: TextStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle2,
                      ),
                      Text(
                        "cm",
                        style: TextStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    thumbColor: Color.fromARGB(255, 239, 6, 169),
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: Colors.white,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Containerbox(
                    color: inActiveColor,
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "⚡WEIGHT⚡",
                          style: TextStyle1,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Containerbox(
                    color: inActiveColor,
                    childwidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "🌟AGE🌟",
                          style: TextStyle1,
                        ),
                        Text(
                          age.toString(),
                          style: TextStyle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  if (age > 0) {
                                    age--;
                                  }
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                result = calculateBmi(height, weight);
                resultDetails = getInterpretation(bmi);
                showDialog(
                  barrierColor: inActiveColor,
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 15.0, right: 15),
                        color: Color.fromARGB(255, 204, 64, 255),
                        height: 200.0,
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "BMI🌟Result",
                              style: TextStyle1,
                            ),
                            Text(
                              result.toString(),
                              style: TextStyle2,
                            ),
                            Text(
                              resultDetails,
                              style: TextStyle1,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "Calculate 🌟",
                  style: TextStyle3,
                ),
              ),
              width: double.infinity,
              height: 80.0,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
