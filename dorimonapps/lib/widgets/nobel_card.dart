import 'package:dorimonapps/pages/details_page.dart';
import 'package:flutter/material.dart';

import 'power_badge.dart';

class NobelCard extends StatelessWidget {
  final Color color;
  final String name;
  final String year;
  final List<String> id;
  final List<String> firstname;
  const NobelCard(
      {Key? key,
      required this.name,
      required this.color,
      required this.year,
      required this.id,
      required this.firstname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(), // try korte hobe nije nije
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  PowerBadge(
                    text: "$year",
                    color: Colors.green,
                  ),
                  PowerBadge(
                    text: "$firstname",
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10.0,
            top: 30.0,
            child: Container(
              height: 50.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 182, 245),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Center(
                child: Hero(
                  tag: "nobeleast1",
                  child: PowerBadge(
                    color: Color.fromARGB(255, 8, 0, 0).withOpacity(0.3),
                    text: "${id}",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
