import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:myposs/common_widget/custom_appbar.dart';
import 'package:myposs/provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

import '../../Api_Integration/Api_All_implement/Atik/Api_all_bank_accounts/Api_all_bank_accounts.dart';
import '../../Api_Integration/Api_All_implement/Atik/Api_all_bank_transaction/Api_all_bank_transaction.dart';

class BankTransactionReportPage extends StatefulWidget {
  const BankTransactionReportPage({super.key});

  @override
  State<BankTransactionReportPage> createState() =>
      _BankTransactionReportPageState();
}

class _BankTransactionReportPageState extends State<BankTransactionReportPage> {
  String? _selectedAccount;
//
  String? paymentType;
  String? _selectedType;
  List<String> _selectedTypeList = [
    'All',
    'Deposit',
    'Withdraw',
  ];

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

  ApiAllBankAccounts? apiAllBankAccounts;
  ApiAllBankTransactions? apiAllBankTransactions;
  @override
  void initState() {
    // TODO: implement initState
    firstPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    secondPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    //bank ACCOUNTS
    ApiAllBankAccounts apiAllBankAccounts;
    Provider.of<CounterProvider>(context, listen: false)
        .getBankAccounts(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //bank accounts
    final allBankAccountsData =
        Provider.of<CounterProvider>(context).allBankAccountlist;
    print(
        "BankAccounts Accounts bank Accounts =Lenght is:::::${allBankAccountsData.length}");
    //bank transactions
    final allBankTransactionData =
        Provider.of<CounterProvider>(context).allBankTransactionslist;
    print(
        "BT BT BT BT BT BT BT BT BT BT =Lenght is:::::${allBankAccountsData.length}");
    return Scaffold(
      appBar: CustomAppBar(title: "Bank Transaction Report"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 160.0,
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
                          flex: 6,
                          child: Text(
                            "Accounts",
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
                                    _selectedAccount = newValue!.toString();
                                  });
                                },
                                items: allBankAccountsData.map((location) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      "${location.bankName}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    value: location.accountId,
                                  );
                                }).toList(),
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
                          flex: 6,
                          child: Text(
                            "Transaction Type",
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
                                  'All',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                dropdownColor: Color.fromARGB(255, 231, 251,
                                    255), // Not necessary for Option 1
                                value: _selectedType,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedType = newValue!;
                                    if (newValue == "All") {
                                      paymentType = "";
                                    }
                                    if (newValue == "Deposit") {
                                      paymentType = "deposit";
                                    }
                                    if (newValue == "Withdraw") {
                                      paymentType = "withdraw";
                                    }
                                  });
                                },
                                items: _selectedTypeList.map((location) {
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
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
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
                                      EdgeInsets.only(top: 10, left: 10),
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
                                      EdgeInsets.only(top: 10, left: 10),
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
                    SizedBox(height: 4),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          Provider.of<CounterProvider>(context, listen: false)
                              .getBankTransactions(
                            context,
                            "${_selectedAccount}",
                            "${firstPickedDate}",
                            "${secondPickedDate}",
                            "${paymentType}",
                          );

                          print("CashTransactions ::${_selectedAccount}");
                          print(
                              "firstDate CashTransactions+++++=====::${firstPickedDate}");
                          print(
                              "secondPickedDate +CashTransactions+++++=====::${secondPickedDate}");
                          print(
                              "CashTransactions selectedType::${paymentType}");
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
                      child: DataTable(
                        showCheckboxColumn: true,
                        border:
                            TableBorder.all(color: Colors.black54, width: 1),
                        columns: [
                          DataColumn(
                            label: Center(child: Text('SI')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Description')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Transaction Date')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Account Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Account Number')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Bank Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Note')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Deposit')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Withdraw')),
                          )
                        ],
                        rows: List.generate(
                          allBankTransactionData.length,
                          (int index) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Center(child: Text('$index')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allBankTransactionData[index].description}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allBankTransactionData[index].transactionDate}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allBankTransactionData[index].accountName}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allBankTransactionData[index].accountNumber}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allBankTransactionData[index].bankName}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allBankTransactionData[index].note}')),
                              ),
                              DataCell(
                                Center(
                                    child: allBankTransactionData[index]
                                                .transactionType ==
                                            "deposit"
                                        ? Text(
                                            '${allBankTransactionData[index].amount}')
                                        : Text(" ")),
                              ),
                              DataCell(
                                Center(
                                    child: allBankTransactionData[index]
                                                .transactionType ==
                                            "withdraw"
                                        ? Text(
                                            '${allBankTransactionData[index].amount}')
                                        : Text(" ")),
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
