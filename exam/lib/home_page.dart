import 'package:exam/cart_page.dart';
import 'package:exam/data/product_data.dart';
import 'package:exam/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productData = Productdata.generatedMySourecList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SecondPage()));
                          });
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.black54,
                          size: 16,
                        )),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.all(8),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 226, 221, 221),
                      ),
                      color: Color.fromARGB(255, 248, 246, 246),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black54,
                          size: 18,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Hi-Fi Shop & Service",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              "Audio shop on Rusteveli Avw 57.\nThis shop offers both products and services",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 156, 150, 150)),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text(
                  "Products",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "41",
                  style: TextStyle(
                      color: Color.fromARGB(66, 73, 70, 70),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  "Show all",
                  style: TextStyle(
                      color: Color.fromARGB(255, 46, 4, 231),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 210,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${productData[index].img}"),
                                      fit: BoxFit.fill),
                                ),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                              flex: 3,
                              child: Container(
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${productData[index].company}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${productData[index].title}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${productData[index].price}",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 87, 87),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(width: 10),
                  itemCount: productData.length),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text(
                  "Accessories",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "19",
                  style: TextStyle(
                      color: Color.fromARGB(66, 71, 68, 68),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  "Show all",
                  style: TextStyle(
                      color: Color.fromARGB(255, 46, 4, 231),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: GridView.builder(
                  itemCount: productData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      //  maxCrossAxisExtent: 200,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 210,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "${productData[index].img}"),
                                      fit: BoxFit.fill),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: Container(
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${productData[index].company}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${productData[index].title}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${productData[index].price}",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 87, 87),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
