import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:callapi/exercise_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FitnessPage extends StatefulWidget {
  const FitnessPage({Key? key, this.exerciesModel, this.second})
      : super(key: key);
  final ExerciesModel? exerciesModel;
  final int? second;

  @override
  State<FitnessPage> createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  late Timer timer;
  int startCount = 0;
  //01733390206

  @override
  void initState() {
    // TODO: implement initState
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick == widget.second) {
        timer.cancel();
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
      }
      setState(() {
        startCount = timer.tick;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 231, 48, 170),
        centerTitle: true,
        title: Text(
          "Your Fitness Exercise",
          style: TextStyle(
            color: Color.fromARGB(255, 177, 241, 180),
          ),
        ),
      ),
      body: Stack(
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            imageUrl: "${widget.exerciesModel!.gif}",
            placeholder: (context, url) => Image.network(
                "https://scontent.fdac14-1.fna.fbcdn.net/v/t39.30808-6/289620773_1481839125564975_5747857831682633761_n.jpg?stp=dst-jpg_p720x720&_nc_cat=101&ccb=1-7&_nc_sid=e3f864&_nc_ohc=P9fq7KFw424AX-eB6M-&tn=nWp8pCzqR2lDZaR-&_nc_ht=scontent.fdac14-1.fna&oh=00_AfAOJWs2DH5EjgTS4MnXqjQQdvXqYDGfXP4IJJue950AvA&oe=6377EEF1"),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
            top: 50,
            right: 20,
            left: 20,
            child: Center(
                child: Text(
              "${startCount} Seconds",
              style: TextStyle(
                  color: Color.fromARGB(255, 182, 5, 152),
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            )),
          )
        ],
      ),
    );
  }
}
