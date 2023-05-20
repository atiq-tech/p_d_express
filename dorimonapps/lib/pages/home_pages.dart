import 'package:dorimonapps/datasoures/data_sources.dart';
import 'package:flutter/material.dart';

import '../widgets/heading.dart';
import '../widgets/nobel_card.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  List<Map?>? nobelData = Nobeldatasource.nobelmans;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 41, 219, 201),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.menu_open,
              color: Colors.black,
              size: 40.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Heading(text: "Nobeleast", color: Colors.black),
            Expanded(
              flex: 12,
              child: Container(
                child: GridView.builder(
                    itemCount: nobelData!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                        childAspectRatio: 4 / 3),
                    itemBuilder: (context, index) => NobelCard(
                          name: "${nobelData![index]!["category"]}",
                          year: "${nobelData![index]!["year"]}",
                          firstname: [
                            nobelData![index]!.containsKey("laureates")
                                ? "${nobelData![index]!["laureates"]![0]["firstname"]}"
                                : "",
                          ],
                          color: Color.fromARGB(255, 9, 94, 163),
                          id: [
                            nobelData![index]!.containsKey("laureates")
                                ? "${nobelData![index]!["laureates"]![0]["surname"]}"
                                : "",
                          ],
                        )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
