import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:myposs/common_widget/custom_appbar.dart';
import 'package:myposs/provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class ProductionRecordPage extends StatefulWidget {
  const ProductionRecordPage({super.key});

  @override
  State<ProductionRecordPage> createState() => _ProductionRecordPageState();
}

class _ProductionRecordPageState extends State<ProductionRecordPage> {
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _Date2Controller = TextEditingController();
  String? firstPickedDate;

  void _firstSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        firstPickedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  String? secondPickedDate;

  void _secondSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        secondPickedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  @override
  void initState() {
    firstPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    secondPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Product Ledger
    final allProductionRecordData =
        Provider.of<CounterProvider>(context).allProductionRecordlist;
    print(
        "ProductionRecord ISSSSSSSSSSSS IS Lenght is:::::${allProductionRecordData.length}");
    return Scaffold(
      appBar: CustomAppBar(title: "Production Record"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              child: Container(
                height: 140.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 6.0, left: 10.0, right: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 5, 107, 155),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            "Date From",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(flex: 1, child: Text(":")),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 35,
                            child: GestureDetector(
                              onTap: (() {
                                _firstSelectedDate();
                              }),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  suffixIcon: Icon(
                                    Icons.calendar_month,
                                    color: Colors.black87,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: firstPickedDate == null
                                      ? DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now())
                                      : firstPickedDate,
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            "Date To",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(flex: 1, child: Text(":")),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 35,
                            child: GestureDetector(
                              onTap: (() {
                                _secondSelectedDate();
                              }),
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(top: 10, left: 5),
                                  filled: true,
                                  fillColor: Colors.blue[50],
                                  suffixIcon: Icon(
                                    Icons.calendar_month,
                                    color: Colors.black87,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: secondPickedDate == null
                                      ? DateFormat('yyyy-MM-dd')
                                          .format(DateTime.now())
                                      : secondPickedDate,
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return null;
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Provider.of<CounterProvider>(context, listen: false)
                                .getProductionRecord(
                                    context,
                                    "${firstPickedDate}",
                                    "${secondPickedDate}");

                            print(
                                "firstDate ++++ProductionRecord=====::${firstPickedDate}");
                            print(
                                "secondDate ++++ProductionRecord=====::${secondPickedDate}");
                          });
                        },
                        child: Container(
                          height: 35.0,
                          width: 85.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 75, 196, 201),
                                width: 2.0),
                            color: Color.fromARGB(255, 87, 113, 170),
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Center(
                              child: Text(
                            "Search",
                            style: TextStyle(
                                letterSpacing: 1.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: MediaQuery.of(context).size.height / 1.43,
              width: double.infinity,
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      // color: Colors.red,
                      // padding:EdgeInsets.only(bottom: 16.0),
                      child: DataTable(
                        showCheckboxColumn: true,
                        border:
                            TableBorder.all(color: Colors.black54, width: 1),
                        columns: [
                          DataColumn(
                            label: Center(child: Text('Production Id.')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Incharge')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Shift')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Total Cost')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Note')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Quantity')),
                          ),
                        ],
                        rows: List.generate(
                          allProductionRecordData.length,
                          (int index) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProductionRecordData[index].productionId}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProductionRecordData[index].date}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProductionRecordData[index].inchargeName}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProductionRecordData[index].shift}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProductionRecordData[index].totalCost}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProductionRecordData[index].note}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProductionRecordData[0].products![index].name}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProductionRecordData[0].products![index].quantity}')),
                              ),
                            ],
                          ),
                        ),
                      ),
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
