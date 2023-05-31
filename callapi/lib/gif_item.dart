import 'package:cached_network_image/cached_network_image.dart';
import 'package:callapi/exercise_model.dart';
import 'package:callapi/fitness_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class GifItem extends StatefulWidget {
  GifItem({Key? key, this.exerciesModel}) : super(key: key);
  final ExerciesModel? exerciesModel;
  @override
  State<GifItem> createState() => _GifItemState();
}

class _GifItemState extends State<GifItem> {
  int second = 3;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 235, 179),
        centerTitle: true,
        title: Text(
          "Your Exercise",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            fit: BoxFit.cover,
            height: double.infinity,
            imageUrl: "${widget.exerciesModel!.thumbnail}",
            placeholder: (context, url) => Image.network(
              "https://scontent.fdac14-1.fna.fbcdn.net/v/t39.30808-6/289620773_1481839125564975_5747857831682633761_n.jpg?stp=dst-jpg_p720x720&_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=P9fq7KFw424AX-eB6M-&tn=nWp8pCzqR2lDZaR-&_nc_ht=scontent.fdac14-1.fna&oh=00_AfAOJWs2DH5EjgTS4MnXqjQQdvXqYDGfXP4IJJue950AvA&oe=6377EEF1",
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              right: 25,
              child: SleekCircularSlider(
                min: 3,
                max: 20,
                initialValue: second.toDouble(),
                onChange: (double value) {
                  setState(() {
                    second = value.toInt();
                  });
                },
                innerWidget: (double value) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$second",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Color.fromARGB(255, 152, 155, 3)),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print("time $second");
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FitnessPage(
                                    exerciesModel: widget.exerciesModel,
                                    second: second,
                                  )));
                        },
                        child: Text(
                          "Started",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            primary: Color.fromARGB(255, 4, 228, 179)),
                      )
                    ],
                  );
                },
              ))
        ],
      ),
    );
  }
}
