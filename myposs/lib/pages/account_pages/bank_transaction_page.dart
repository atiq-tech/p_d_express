import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart' as jiffy;
import 'package:myposs/common_widget/custom_appbar.dart';
import 'package:myposs/provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

import '../../Api_Integration/Api_All_implement/Atik/Api_all_add_bank_transaction/Api_all_add_bank_transaction.dart';
import '../../Api_Integration/Api_All_implement/Atik/Api_all_bank_accounts/Api_all_bank_accounts.dart';

class BankTransactionPage extends StatefulWidget {
  const BankTransactionPage({super.key});

  @override
  State<BankTransactionPage> createState() => _BankTransactionPageState();
}

class _BankTransactionPageState extends State<BankTransactionPage> {
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _transactionTypeController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  String? _selectedAccount;
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

  String? paymentType;
  String? _transactionType;
  List<String> _transactionTypeList = [
    'Deposit',
    'Withdraw',
  ];
  ApiAllBankAccounts? apiAllBankAccounts;
  ApiAllAddBankTransactions? apiAllAddBankTransactions;
  @override
  void initState() {
    firstPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    //bank ACCOUNTS
    ApiAllBankAccounts apiAllBankAccounts;
    Provider.of<CounterProvider>(context, listen: false)
        .getBankAccounts(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //bank accounts
    final allBankAccountsData =
        Provider.of<CounterProvider>(context).allBankAccountlist;
    print(
        "BankAccounts Accounts bank Accounts =Lenght is:::::${allBankAccountsData.length}");
    //Get Bank Transaction
    final allGetBankTransactionData =
        Provider.of<CounterProvider>(context).allGetBankTransactionslist;
    print(
        "GBT GBT GBT GBT GBT GBT GBT GBT GBT =Lenght is:::::${allGetBankTransactionData.length}");
    return Scaffold(
      appBar: CustomAppBar(title: "Bank Transaction"),
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                child: Container(
                  height: 215.0,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
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
                              "Date",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              margin: EdgeInsets.only(
                                right: 5,
                                top: 5,
                                bottom: 5,
                              ),
                              height: 30,
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
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Account",
                              style: TextStyle(
                                  fontSize: 14.0,
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
                                        color:
                                            Color.fromARGB(255, 170, 167, 167)),
                                  ), // Not necessary for Option 1
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
                                            color: Color.fromARGB(
                                                255, 31, 30, 30)),
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
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Transaction Type",
                              style: TextStyle(
                                  fontSize: 14.0,
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
                                    'Select Type',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            Color.fromARGB(255, 100, 98, 98)),
                                  ), // Not necessary for Option 1
                                  value: _transactionType,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _transactionType = newValue!;
                                      if (newValue == "Deposit") {
                                        paymentType = "deposit";
                                      }
                                      if (newValue == "Withdraw") {
                                        paymentType = "withdraw";
                                      }
                                    });
                                  },
                                  items: _transactionTypeList.map((location) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        location,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 126, 125, 125)),
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
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Amount",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              height: 28.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                controller: _amountController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  border: InputBorder.none,
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
                          ),
                        ],
                      ),
                      SizedBox(height: 3.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "Note",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(flex: 1, child: Text(":")),
                          Expanded(
                            flex: 11,
                            child: Container(
                              height: 28.0,
                              width: MediaQuery.of(context).size.width / 2,
                              child: TextField(
                                controller: _noteController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  border: InputBorder.none,
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
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () {
                            ApiAllAddBankTransactions
                                .GetApiAllAddBankTransactions(
                              context,
                              "$_selectedAccount",
                              "${_amountController.text}",
                              "${_noteController.text}",
                              "$firstPickedDate",
                              0,
                              "$paymentType",
                            );
                            Provider.of<CounterProvider>(context, listen: false)
                                .getGetBankTransactions(
                                    context,
                                    "${DateFormat('yyyy-MM-dd').format(DateTime.now())}",
                                    "${DateFormat('yyyy-MM-dd').format(DateTime.now())}");
                            _amountController.text;
                            _noteController.text;
                          },
                          child: Container(
                            height: 35.0,
                            width: 180.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 131, 224, 146),
                                  width: 2.0),
                              color: Color.fromARGB(255, 5, 120, 165),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              "SAVE TRANSACTIONS",
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
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Container(
                  height: 40.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black38, width: 1)),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            /* Clear the search field */
                          },
                        ),
                        hintText: 'Filter...',
                        border: InputBorder.none),
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
                              label: Center(child: Text('Transaction Type')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Note')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Amount')),
                            ),
                          ],
                          rows: List.generate(
                            allGetBankTransactionData.length,
                            (int index) => DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(
                                      child: Text(
                                          '${allGetBankTransactionData[index].transactionDate}')),
                                ),
                                DataCell(
                                  Center(
                                      child: Text(
                                          '${allGetBankTransactionData[index].accountName}')),
                                ),
                                DataCell(
                                  Center(
                                      child: Text(
                                          '${allGetBankTransactionData[index].accountNumber}')),
                                ),
                                DataCell(
                                  Center(
                                      child: Text(
                                          '${allGetBankTransactionData[index].bankName}')),
                                ),
                                DataCell(
                                  Center(
                                      child: Text(
                                          '${allGetBankTransactionData[index].transactionType}')),
                                ),
                                DataCell(
                                  Center(
                                      child: Text(
                                          '${allGetBankTransactionData[index].note}')),
                                ),
                                DataCell(
                                  Center(
                                      child: Text(
                                          '${allGetBankTransactionData[index].amount}')),
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
      ),
    );
  }
}
