import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:myposs/common_widget/custom_appbar.dart';
import 'package:myposs/provider/sales_module/provider_customer_list_with_customer_type.dart';
import 'package:myposs/provider/sales_module/provider_customer_payment_history.dart';
import 'package:provider/provider.dart';
import '../../provider/sales_module/provider_customer_payment_report.dart';

class Customer_Payment_Report extends StatefulWidget {
  const Customer_Payment_Report({Key? key}) : super(key: key);

  @override
  State<Customer_Payment_Report> createState() =>
      _Customer_Payment_ReportState();
}

class _Customer_Payment_ReportState extends State<Customer_Payment_Report> {
  bool isAllPaymentTypeClicked = false;
  bool isReceivedPaymentTypeClicked = false;
  bool isPaidPaymentTypeClicked = false;
  bool isCategoryWiseClicked = false;
  bool isProductWiseClicked = false;
  double thFontSize = 10.0;
  String data = '';
  String data2 = '';
  bool is_second_Caregory = false;
  bool is_first_Caregory = false;

  List<String> _types = [
    'Retail',
    'WholeSale',
  ];

  // List<String> _category = [
  //   'All',
  //   'Received',
  //   'Paid',
  // ];

  String? _selectedCustomer;
  String? _selectedCustomerType;
  String customerId = "";
  String customerType = "";
  String paymentType = "";

  @override
  void initState() {
    firstPickedDate = "2000-03-01";
    secondPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provideCustomerList =
        Provider.of<CustomerListByCustomerTypeProvider>(context)
            .provideCustomerListByCustomerType;

    final provideCustomerPaymentReportList =
        Provider.of<CustomerPaymentReportProvider>(context)
            .provideCustomerPaymentReportList;

    print(
        "UI: provideCustomerPaymentReportList length=====> ${provideCustomerPaymentReportList.length}");
    // for (int i = 0; i <= provideCustomerPaymentReportList.length; i++) {
    //   print(
    //       "UI: provideCustomerPaymentReportList=====> ${provideCustomerPaymentReportList[0].payments![0].description}");
    // }

    return Scaffold(
      appBar: CustomAppBar(title: "Customer Payment Report"),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Customer Type:",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          height: 30,
                          padding: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromARGB(255, 7, 125, 180),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              hint: Text(
                                'Please select a payment type',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ), // Not necessary for Option 1
                              value: _selectedCustomerType,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCustomerType = newValue.toString();
                                  _selectedCustomerType == 'Retail'
                                      ? customerType = 'retail'
                                      : _selectedCustomerType == 'Wholesale'
                                          ? customerType = "wholesale"
                                          : customerType = "";
                                  Provider.of<CustomerListByCustomerTypeProvider>(
                                          context,
                                          listen: false)
                                      .getCustomerListByCustomerTypeData(
                                          context, customerType);
                                  print("Customer Type: ${customerType}");
                                });
                              },
                              items: _types.map((location) {
                                return DropdownMenuItem(
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Customer:",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            margin: EdgeInsets.only(top: 5, bottom: 5),
                            height: 30,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Color.fromARGB(255, 7, 125, 180),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  'Please select a customer',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                value: _selectedCustomer,
                                onChanged: (newValue) {
                                  setState(() {
                                    customerId = "$newValue";
                                    print("Customer Id============$newValue");
                                    _selectedCustomer = newValue.toString();
                                    print(
                                        "dropdown value================$newValue");
                                  });
                                },
                                items: provideCustomerList.map((location) {
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
                            )),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(right: 5, top: 5, bottom: 5),
                          height: 30,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 7, 125, 180),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: (() {
                              _firstSelectedDate();
                            }),
                            child: Text(
                              firstPickedDate == null
                                  ? Jiffy(DateTime.now())
                                      .format("dd - MMM - yyyy")
                                  : firstPickedDate!,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Text("To"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 5, top: 5, bottom: 5),
                          height: 30,
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 5, right: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 7, 125, 180),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: GestureDetector(
                            onTap: (() {
                              _secondSelectedDate();
                            }),
                            child: Text(
                              secondPickedDate == null
                                  ? Jiffy(DateTime.now())
                                      .format("dd - MMM - yyyy")
                                  : secondPickedDate!,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    color: Color.fromARGB(255, 3, 91, 150),
                    padding: EdgeInsets.all(1.0),
                    child: InkWell(
                      onTap: () {
                        Provider.of<CustomerPaymentReportProvider>(context,
                                listen: false)
                            .getCustomerPaymentData(
                          context,
                          "$customerId",
                          firstPickedDate,
                          secondPickedDate,
                        );
                      },
                      child: Container(
                        height: 30.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 4, 113, 185),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Center(
                            child: Text(
                          "Show Report",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Color.fromARGB(255, 92, 90, 90),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 1.31,
              width: double.infinity,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: DataTable(
                        showCheckboxColumn: true,
                        border:
                            TableBorder.all(color: Colors.black54, width: 1),
                        columns: [
                          DataColumn(
                            label: Center(child: Text('Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Description')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Bill')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Paid')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Inv.Due')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Retruned')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Paid to customer')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Balance')),
                          ),
                        ],
                        rows: List.generate(
                          provideCustomerPaymentReportList.length,
                          (int index) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Center(
                                    child: Text(
                                        provideCustomerPaymentReportList[index]
                                            .date!)),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        provideCustomerPaymentReportList[index]
                                            .description!)),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        provideCustomerPaymentReportList[index]
                                            .bill!)),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        provideCustomerPaymentReportList[index]
                                            .paid!)),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        provideCustomerPaymentReportList[index]
                                            .due!)),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        provideCustomerPaymentReportList[index]
                                            .returned!)),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        provideCustomerPaymentReportList[index]
                                            .paid!)),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        ("${provideCustomerPaymentReportList[index].balance!}"))),
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
          )
        ],
      ),
    );
  }

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
        Provider.of<CustomerPaymentHistoryProvider>(context, listen: false)
            .getCustomerPaymentData(context, customerId, firstPickedDate,
                secondPickedDate, paymentType);
        print("Firstdateee $firstPickedDate");
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
        Provider.of<CustomerPaymentHistoryProvider>(context, listen: false)
            .getCustomerPaymentData(context, customerId, firstPickedDate,
                secondPickedDate, paymentType);
        print("secondPickedDate $secondPickedDate");
      });
    }
  }
}
