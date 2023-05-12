import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:myposs/provider/sales_module/stock/provider_category_wise_stock.dart';
import 'package:provider/provider.dart';
import '../../Api_Integration/Api_Modelclass/all_Profit_Loss_class.dart';
import '../../common_widget/custom_appbar.dart';
import '../../provider/sales_module/sales_record/provider_sales_data.dart';

class SalesRecordPage extends StatefulWidget {
  const SalesRecordPage({super.key});
  @override
  State<SalesRecordPage> createState() => _SalesRecordPageState();
}

class _SalesRecordPageState extends State<SalesRecordPage> {
  //main dropdowns logic
  bool isAllTypeClicked = false;
  bool isCustomerWiseClicked = false;
  bool isEmployeeWiseClicked = false;
  bool isCategoryWiseClicked = false;
  bool isQuantityWiseClicked = false;
  bool isSummaryWiseClicked = false;
  bool isUserWiseClicked = false;

  //sub dropdowns logic
  bool isWithoutDetailsClicked = false;
  bool isWithDetailsClicked = false;
  bool iscategoryslect = false;
  bool isQuantitylect = false;

  // dropdown value
  String? _selectedSearchTypes;
  String? _selectedRecordTypes;
  String? _selectedCustomerTypes;
  String? _selectedProductType;
  String? _selectedEmployeeTypes;
  String? _selectedCategoryTypes;
  String? _selectedCategoryyTypes;
  String? _selectedCategoryyyTypes;
  String? _selectedQuantityTypes;
  String? _selectedSummaryTypes;
  String? _selectedUserTypes;

  // util
  double thFontSize = 10.0;
  String data = '';
  String _selectedLocation = '';
  bool selectArea = false;

  //all the dropdown lists
  List<String> _searchTypes = [
    'All',
    'By Customer',
    'By Employee',
    'By Category',
    'By Quantity',
    'By Summary',
    'By User',
  ];

  // List<SaleDetails> _customerList = [  ];
  List Typelist = ["By Category", "By Quantity"];

  List<String> _productList = [
    'Gold Toilet Tissue',
    'Happy Khata',
    'Pencil',
  ];

  List<String> _recordType = [
    'Without Details',
    'With Details',
  ];

  List<String> _employeeList = [
    'Employee 1',
    'Employee 2',
    'Employee 3',
    'Employee 4',
  ];

  List<String> _categoryList = [
    'Employee 1',
    'Employee 2',
    'Employee 3',
    'Employee 4',
  ];

