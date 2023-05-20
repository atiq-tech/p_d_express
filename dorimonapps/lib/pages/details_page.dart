import 'package:dorimonapps/widgets/features_title_text.dart';
import 'package:dorimonapps/widgets/heading.dart';
import 'package:dorimonapps/widgets/power_badge.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/features_value.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 166, 194),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Heading(
                            text: "Nobeleast Man",
                            color: Color.fromARGB(255, 166, 228, 51),
                          ),
                          Row(
                            children: [
                              PowerBadge(
                                text: "firstname",
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              PowerBadge(
                                text: "surname",
                                color: Colors.green,
                              ),
                            ],
                          ),
                          Container(
                            height: 160.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 3, 117, 161),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0))),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: Container(
                              height: double.infinity,
                              child: Column(
                                children: [
                                  FeaturesTitleText(text: "year"),
                                  FeaturesTitleText(text: "fistname"),
                                  FeaturesTitleText(text: "surname"),
                                  FeaturesTitleText(text: "motivation"),
                                  FeaturesTitleText(text: "share"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 70.0),
                            child: Container(
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeaturesValueText(text: "2022"),
                                  FeaturesValueText(text: "Benjamin"),
                                  FeaturesValueText(text: "List"),
                                  FeaturesValueText(
                                      text:
                                          "for the development of asymmetric organocatalysis"),
                                  FeaturesValueText(text: "02"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 150.0,
              child: Container(
                height: 150.0,
                width: 160.0,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 253, 253).withOpacity(0.3),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60.0),
                        topRight: Radius.circular(60.0))),
                child: Center(
                  child: Hero(
                    tag: "nobeleast1",
                    child: PowerBadge(
                      color: Color.fromARGB(255, 27, 26, 26).withOpacity(0.3),
                      text: "id",
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
