import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:jiffy/jiffy.dart';
import 'package:myposs/common_widget/custom_appbar.dart';
import 'package:myposs/pages/production_pages/material_page.dart';
import 'package:myposs/pages/production_pages/supplier_page.dart';
import 'package:myposs/provider/providers/counter_provider.dart';

import 'package:provider/provider.dart';

class MeterialPurchasePage extends StatefulWidget {
  const MeterialPurchasePage({super.key});

  @override
  State<MeterialPurchasePage> createState() => _MeterialPurchasePageState();
}

class _MeterialPurchasePageState extends State<MeterialPurchasePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _InvoiceNoController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _salesRateController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _transportController = TextEditingController();

  List<String> salesByList = ['A', 'B', 'C', 'D'];
  List<String> supplierList = [
    'General Supplier',
    'Sabbbir Enterprise',
    'Bulet',
    'Noyon'
  ];
  List<String> categoryList = ['Paper', 'Khata', 'Printing Paper', 'Tissue'];
  List<String> productList = ['Drawing Khata', 'Pencil', 'Notebook', 'Pen'];

  String? _selectedSupplier;
  String? _selectedCategory;
  String? _selectedProduct;
  String level = "Retails";
  String availableStock = "41 reem";

  double h1TextSize = 16.0;
  double h2TextSize = 12.0;

  bool isVisible = false;
  bool isEnabled = false;

  String? firstPickedDate;

  void _firstSelectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2050));
    if (selectedDate != null) {
      setState(() {
        firstPickedDate = Jiffy(selectedDate).format("dd - MMM - yyyy");
      });
    }
  }

  final TextEditingController _DateController = TextEditingController();

  String? _selectedPurchase;
  List<String> _selectedPurchaseList = [
    'Happy Product',
    'Selected Product',
  ];
  String? _selectedAccount;
  List<String> _selectedAccountList = [
    'Auto Vara',
    'Capital',
    'Transport bill',
    'Sallary',
    'Discount',
    'Withdraw',
    'Van Survice',
    'Machine Survice',
    'Factory Rent',
    'Purchase',
    'Truck Vara',
    'Mobile Recharge',
    'Production bill',
    'Interest',
    'Instolment',
  ];

  @override
  Widget build(BuildContext context) {
    final All_Supplier = Provider.of<CounterProvider>(context).allSupplierslist;

    print("All_Supplier ===========> ${All_Supplier.length}");

    return Scaffold(
      appBar: CustomAppBar(
        title: "Meterial Purchase",
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120.0,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 6.0, right: 6.0, top: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Invoice no",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 28.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: Color.fromARGB(255, 7, 125, 180))),
                            child: TextField(
                              controller: _InvoiceNoController,
                              decoration: InputDecoration(
                                enabled: false,
                                filled: true,
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
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Purchase For",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
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
                                hint: Text(
                                  'Selected Product',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                dropdownColor: Color.fromARGB(255, 231, 251,
                                    255), // Not necessary for Option 1
                                value: _selectedPurchase,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedPurchase = newValue!;
                                  });
                                },
                                items: _selectedPurchaseList.map((location) {
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
                        Expanded(
                          flex: 4,
                          child: Text(
                            "Date",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 11,
                          child: Container(
                            height: 28,
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
                                      ? Jiffy(DateTime.now())
                                          .format("dd - MMM - yyyy")
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
                  ],
                ),
              ),
              Container(
                height: 220.0,
                width: double.infinity,
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8),
                      color: Color.fromARGB(255, 107, 134, 146),
                      child: Center(
                        child: Text(
                          'Supplier & Material Information',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Supplier ID",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5, right: 5),
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
                                  'Select Supplier',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ), // Not necessary for Option 1
                                value: _selectedSupplier,
                                onChanged: (newValue) {
                                  setState(() {
                                    print("Supplier Si No ======> $newValue");
                                    _selectedSupplier = newValue.toString();

                                    _selectedSupplier == "General Supplier"
                                        ? isVisible = true
                                        : isVisible = false;
                                    _selectedSupplier == "General Supplier"
                                        ? isEnabled = true
                                        : isEnabled = false;

                                    print(_selectedSupplier);
                                    print(isVisible);
                                  });
                                },
                                items: All_Supplier.map((location) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      "${location.supplierName}",
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    value: location.supplierSlNo,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SupplierPage()));
                            },
                            child: Container(
                              height: 28.0,
                              margin: EdgeInsets.only(bottom: 5, right: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 224, 103, 67),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 165, 56, 28),
                                      width: 1)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Name",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 126, 125, 125)),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 28.0,
                              margin: EdgeInsets.only(bottom: 5),
                              child: TextField(
                                controller: _nameController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
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
                    ),
                    // drop down

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Mobile No",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              controller: _mobileNumberController,
                              enabled: isEnabled,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: isEnabled == true
                                    ? Colors.white
                                    : Colors.grey[200],
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
                    ), // mobile
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Address",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              maxLines: 3,
                              controller: _addressController,
                              enabled: isEnabled,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: isEnabled == true
                                    ? Colors.white
                                    : Colors.grey[200],
                                contentPadding:
                                    EdgeInsets.only(left: 10, top: 10),
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
                    //address
                  ],
                ),
              ),
              Container(
                height: 200.0,
                width: double.infinity,
                margin: EdgeInsets.only(
                  top: 10.0,
                ),
                padding: EdgeInsets.only(top: 10.0, left: 6.0, right: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Material",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 30,
                            margin: EdgeInsets.only(bottom: 5, right: 5),
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
                                  'Select Material',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ), // Not necessary for Option 1
                                value: _selectedProduct,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedProduct = newValue!;
                                  });
                                },
                                items: productList.map((location) {
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
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MaterialsPage()));
                            },
                            child: Container(
                              height: 28.0,
                              margin: EdgeInsets.only(bottom: 5, right: 5),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 224, 103, 67),
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Color.fromARGB(255, 165, 56, 28),
                                      width: 1)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 25.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ), // product

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Mate.Name",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              controller: _mobileNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Pur. Rate",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: TextField(
                              controller: _salesRateController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Qty",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(right: 5),
                            child: TextField(
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                    ), // quantity
                    SizedBox(
                      height: 5,
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Total Amount",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              controller: _mobileNumberController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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

                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 107, 134, 146),
                          ),
                          onPressed: () {},
                          child: Text("Add to cart")),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
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
                              label: Center(child: Text('SL NO')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Material Name')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Category')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Pur. Rate')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Qty')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Total Amount')),
                            ),
                            DataColumn(
                              label: Center(child: Text('Action')),
                            ),
                          ],
                          rows: List.generate(
                            5,
                            (int index) => DataRow(
                              cells: <DataCell>[
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Center(child: Text('Row $index')),
                                ),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.delete))
                                    ],
                                  ),
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
              Container(
                padding: EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: Color.fromARGB(255, 7, 125, 180), width: 1.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      width: double.infinity,
                      color: Color.fromARGB(255, 107, 134, 146),
                      child: Center(
                        child: Text(
                          'Amount Details',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Sub Total",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Vat",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(left: 5, right: 5),
                            child: TextField(
                              controller: _salesRateController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                        Text(
                          "%",
                          style: TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Tr./L. Cost",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(bottom: 5),
                            child: TextField(
                              controller: _transportController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Discount",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 28.0,
                            margin: EdgeInsets.only(bottom: 5, right: 5),
                            child: TextField(
                              controller: _salesRateController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Total",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Paid",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Previous Due",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "Due",
                            style: TextStyle(
                                color: Color.fromARGB(255, 126, 125, 125)),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: 5, bottom: 5, right: 5),
                              height: 30,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(
                                  color: Color.fromARGB(255, 7, 125, 180),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                "",
                              ),
                            )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {},
                            child: Text("Purchase")),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 6, 118, 170),
                            ),
                            onPressed: () {},
                            child: Text("New Purchase")),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