  List<String> _userList = [
    'Admin',
    'user 1',
    'user 2',
    'user 3',
    'user 4',
  ];
  String customerId = "";
  String employeeId = "";
  String productId = "";
  String userFullName = "";
  String categoryId = "";
  final provideSalesdetailsRecordList = [];
  List<SaleDetails> provideSalesdetailsRecordListt = [];
  @override
  void initState() {
    firstPickedDate = "2000-03-01";
    // firstPickedDate=DateFormat('yyyy-MM-dd').format(DateTime.now());
    secondPickedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print(firstPickedDate);
    print(secondPickedDate);
    // Provider.of<AllProductProvider>(context, listen: false).Fatch_By_all_Customer(
    //     context, "", "", "", "", "", "");
    Provider.of<AllProductProvider>(context, listen: false)
        .getAllSalesRecordData(context, firstPickedDate, secondPickedDate,
            customerId, employeeId, productId, userFullName);
    Provider.of<AllProductProvider>(context, listen: false)
        .Fatch_By_all_Employee(context, firstPickedDate, secondPickedDate,
            customerId, employeeId, productId, userFullName);
    Provider.of<AllProductProvider>(context, listen: false)
        .getAllSalesRecordbyemployeeData(context, firstPickedDate,
            secondPickedDate, customerId, employeeId, productId, userFullName);
    // Provider.of<AllProductProvider>(context, listen: false).FetchAllProduct(context);

    Provider.of<CategoryWiseStockProvider>(context, listen: false)
        .getCategoryWiseStockData(context, categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provideSalesRecordList =
        Provider.of<AllProductProvider>(context).provideSalesRecordList;
    final get_all_customer =
        Provider.of<AllProductProvider>(context).by_all_customer_list;
    final get_all_Employee = Provider.of<AllProductProvider>(context)
        .By_all_employee_ModelClass_List;
    final get_all_ByEmployeesalce_record =
        Provider.of<AllProductProvider>(context).ByemployeeallSalesRecordList;
    final FetchCategorySalseDataList =
        Provider.of<AllProductProvider>(context).ByemployeeallSalesRecordList;
    final FetchAllProductList =
        Provider.of<AllProductProvider>(context).AllProductModelClassList;
    final FetchBySummaryProductlist =
        Provider.of<AllProductProvider>(context).FetchBySummaryProductList;
    final FetchUserBySummaryProductlist =
        Provider.of<AllProductProvider>(context).Datalistt;
    final FetchCustomerwiseCategory =
        Provider.of<AllProductProvider>(context).CustomerCategoriesList;
    //  final CategoryWiseSaleDetailsList = Provider.of<AllProductProvider>(context).CategoryWiseSaleDetailsList;
    final AllCategoryList = Provider.of<CategoryWiseStockProvider>(context)
        .provideCategoryWiseStockList;
    final CategoryWiseSaleDetailsList =
        Provider.of<AllProductProvider>(context).FetchCategoryySalseDataListt;

    // print("token : ${GetStorage().read("token")}");
    // print("get_all_ByEmployeesalce_record : ${get_all_ByEmployeesalce_record.length}");
    // print("get_all_FetchCategorySalseDataList  : ${FetchCategorySalseDataList.length}");
    // print("get_all_FetchCategorySalseDataList  : ${FetchAllProductList.length}");
    // print("get_all_FetchBySummaryProductlist  : ${FetchBySummaryProductlist.length}");
    // print("FetchUserBySummaryProductlist  : ${FetchUserBySummaryProductlist.length}");
    // print("FetchUserBySummaryProductlist  : ${CategoryWiseSaleDetailsList.length}");
    // print("id : ${GetStorage().read("id")}");
    // print("name : ${GetStorage().read("name")}");
    // print("usertype : ${GetStorage().read("usertype")}");
    // print("image_name : ${GetStorage().read("image_name")}");
    // print("branch : ${GetStorage().read("branch")}");
    // print("customerId ${customerId}");
    // print("employeeId ${employeeId}");
    // print("productId ${productId}");
    // print("userFullName ${userFullName}");
    // print("lengthhhhhhhhhhhhhhhhhh${firstPickedDate}");
    // print("lengthhhhhhhhhhhhhhhhhh${secondPickedDate}");
    // print("lengthhhhhhhhhhhhhhhhhh${get_all_customer.length}");
    // print("lengthhhhhhhhhhhhhhhhhh${provideSalesRecordList.length}");
    // print("ProducccccccccccccccccccccccfirstPickedDate $firstPickedDate");
    // print("ProducccccccccccccccccccccccsecondPickedDate $secondPickedDate");
    // print("ProduccccccccccccccccccccccccustomerId $customerId");
    // print("ProducccccccccccccccccccccccemployeeId $employeeId");
    // print("ProducccccccccccccccccccccccproductId $productId");
    // print("ProducccccccccccccccccccccccuserFullName $userFullName");

    print(
        "gggggggggggggggggggggggggggggggggggggggggggggg===Categorywisesalesrecord=====> ${CategoryWiseSaleDetailsList.length} ");
    return Scaffold(
      appBar: CustomAppBar(title: "Sales Record"),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Search Type:",
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
                                  'Please select a type',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ), // Not necessary for Option 1
                                value: _selectedSearchTypes,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSearchTypes = newValue.toString();
                                    _selectedSearchTypes == "All"
                                        ? isAllTypeClicked = true
                                        : isAllTypeClicked = false;

                                    _selectedSearchTypes == "By Customer"
                                        ? isCustomerWiseClicked = true
                                        : isCustomerWiseClicked = false;

                                    _selectedSearchTypes == "By Employee"
                                        ? isEmployeeWiseClicked = true
                                        : isEmployeeWiseClicked = false;

                                    _selectedSearchTypes == "By Category"
                                        ? isCategoryWiseClicked = true
                                        : isCategoryWiseClicked = false;

                                    _selectedSearchTypes == "By Quantity"
                                        ? isQuantityWiseClicked = true
                                        : isQuantityWiseClicked = false;

                                    _selectedSearchTypes == "By Summary"
                                        ? isSummaryWiseClicked = true
                                        : isSummaryWiseClicked = false;

                                    _selectedSearchTypes == "By User"
                                        ? isUserWiseClicked = true
                                        : isUserWiseClicked = false;
                                  });
                                },
                                items: _searchTypes.map((location) {
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
                            )),
                      ),
                    ],
                  ),
                ),

                isAllTypeClicked == true
                    ? Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Record Type:",
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
                                      'Please select a record type',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ), // Not necessary for Option 1
                                    value: _selectedRecordTypes,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedRecordTypes = newValue!;
                                        _selectedRecordTypes ==
                                                "Without Details"
                                            ? isWithoutDetailsClicked = true
                                            : isWithoutDetailsClicked = false;
                                        _selectedRecordTypes == "With Details"
                                            ? isWithDetailsClicked = true
                                            : isWithDetailsClicked = false;
                                      });
                                    },
                                    items: _recordType.map((location) {
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
                                )),
                          ),
                        ],
                      )
                    : Container(),

                isCustomerWiseClicked == true
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                flex: 4,
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
                                      ), // Not necessary for Option 1
                                      value: _selectedCustomerTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          print(
                                              "Customerttttttttttttttttttttttttttt $newValue");
                                          _selectedCustomerTypes =
                                              newValue.toString();
                                          customerId = "$newValue";
                                          Provider.of<AllProductProvider>(
                                                  context,
                                                  listen: false)
                                              .getAllSalesRecordData(
                                                  context,
                                                  firstPickedDate,
                                                  secondPickedDate,
                                                  customerId,
                                                  employeeId,
                                                  productId,
                                                  userFullName);
                                          print(
                                              "Customerttttttttttttttttttttttttttt $newValue");
                                          for (int i = 0;
                                              i <=
                                                  provideSalesRecordList.length;
                                              i++) {
                                            print(
                                                "provideSaccccccccclesRecordList  ${provideSalesRecordList[i].customerName}");
                                            for (int j = 0;
                                                j <=
                                                    provideSalesRecordList[i]
                                                        .saleDetails!
                                                        .length;
                                                j++) {
                                              //provideSalesdetailsRecordListt.add(provideSalesRecordList[i].!saleDetails[j]);
                                            }
                                          }
                                        });
                                      },
                                      items: get_all_customer.map((location) {
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
                              )
                            ],
                          ), //Customer
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Product:",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
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
                                        "Please select a product",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      value: _selectedProductType,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedProductType =
                                              newValue.toString();
                                          productId = "$newValue";
                                          print(
                                              "Produccccccccccccccccccccccc $newValue");
                                          Provider.of<AllProductProvider>(
                                                  context,
                                                  listen: false)
                                              .getAllSalesRecordData(
                                                  context,
                                                  firstPickedDate,
                                                  secondPickedDate,
                                                  customerId,
                                                  employeeId,
                                                  productId,
                                                  userFullName);
                                        });
                                      },
                                      items: provideSalesdetailsRecordListt
                                          .map((location) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            "${location.productName}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                            overflow: TextOverflow.visible,
                                          ),
                                          value: location.productIDNo,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ), //Product
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Record Type:",
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
                                          'Please select a record type',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ), // Not necessary for Option 1
                                        value: _selectedRecordTypes,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedRecordTypes = newValue!;
                                            _selectedRecordTypes ==
                                                    "Without Details"
                                                ? isWithoutDetailsClicked = true
                                                : isWithoutDetailsClicked =
                                                    false;
                                            _selectedRecordTypes ==
                                                    "With Details"
                                                ? isWithDetailsClicked = true
                                                : isWithDetailsClicked = false;
                                            Provider.of<AllProductProvider>(
                                                    context,
                                                    listen: false)
                                                .getAllSalesRecordData(
                                                    context,
                                                    firstPickedDate,
                                                    secondPickedDate,
                                                    customerId,
                                                    employeeId,
                                                    productId,
                                                    userFullName);
                                          });
                                        },
                                        items: _recordType.map((location) {
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
                                    )),
                              ),
                            ],
                          ), //Record Type
                        ],
                      )
                    : Container(),

                isEmployeeWiseClicked == true
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Employee:",
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
                                        'Please select an Employee',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedEmployeeTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedEmployeeTypes =
                                              newValue.toString();
                                          employeeId = "$newValue";

                                          print(
                                              "Employeeeeeeeeeeeeeeeeeeee  id :${newValue}");
                                        });
                                      },
                                      items: get_all_Employee.map((location) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            "${location.employeeName}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          value: location.employeeSlNo,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // Employee
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Record Type:",
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
                                          'Please select a record type',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ), // Not necessary for Option 1
                                        value: _selectedRecordTypes,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedRecordTypes = newValue!;
                                            _selectedRecordTypes ==
                                                    "Without Details"
                                                ? isWithoutDetailsClicked = true
                                                : isWithoutDetailsClicked =
                                                    false;
                                            _selectedRecordTypes ==
                                                    "With Details"
                                                ? isWithDetailsClicked = true
                                                : isWithDetailsClicked = false;
                                          });
                                        },
                                        items: _recordType.map((location) {
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
                                    )),
                              ),
                            ],
                          ), // Record Type
                        ],
                      )
                    : Container(),

                isCategoryWiseClicked == true
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        'Please select a Customer',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedCustomerTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedCustomerTypes =
                                              newValue.toString();
                                          print(
                                              "Customer wise Id : =  $newValue");
                                          customerId = "${newValue}";
                                          Provider.of<AllProductProvider>(
                                                  context,
                                                  listen: false)
                                              .FetchCustomerCategoriesSaleProduct(
                                                  context,
                                                  customerId,
                                                  firstPickedDate,
                                                  secondPickedDate);
                                        });
                                      },
                                      items: get_all_customer.map((location) {
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
                              )
                            ],
                          ), // Employee
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Category:",
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
                                        'Please select a Category',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedCategoryTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedCategoryTypes =
                                              newValue.toString();
                                          print(
                                              "Customer Wise Category ID========== > $newValue ");
                                          categoryId =
                                              "$_selectedCategoryTypes";
                                        });
                                      },
                                      items: FetchCustomerwiseCategory.map(
                                          (location) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            "${location.productCategoryName}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          value: location.productCategorySlNo,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    : Container(),

                isQuantityWiseClicked == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Product:",
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
                                    'Please select a Product',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ), // Not necessary for Option 1
                                  value: _selectedQuantityTypes,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedQuantityTypes =
                                          newValue.toString();
                                      print(
                                          "ProductID============>SINO?  ${newValue.toString()}");
                                    });
                                  },
                                  items: FetchAllProductList.map((location) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        "${location.productName}",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      value: location.productSlNo,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),

                isSummaryWiseClicked == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Product:",
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
                              padding: const EdgeInsets.only(left: 5, right: 5),
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
                                    'Please select a Product',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ), // Not necessary for Option 1
                                  value: _selectedSummaryTypes,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selectedSummaryTypes =
                                          newValue.toString();

                                      productId = "${_selectedSummaryTypes}";

                                      Provider.of<AllProductProvider>(context,
                                              listen: false)
                                          .FetchBySummaryProduct(
                                              context,
                                              firstPickedDate,
                                              secondPickedDate,
                                              customerId,
                                              employeeId,
                                              productId,
                                              userFullName);
                                    });
                                  },

                                  items: FetchAllProductList.map((location) {
                                    return DropdownMenuItem(
                                      child: Text(
                                        "${location.productName}",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      value: location.productSlNo,
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Container(),
                isUserWiseClicked == true
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "User:",
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
                                        'Please select a Product',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedUserTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedUserTypes =
                                              newValue.toString();

                                          print(
                                              "Usser sNo==============> ${newValue}");
                                        });
                                      },
                                      items: FetchUserBySummaryProductlist.map(
                                          (location) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            "${location.fullName}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          value: location.userSlNo,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Type:",
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
                                        'By Category',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedCategoryyTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedCategoryyTypes =
                                              newValue.toString();
                                          if ("${newValue}" == "By Category") {
                                            iscategoryslect = true;
                                          } else {
                                            iscategoryslect = false;
                                          }
                                        });
                                      },
                                      items: Typelist.map((location) {
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
                          iscategoryslect == true
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Category:",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        height: 30,
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 7, 125, 180),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            hint: Text(
                                              'Please select a Category',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ), // Not necessary for Option 1
                                            value: _selectedCategoryTypes,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedCategoryTypes =
                                                    newValue.toString();

                                                print(
                                                    "Proguct Category SI No========== ${newValue}");
                                              });
                                            },
                                            items:
                                                AllCategoryList.map((location) {
                                              return DropdownMenuItem(
                                                child: Text(
                                                  "${location.productCategoryName}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                value: location
                                                    .productCategorySlNo,
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        "Quantity:",
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        height: 30,
                                        padding:
                                            EdgeInsets.only(left: 5, right: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Color.fromARGB(
                                                255, 7, 125, 180),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            isExpanded: true,
                                            hint: Text(
                                              'Please select a Quantity',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ), // Not necessary for Option 1
                                            value: _selectedCategoryyyTypes,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _selectedCategoryyyTypes =
                                                    newValue.toString();

                                                print(
                                                    "Quantity SI No========== ${newValue}");
                                              });
                                            },
                                            items: FetchAllProductList.map(
                                                (location) {
                                              return DropdownMenuItem(
                                                child: Text(
                                                  "${location.productSlNo}",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                value: location.productSlNo,
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Product:",
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
                                        'Please select a Product',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ), // Not necessary for Option 1
                                      value: _selectedQuantityTypes,
                                      onChanged: (newValue) {
                                        setState(() {
                                          _selectedQuantityTypes =
                                              newValue.toString();

                                          print(
                                              "Product Srial No =========== > ${newValue}");
                                        });
                                      },
                                      items:
                                          FetchAllProductList.map((location) {
                                        return DropdownMenuItem(
                                          child: Text(
                                            "${location.productName}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                          value: location.productSlNo,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Record Type:",
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
                                          'Please select a record type',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ), // Not necessary for Option 1
                                        value: _selectedRecordTypes,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _selectedRecordTypes = newValue!;
                                            _selectedRecordTypes ==
                                                    "Without Details"
                                                ? isWithoutDetailsClicked = true
                                                : isWithoutDetailsClicked =
                                                    false;
                                            _selectedRecordTypes ==
                                                    "With Details"
                                                ? isWithDetailsClicked = true
                                                : isWithDetailsClicked = false;
                                          });
                                        },
                                        items: _recordType.map((location) {
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
                                    )),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 4,
                  ),
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
                /////////////////////////////////////////////////////////////////////////////////////////////////// // Date Picker
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    color: Color.fromARGB(255, 3, 91, 150),
                    padding: EdgeInsets.all(1.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          // AllType
                          if (isAllTypeClicked && isWithoutDetailsClicked) {
                            data = 'showAllWithoutDetails';
                          } else if (isAllTypeClicked && isWithDetailsClicked) {
                            data = 'showAllWithDetails';
                          }
                          // By Customer
                          else if (isCustomerWiseClicked &&
                              isWithoutDetailsClicked) {
                            Provider.of<AllProductProvider>(context,
                                    listen: false)
                                .getAllSalesRecordData(
                                    context,
                                    firstPickedDate,
                                    secondPickedDate,
                                    customerId,
                                    employeeId,
                                    productId,
                                    userFullName);
                            data = 'showByCustomerWithoutDetails';
                          } else if (isCustomerWiseClicked &&
                              isWithDetailsClicked) {
                            Provider.of<AllProductProvider>(context,
                                    listen: false)
                                .getAllSalesRecordData(
                                    context,
                                    firstPickedDate,
                                    secondPickedDate,
                                    customerId,
                                    employeeId,
                                    productId,
                                    userFullName);
                            data = 'showByCustomerWithDetails';
                          }
                          // By Employee
                          else if (isEmployeeWiseClicked &&
                              isWithoutDetailsClicked) {
                            data = 'showByEmployeeWithoutDetails';
                            Provider.of<AllProductProvider>(context,
                                    listen: false)
                                .getAllSalesRecordbyemployeeData(
                                    context,
                                    firstPickedDate,
                                    secondPickedDate,
                                    customerId,
                                    employeeId,
                                    productId,
                                    userFullName);
                          } else if (isEmployeeWiseClicked &&
                              isWithDetailsClicked) {
                            Provider.of<AllProductProvider>(context,
                                    listen: false)
                                .getAllSalesRecordbyemployeeData(
                                    context,
                                    firstPickedDate,
                                    secondPickedDate,
                                    customerId,
                                    employeeId,
                                    productId,
                                    userFullName);
                            data = 'showByEmployeeWithDetails';
                          }
                          // By Category
                          else if (isCategoryWiseClicked) {
                            data = 'showByCategoryDetails';
                            Provider.of<AllProductProvider>(context,
                                    listen: false)
                                .FetchCategoryySalseDataList(firstPickedDate,
                                    secondPickedDate, customerId, categoryId);
                          }
                          // By Quantity
                          else if (isQuantityWiseClicked) {
                            data = 'showByQuantityDetails';
                          }
                          // By Summary
                          else if (isSummaryWiseClicked) {
                            data = 'showBySummaryDetails';
                          }

                          // By User
                          else if (isUserWiseClicked &&
                              isWithoutDetailsClicked) {
                            data = 'showByUserWithoutDetails';
                            Provider.of<AllProductProvider>(context,
                                    listen: false)
                                .FetchByUsergetAllSaleProduct(
                                    context,
                                    firstPickedDate,
                                    secondPickedDate,
                                    customerId,
                                    employeeId,
                                    productId,
                                    userFullName);
                          } else if (isUserWiseClicked &&
                              isWithDetailsClicked) {
                            data = 'showByUserWithDetails';
                            Provider.of<AllProductProvider>(context,
                                    listen: false)
                                .FetchByUsergetAllSaleProduct(
                                    context,
                                    firstPickedDate,
                                    secondPickedDate,
                                    customerId,
                                    employeeId,
                                    productId,
                                    userFullName);
                          }
                        });
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
          data == 'showAllWithoutDetails'
              ? Expanded(
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
                            border: TableBorder.all(
                                color: Colors.black54, width: 1),
                            columns: [
                              DataColumn(
                                label: Center(child: Text('Invoice No')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Date')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Customer Name')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Saved By')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Sub Total')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Discount')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Total')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Paid')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Due')),
                              ),
                              DataColumn(
                                label: Center(child: Text('Action')),
                              ),
                            ],
                            rows: List.generate(
                              provideSalesRecordList.length,
                              (int index) => DataRow(
                                cells: <DataCell>[
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${provideSalesRecordList[index].saleMasterInvoiceNo}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${provideSalesRecordList[index].saleMasterSaleDate}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${provideSalesRecordList[index].customerName}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${provideSalesRecordList[index].updateBy}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            "${provideSalesRecordList[index].saleMasterSubTotalAmount}")),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${provideSalesRecordList[index].saleMasterTotalDiscountAmount}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${provideSalesRecordList[index].saleMasterTotalSaleAmount}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${provideSalesRecordList[index].saleMasterDueAmount}')),
                                  ),
                                  DataCell(
                                    Center(
                                        child: Text(
                                            '${provideSalesRecordList[index].saleMasterPaidAmount}')),
                                  ),
                                  DataCell(
                                    Center(child: Text('Row $index')),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : data == 'showAllWithDetails'
                  ? Expanded(
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
                                border: TableBorder.all(
                                    color: Colors.black54, width: 1),
                                columns: [
                                  DataColumn(
                                    label: Center(child: Text('Invoice No')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Date')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Customer Name')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Saved By')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Sub Total')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Discount')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Total')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Paid')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Due')),
                                  ),
                                  DataColumn(
                                    label: Center(child: Text('Action')),
                                  ),
                                ],
                                rows: List.generate(
                                  provideSalesRecordList.length,
                                  (int index) => DataRow(
                                    cells: <DataCell>[
                                      DataCell(
                                        Center(
                                            child: Text(
                                                "${provideSalesRecordList[index].saleMasterInvoiceNo}")),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Text(
                                                '${provideSalesRecordList[index].saleMasterSaleDate}')),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Text(
                                                '${provideSalesRecordList[index].customerName}')),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Text(
                                                '${provideSalesRecordList[index].updateBy}')),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Text(
                                                "${provideSalesRecordList[index].saleMasterSubTotalAmount}")),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Text(
                                                '${provideSalesRecordList[index].saleMasterTotalDiscountAmount}')),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Text(
                                                '${provideSalesRecordList[index].saleMasterTotalSaleAmount}')),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Text(
                                                '${provideSalesRecordList[index].saleMasterDueAmount}')),
                                      ),
                                      DataCell(
                                        Center(
                                            child: Text(
                                                '${provideSalesRecordList[index].saleMasterPaidAmount}')),
                                      ),
                                      DataCell(
                                        Center(child: Text('Row $index')),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : data == 'showByCustomerWithoutDetails'
                      ? Expanded(
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
                                    border: TableBorder.all(
                                        color: Colors.black54, width: 1),
                                    columns: [
                                      DataColumn(
                                        label:
                                            Center(child: Text('Invoice No')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Date')),
                                      ),
                                      DataColumn(
                                        label: Center(
                                            child: Text('Customer Name')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Saved By')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Sub Total')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Discount')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Total')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Paid')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Due')),
                                      ),
                                      DataColumn(
                                        label: Center(child: Text('Action')),
                                      ),
                                    ],
                                    rows: List.generate(
                                      provideSalesRecordList.length,
                                      (int index) => DataRow(
                                        cells: <DataCell>[
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    "${provideSalesRecordList[index].saleMasterInvoiceNo}")),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    '${provideSalesRecordList[index].saleMasterSaleDate}')),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    '${provideSalesRecordList[index].customerName}')),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    '${provideSalesRecordList[index].updateBy}')),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    "${provideSalesRecordList[index].saleMasterSubTotalAmount}")),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    '${provideSalesRecordList[index].saleMasterTotalDiscountAmount}')),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    '${provideSalesRecordList[index].saleMasterTotalSaleAmount}')),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    '${provideSalesRecordList[index].saleMasterDueAmount}')),
                                          ),
                                          DataCell(
                                            Center(
                                                child: Text(
                                                    '${provideSalesRecordList[index].saleMasterPaidAmount}')),
                                          ),
                                          DataCell(
                                            Center(child: Text('Row $index')),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : data == 'showByCustomerWithDetails'
                          ? Expanded(
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
                                        border: TableBorder.all(
                                            color: Colors.black54, width: 1),
                                        columns: [
                                          DataColumn(
                                            label: Center(
                                                child: Text('Invoice No')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Date')),
                                          ),
                                          DataColumn(
                                            label: Center(
                                                child: Text('Customer Name')),
                                          ),
                                          DataColumn(
                                            label:
                                                Center(child: Text('Saved By')),
                                          ),
                                          DataColumn(
                                            label: Center(
                                                child: Text('Product Name')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Price')),
                                          ),
                                          DataColumn(
                                            label:
                                                Center(child: Text('Quantity')),
                                          ),
                                          DataColumn(
                                            label: Center(child: Text('Total')),
                                          ),
                                          DataColumn(
                                            label:
                                                Center(child: Text('Action')),
                                          ),
                                        ],
                                        rows: List.generate(
                                          provideSalesRecordList.length,
                                          (int index) => DataRow(
                                            cells: <DataCell>[
                                              DataCell(
                                                Center(
                                                    child: Text(
                                                        "${provideSalesRecordList[index].saleMasterInvoiceNo}")),
                                              ),
                                              DataCell(
                                                Center(
                                                    child: Text(
                                                        '${provideSalesRecordList[index].saleMasterSaleDate}')),
                                              ),
                                              DataCell(
                                                Center(
                                                    child: Text(
                                                        '${provideSalesRecordList[index].customerName}')),
                                              ),
                                              DataCell(
                                                Center(
                                                    child: Text(
                                                        '${provideSalesRecordList[index].updateBy}')),
                                              ),
                                              DataCell(
                                                Center(
                                                    child: Text(
                                                        '${provideSalesRecordList[index]}')),
                                              ),
                                              DataCell(
                                                Center(
                                                    child: Text('Row $index')),
                                              ),
                                              DataCell(
                                                Center(
                                                    child: Text('Row $index')),
                                              ),
                                              DataCell(
                                                Center(
                                                    child: Text('Row $index')),
                                              ),
                                              DataCell(
                                                Center(
                                                    child: Text('Row $index')),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : data == 'showByEmployeeWithoutDetails'
                              ? Expanded(
                                  child: get_all_ByEmployeesalce_record
                                              .length ==
                                          0
                                      ? Container(
                                          color: Colors.orange[100],
                                        )
                                      : Container(
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
                                                  border: TableBorder.all(
                                                      color: Colors.black54,
                                                      width: 1),
                                                  columns: [
                                                    DataColumn(
                                                      label: Center(
                                                          child: Text(
                                                              'Invoice No')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child: Text('Date')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child: Text(
                                                              'Customer Name')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child:
                                                              Text('Saved By')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child: Text(
                                                              'Sub Total')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child:
                                                              Text('Discount')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child: Text('Total')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child: Text('Paid')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child: Text('Due')),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                          child:
                                                              Text('Action')),
                                                    ),
                                                  ],
                                                  rows: List.generate(
                                                    get_all_ByEmployeesalce_record
                                                        .length,
                                                    (int index) => DataRow(
                                                      cells: <DataCell>[
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].saleMasterInvoiceNo}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].saleMasterSaleDate}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].customerName}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].addBy}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].saleMasterSubTotalAmount}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].saleMasterTotalDiscountAmount}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].saleMasterTotalSaleAmount}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].saleMasterPaidAmount}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  '${get_all_ByEmployeesalce_record[index].saleMasterDueAmount}')),
                                                        ),
                                                        DataCell(
                                                          Center(
                                                              child: Text(
                                                                  'Row $index')),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                )
                              : data == 'showByEmployeeWithDetails'
                                  ? Expanded(
                                      child: get_all_ByEmployeesalce_record
                                                  .length ==
                                              0
                                          ? Container(
                                              color: Colors.orange[100],
                                            )
                                          : Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Container(
                                                    // color: Colors.red,
                                                    // padding:EdgeInsets.only(bottom: 16.0),
                                                    child: DataTable(
                                                      showCheckboxColumn: true,
                                                      border: TableBorder.all(
                                                          color: Colors.black54,
                                                          width: 1),
                                                      columns: [
                                                        DataColumn(
                                                          label: Center(
                                                              child: Text(
                                                                  'Invoice No')),
                                                        ),
                                                        DataColumn(
                                                          label: Center(
                                                              child:
                                                                  Text('Date')),
                                                        ),
                                                        DataColumn(
                                                          label: Center(
                                                              child: Text(
                                                                  'Customer Name')),
                                                        ),
                                                        DataColumn(
                                                          label: Center(
                                                              child: Text(
                                                                  'Saved By')),
                                                        ),
                                                        DataColumn(
                                                          label: Center(
                                                              child: Text(
                                                                  'Product Name')),
                                                        ),
                                                        DataColumn(
                                                          label: Center(
                                                              child: Text(
                                                                  'Price')),
                                                        ),
                                                        DataColumn(
                                                          label: Center(
                                                              child: Text(
                                                                  'Quantity')),
                                                        ),
                                                        DataColumn(
                                                          label: Center(
                                                              child: Text(
                                                                  'Total')),
                                                        ),
                                                        DataColumn(
                                                          label: Center(
                                                              child: Text(
                                                                  'Action')),
                                                        ),
                                                      ],
                                                      rows: List.generate(
                                                        30,
                                                        (int index) => DataRow(
                                                          cells: <DataCell>[
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                            DataCell(
                                                              Center(
                                                                  child: Text(
                                                                      'Row $index')),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                    )
                                  : data == 'showByCategoryDetails'
                                      ? Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Container(
                                                  // color: Colors.red,
                                                  // padding:EdgeInsets.only(bottom: 16.0),
                                                  child: DataTable(
                                                    showCheckboxColumn: true,
                                                    border: TableBorder.all(
                                                        color: Colors.black54,
                                                        width: 1),
                                                    columns: [
                                                      DataColumn(
                                                        label: Center(
                                                            child: Text(
                                                                'Invoice No')),
                                                      ),
                                                      DataColumn(
                                                        label: Center(
                                                            child:
                                                                Text('Date')),
                                                      ),
                                                      DataColumn(
                                                        label: Center(
                                                            child: Text(
                                                                'Customer Name')),
                                                      ),
                                                      DataColumn(
                                                        label: Center(
                                                            child: Text(
                                                                'Product Name')),
                                                      ),
                                                      DataColumn(
                                                        label: Center(
                                                            child: Text(
                                                                'Sales Rate')),
                                                      ),
                                                      DataColumn(
                                                        label: Center(
                                                            child: Text(
                                                                'DueAmount')),
                                                      ),
                                                      DataColumn(
                                                        label: Center(
                                                            child:
                                                                Text('Total')),
                                                      ),
                                                    ],
                                                    rows: List.generate(
                                                      CategoryWiseSaleDetailsList
                                                          .length,
                                                      (int index) => DataRow(
                                                        cells: <DataCell>[
                                                          DataCell(
                                                            Center(
                                                                child: Text(
                                                                    '${CategoryWiseSaleDetailsList[index].saleMasterInvoiceNo}')),
                                                          ),
                                                          DataCell(
                                                            Center(
                                                                child: Text(
                                                                    '${CategoryWiseSaleDetailsList[index].saleMasterSaleDate}')),
                                                          ),
                                                          DataCell(
                                                            Center(
                                                                child: Text(
                                                                    '${CategoryWiseSaleDetailsList[index].customerName}')),
                                                          ),
                                                          DataCell(
                                                            Center(
                                                                child: Text(
                                                                    '${CategoryWiseSaleDetailsList[index].brunchName}')),
                                                          ),
                                                          DataCell(
                                                            Center(
                                                                child: Text(
                                                                    '${CategoryWiseSaleDetailsList[index].addBy}')),
                                                          ),
                                                          DataCell(
                                                            Center(
                                                                child: Text(
                                                                    '${CategoryWiseSaleDetailsList[index].saleMasterDueAmount}')),
                                                          ),
                                                          DataCell(
                                                            Center(
                                                                child: Text(
                                                                    '${CategoryWiseSaleDetailsList[index].saleMasterTotalSaleAmount}')),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      : data == 'showByQuantityDetails'
                                          ? Expanded(
                                              child: data ==
                                                      'showByQuantityDetails'
                                                  ? Container()
                                                  : Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child:
                                                          SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Container(
                                                            // color: Colors.red,
                                                            // padding:EdgeInsets.only(bottom: 16.0),
                                                            child: DataTable(
                                                              showCheckboxColumn:
                                                                  true,
                                                              border: TableBorder.all(
                                                                  color: Colors
                                                                      .black54,
                                                                  width: 1),
                                                              columns: [
                                                                DataColumn(
                                                                  label: Center(
                                                                      child: Text(
                                                                          'Invoice No')),
                                                                ),
                                                                DataColumn(
                                                                  label: Center(
                                                                      child: Text(
                                                                          'Date')),
                                                                ),
                                                                DataColumn(
                                                                  label: Center(
                                                                      child: Text(
                                                                          'Customer Name')),
                                                                ),
                                                                DataColumn(
                                                                  label: Center(
                                                                      child: Text(
                                                                          'Product Name')),
                                                                ),
                                                                DataColumn(
                                                                  label: Center(
                                                                      child: Text(
                                                                          'Sales Rate')),
                                                                ),
                                                                DataColumn(
                                                                  label: Center(
                                                                      child: Text(
                                                                          'Quantity')),
                                                                ),
                                                                DataColumn(
                                                                  label: Center(
                                                                      child: Text(
                                                                          'Total')),
                                                                ),
                                                              ],
                                                              rows:
                                                                  List.generate(
                                                                30,
                                                                (int index) =>
                                                                    DataRow(
                                                                  cells: <
                                                                      DataCell>[
                                                                    DataCell(
                                                                      Center(
                                                                          child:
                                                                              Text('Row $index')),
                                                                    ),
                                                                    DataCell(
                                                                      Center(
                                                                          child:
                                                                              Text('Row $index')),
                                                                    ),
                                                                    DataCell(
                                                                      Center(
                                                                          child:
                                                                              Text('Row $index')),
                                                                    ),
                                                                    DataCell(
                                                                      Center(
                                                                          child:
                                                                              Text('Row $index')),
                                                                    ),
                                                                    DataCell(
                                                                      Center(
                                                                          child:
                                                                              Text('Row $index')),
                                                                    ),
                                                                    DataCell(
                                                                      Center(
                                                                          child:
                                                                              Text('Row $index')),
                                                                    ),
                                                                    DataCell(
                                                                      Center(
                                                                          child:
                                                                              Text('Row $index')),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            )
                                          : data == 'showBySummaryDetails'
                                              ? Expanded(
                                                  child:
                                                      FetchBySummaryProductlist
                                                                  .length ==
                                                              0
                                                          ? Container(
                                                              color:
                                                                  Colors.orange,
                                                            )
                                                          : Container(
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              child:
                                                                  SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child:
                                                                      Container(
                                                                    // color: Colors.red,
                                                                    // padding:EdgeInsets.only(bottom: 16.0),
                                                                    child:
                                                                        DataTable(
                                                                      showCheckboxColumn:
                                                                          true,
                                                                      border: TableBorder.all(
                                                                          color: Colors
                                                                              .black54,
                                                                          width:
                                                                              1),
                                                                      columns: [
                                                                        DataColumn(
                                                                          label:
                                                                              Center(child: Text('Product Code')),
                                                                        ),
                                                                        DataColumn(
                                                                          label:
                                                                              Center(child: Text('Product Name')),
                                                                        ),
                                                                        DataColumn(
                                                                          label:
                                                                              Center(child: Text('Total Quantity')),
                                                                        ),
                                                                        DataColumn(
                                                                          label:
                                                                              Center(child: Text('Total Amount')),
                                                                        ),
                                                                      ],
                                                                      rows: List
                                                                          .generate(
                                                                        FetchBySummaryProductlist
                                                                            .length,
                                                                        (int index) =>
                                                                            DataRow(
                                                                          cells: <
                                                                              DataCell>[
                                                                            DataCell(
                                                                              Center(child: Text('${FetchBySummaryProductlist[index].saleDetails![0].productName}')),
                                                                            ),
                                                                            DataCell(
                                                                              Center(child: Text('${FetchBySummaryProductlist[index].saleDetails![0].productName}')),
                                                                            ),
                                                                            DataCell(
                                                                              Center(child: Text('${FetchBySummaryProductlist[index].saleDetails![0].saleDetailsTotalQuantity}')),
                                                                            ),
                                                                            DataCell(
                                                                              Center(child: Text('Row $index')),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                )
                                              : data ==
                                                      'showByUserWithoutDetails'
                                                  ? Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          child:
                                                              SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Container(
                                                              // color: Colors.red,
                                                              // padding:EdgeInsets.only(bottom: 16.0),
                                                              child: DataTable(
                                                                showCheckboxColumn:
                                                                    true,
                                                                border: TableBorder.all(
                                                                    color: Colors
                                                                        .black54,
                                                                    width: 1),
                                                                columns: [
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Invoice No')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Date')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Customer Name')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Saved By')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Sub Total')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Discount')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Total')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Paid')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Due')),
                                                                  ),
                                                                  DataColumn(
                                                                    label: Center(
                                                                        child: Text(
                                                                            'Action')),
                                                                  ),
                                                                ],
                                                                rows: List
                                                                    .generate(
                                                                  30,
                                                                  (int index) =>
                                                                      DataRow(
                                                                    cells: <
                                                                        DataCell>[
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                      DataCell(
                                                                        Center(
                                                                            child:
                                                                                Text('Row $index')),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  : data ==
                                                          'showByUserWithDetails'
                                                      ? Expanded(
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child:
                                                                  SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child:
                                                                    Container(
                                                                  // color: Colors.red,
                                                                  // padding:EdgeInsets.only(bottom: 16.0),
                                                                  child:
                                                                      DataTable(
                                                                    showCheckboxColumn:
                                                                        true,
                                                                    border: TableBorder.all(
                                                                        color: Colors
                                                                            .black54,
                                                                        width:
                                                                            1),
                                                                    columns: [
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Invoice No')),
                                                                      ),
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Date')),
                                                                      ),
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Customer Name')),
                                                                      ),
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Saved By')),
                                                                      ),
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Product Name')),
                                                                      ),
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Price')),
                                                                      ),
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Quantity')),
                                                                      ),
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Total')),
                                                                      ),
                                                                      DataColumn(
                                                                        label: Center(
                                                                            child:
                                                                                Text('Action')),
                                                                      ),
                                                                    ],
                                                                    rows: List
                                                                        .generate(
                                                                      30,
                                                                      (int index) =>
                                                                          DataRow(
                                                                        cells: <
                                                                            DataCell>[
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
                                                                            Center(child: Text('Row $index')),
                                                                          ),
                                                                          DataCell(
                                                                            Center(child: Text('Row $index')),
                                                                          ),
                                                                          DataCell(
                                                                            Center(child: Text('Row $index')),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      : Container()
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
        Provider.of<AllProductProvider>(context, listen: false)
            .getAllSalesRecordbyemployeeData(
                context,
                firstPickedDate,
                secondPickedDate,
                customerId,
                employeeId,
                productId,
                userFullName);

        Provider.of<AllProductProvider>(context, listen: false)
            .getAllSalesRecordData(context, firstPickedDate, secondPickedDate,
                customerId, employeeId, productId, userFullName);
        Provider.of<AllProductProvider>(context, listen: false)
            .FetchBySummaryProduct(context, firstPickedDate, secondPickedDate,
                customerId, employeeId, productId, userFullName);

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

        Provider.of<AllProductProvider>(context, listen: false)
            .FetchBySummaryProduct(context, firstPickedDate, secondPickedDate,
                customerId, employeeId, productId, userFullName);
        Provider.of<AllProductProvider>(context, listen: false)
            .getAllSalesRecordData(context, firstPickedDate, secondPickedDate,
                customerId, employeeId, productId, userFullName);
        print("secondPickedDate $secondPickedDate");
      });
    }
  }
}
