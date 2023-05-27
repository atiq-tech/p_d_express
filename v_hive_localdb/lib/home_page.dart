import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<Map<String, dynamic>> _hiveitemslist = [];

  final _testhiveBox = Hive.box('testhiveBox');

  void _refreshItems() {
    final data = _testhiveBox.keys.map((key) {
      final item = _testhiveBox.get(key);
      return {
        "keys": key,
        "img": item["img"],
        "name": item["name"],
        "price": item["price"],
        "quantity": item["quantity"],
      };
    }).toList();
    setState(() {
      _hiveitemslist = data.reversed.toList();
      print("aaaaaaaaaaaaaaaaaaaaaaaaa item is=${_hiveitemslist.length}");
    });
  }

  Future<void> _createItem(Map<String, dynamic> newItems) async {
    await _testhiveBox.add(newItems);
    _refreshItems();
  }

  Future<void> _deleteItem(int itemkey) async {
    await _testhiveBox.delete(itemkey);
    _refreshItems();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Color.fromARGB(255, 165, 203, 235),
        content: Text(
          "An item is deleted successfully",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16.0),
        )));
  }

  void _showFormDetails(BuildContext ctx, int? itemKey) async {
    if (itemKey != null) {
      final exitItem =
          _hiveitemslist.firstWhere((element) => element['keys'] == itemKey);
      _imgController.text = exitItem['img'];
      _nameController.text = exitItem['name'];
      _priceController.text = exitItem['price'];
      _quantityController.text = exitItem['quantity'];
    }

    showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: ctx,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(ctx).viewInsets.bottom,
                  left: 15.0,
                  right: 15.0,
                  top: 15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: _imgController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Enter img'),
                  ),
                  SizedBox(height: 15.0),
                  TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: 'Enter any name'),
                  ),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration:
                        InputDecoration(hintText: ' Plz Enter the price'),
                  ),
                  SizedBox(height: 15.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (itemKey == null) {
                        _createItem({
                          "img": _imgController.text,
                          "name": _nameController.text,
                          "price": _priceController.text,
                          "quantity": 1,
                        });
                      }
                      _imgController.text = '';
                      _nameController.text = '';
                      _priceController.text = '';
                      _quantityController.text = '';

                      Navigator.of(context).pop();
                    },
                    child: Text("Submit"),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // endDrawer: InkWell(
      //   onTap: () {},
      //   child: Drawer(
      //       child: ListView.builder(
      //           itemCount: 5,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               color: Colors.blue,
      //               child: Text("End Drawer"),
      //             );
      //           })),
      // ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Hive Content"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showFormDetails(context, null),
        child: Icon(Icons.arrow_forward),
      ),
      body: ListView.builder(
          itemCount: _hiveitemslist.length,
          itemBuilder: (context, index) {
            final storeAllindexItem = _hiveitemslist[index];
            return Card(
              elevation: 5,
              color: Color.fromARGB(255, 83, 117, 190),
              margin: EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 6,
                      height: MediaQuery.of(context).size.height / 12,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 196, 3, 202),
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Center(
                        child: Text("${storeAllindexItem["img"]}"),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name:${storeAllindexItem["name"]}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Price:${storeAllindexItem["price"]}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 68, 67, 67),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Quantity:${storeAllindexItem["quantity"].toString().padLeft(2, "0")}",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  storeAllindexItem['quantity'] != 0
                                      ? storeAllindexItem['quantity']--
                                      : storeAllindexItem['quantity']++;
                                });
                              },
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 66, 91, 117),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.remove,
                                  color: Color.fromARGB(255, 212, 209, 209),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              "${storeAllindexItem['quantity'].toString().padLeft(2, "0")}",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 28, 28, 29),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  storeAllindexItem['quantity']++;
                                });
                              },
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 66, 91, 117),
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 212, 209, 209),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 66, 91, 117),
                              borderRadius: BorderRadius.circular(4.0)),
                          child: InkWell(
                            onTap: () => _deleteItem(storeAllindexItem["keys"]),
                            child: Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 212, 209, 209),
                              size: 20.0,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
