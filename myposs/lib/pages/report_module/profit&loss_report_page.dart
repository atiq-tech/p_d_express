import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:myposs/Api_Integration/Api_All_implement/Atik/Api_all_customers/Api_all_customers.dart';
import 'package:myposs/Api_Integration/Api_All_implement/Atik/Api_all_profit&loss/Api_all_profit_&_loss.dart';
import 'package:myposs/common_widget/custom_appbar.dart';
import 'package:myposs/provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class ProfitLossReportPage extends StatefulWidget {
  const ProfitLossReportPage({super.key});

  @override
  State<ProfitLossReportPage> createState() => _ProfitLossReportPageState();
}

class _ProfitLossReportPageState extends State<ProfitLossReportPage> {
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

  String? _selectedType;
  List<String> _selectedTypeList = [
    'Received',
    'Payment',
  ];
  String? _selectedAccount;

  ApiAllCustomers? apiAllCustomers;
  ApiAllProfitLoss? apiAllProfitLoss;
  @override
  void initState() {
    //Customers
    firstPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    secondPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    ApiAllCustomers apiAllCustomers;
    Provider.of<CounterProvider>(context, listen: false).getCustomers(context);

    // TODO: implement initState
    super.initState();
  }

  final List selesDetailslist = [];
  @override
  Widget build(BuildContext context) {
    //Customers
    final allCustomersData =
        Provider.of<CounterProvider>(context).allCustomerslist;
    print(
        "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC=Lenght is:::::${allCustomersData.length}");
    //
    //Profit^& LOSS
    final allProfitLossData =
        Provider.of<CounterProvider>(context).allProfitLosslist;
    print(
        "plplplplplplplplpplpplplplp=Lenght is:::::${allProfitLossData.length}");
    return Scaffold(
      appBar: CustomAppBar(title: "Profit & Loss"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 135.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
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
                          flex: 3,
                          child: Text(
                            "Customer",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(flex: 1, child: Text(":")),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 28.0,
                            width: MediaQuery.of(context).size.width / 2,
                            padding: EdgeInsets.only(left: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 5, 107, 155),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  'Select account',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                dropdownColor: Color.fromARGB(255, 231, 251,
                                    255), // Not necessary for Option 1
                                value: _selectedAccount,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedAccount = newValue.toString();
                                    print(
                                        "Customer Si no ===========>: $newValue");
                                    // Profit & Loss

                                    //
                                  });
                                },
                                items: allCustomersData.map((location) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      "${location.customerName}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    value: location.customerSlNo,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Date :",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        Expanded(
                          flex: 1,
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
                        Container(
                          child: Text("to"),
                        ),
                        Expanded(
                          flex: 1,
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
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Provider.of<CounterProvider>(context, listen: false)
                                .getProfitLoss(
                                    context,
                                    "${_selectedAccount}",
                                    "${firstPickedDate}",
                                    "${secondPickedDate}");

                            print("firstDate ++++++=====::${firstPickedDate}");
                            print(
                                "secondPickedDate ++++++=====::${secondPickedDate}");

                            for (int i = 0;
                                i <= allProfitLossData.length;
                                i++) {
                              for (int k = 0;
                                  k < allProfitLossData[i].saleDetails!.length;
                                  k++) {
                                selesDetailslist
                                    .add(allProfitLossData[i].saleDetails![k]);
                                print(
                                    "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${selesDetailslist[k].productName}");
                              }
                              print(
                                  "ddddddddddddddddddddddddddddddddddddddddddd${allProfitLossData[i].saleDetails![0].productName}");
                            }
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
                            borderRadius: BorderRadius.circular(10.0),
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
                            label: Center(child: Text('Product Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Product')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sold Quantity')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Purchase Rate')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Purchased Total')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Sold Amount')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Profit/Loss')),
                          ),
                        ],
                        rows: List.generate(
                          allProfitLossData.length,
                          //allProfitLossData[0].saleDetails!.length,
                          (int index) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProfitLossData[0].saleDetails![index].productIDNo}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProfitLossData[0].saleDetails![index].productName}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProfitLossData[0].saleDetails![index].saleDetailsTotalQuantity}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProfitLossData[0].saleDetails![index].purchaseRate}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProfitLossData[0].saleDetails![index].purchasedAmount}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProfitLossData[0].saleDetails![index].saleDetailsTotalAmount}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allProfitLossData[0].saleDetails![index].profitLoss}')),
                              )
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
