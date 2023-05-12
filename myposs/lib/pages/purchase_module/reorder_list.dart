import 'package:flutter/material.dart';
import 'package:myposs/provider/sales_module/stock/provider_total_stock.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_appbar.dart';

class ReorderList extends StatefulWidget {
  const ReorderList({Key? key}) : super(key: key);

  @override
  State<ReorderList> createState() => _ReorderListState();
}

class _ReorderListState extends State<ReorderList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    Provider.of<TotalStockProvider>(context, listen: false)
        .getAllTotalStockData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provideStockList =
        Provider.of<TotalStockProvider>(context).provideTotalStockList;
    return Scaffold(
        appBar: CustomAppBar(title: "Reorder List"),
        body: Column(
          children: [
            Container(
              height: 40.0,
              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: TextField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  hintText: "Search",
                  contentPadding:
                      EdgeInsets.only(left: 10, right: 0, top: 0, bottom: 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 7, 125, 180),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 7, 125, 180),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    child: DataTable(
                      showCheckboxColumn: true,
                      border: TableBorder.all(color: Colors.black54, width: 1),
                      columns: [
                        DataColumn(
                          label: Center(child: Text('Product Id')),
                        ),
                        DataColumn(
                          label: Center(child: Text('Product Name')),
                        ),
                        DataColumn(
                          label: Center(child: Text('Category Name')),
                        ),
                        DataColumn(
                          label: Center(child: Text('Re Order Level')),
                        ),
                        DataColumn(
                          label: Center(child: Text('Current Stock')),
                        ),
                      ],
                      rows: List.generate(
                        provideStockList.length,
                        (int index) => DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Center(
                                  child: Text(
                                      provideStockList[index].productCode!)),
                            ),
                            DataCell(
                              Center(
                                  child: Text(
                                      provideStockList[index].productName!)),
                            ),
                            DataCell(
                              Center(
                                  child: Text(
                                      "${provideStockList[index].productCategoryName!}")),
                            ),
                            DataCell(
                              Center(
                                  child: Text(
                                      "${provideStockList[index].productReOrederLevel!} ${provideStockList[index].unitName!}")),
                            ),
                            DataCell(
                              Center(
                                  child: Text(
                                      "${provideStockList[index].currentQuantity!} ${provideStockList[index].unitName!}")),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
