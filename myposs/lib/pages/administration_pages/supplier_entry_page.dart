import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:myposs/common_widget/custom_appbar.dart';
import 'package:myposs/const_page.dart';
import 'package:myposs/provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'dart:io';

import '../../Api_Integration/Api_All_implement/Atik/Api_all_get_suppliers/api_all_suppliers.dart';

class SupplierEntryPage extends StatefulWidget {
  const SupplierEntryPage({super.key});

  @override
  State<SupplierEntryPage> createState() => _SupplierEntryPageState();
}

class _SupplierEntryPageState extends State<SupplierEntryPage> {
  final TextEditingController _supplierIdController = TextEditingController();
  final TextEditingController _supplierNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _previousDueController = TextEditingController();

  ApiAllSuppliers? apiAllSuppliers;
  @override
  void initState() {
    //get Suppliers
    ApiAllSuppliers apiAllSuppliers;
    Provider.of<CounterProvider>(context, listen: false).getSupplier(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //get Suppliers
    final allSuppliersData =
        Provider.of<CounterProvider>(context).allSupplierslist;
    print(
        "Suppliers Suppliers Suppliers=Lenght is:::::${allSuppliersData.length}");
    return Scaffold(
      appBar: CustomAppBar(title: "Supplier Entry"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              child: Container(
                height: 275.0,
                width: double.infinity,
                padding: EdgeInsets.only(top: 6.0, left: 6.0, right: 6.0),
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
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Supplier Id",
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
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromARGB(221, 5, 123, 233))),
                            child: TextField(
                              enabled: false,
                              controller: _supplierIdController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
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
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Supplier Name",
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
                            child: TextField(
                              controller: _supplierNameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
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
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Owner Name",
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
                            child: TextField(
                              controller: _ownerNameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
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
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Address",
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
                            child: TextField(
                              controller: _addressController,
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
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
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Mobile",
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
                            child: TextField(
                              controller: _mobileController,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
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
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Email",
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
                            child: TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
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
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        const Expanded(
                          flex: 5,
                          child: Text(
                            "Previous Due",
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
                            child: TextField(
                              controller: _previousDueController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
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
                    SizedBox(height: 5.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            getSupplierCode();
                          });
                          _AddSupply(context);
                          // print("SupplierId======>>$supplierId");
                          // print("Address======>>${_addressController.text}");
                          // print("Email======>>${_emailController.text}");
                          // print(
                          //     "Supplier Name ======>>${_supplierNameController.text}");
                          // print("Mobile no=====>>${_mobileController.text}");
                          // print(
                          //     "Owner name======>>${_ownerNameController.text}");
                          // print(
                          //     "Previous due=====>>${_previousDueController.text}");
                        },
                        child: Container(
                          height: 35.0,
                          width: 70.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 173, 241, 179),
                                width: 2.0),
                            color: Color.fromARGB(255, 75, 90, 131),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                              child: Text(
                            "SAVE",
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
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 46, 46, 46), width: 2),
                      ),
                      elevation: 10.0,
                      child: images == null
                          ? Image.network(
                              "https://mir-s3-cdn-cf.behance.net/projects/404/3a71ad160389291.Y3JvcCwxMzQyLDEwNTAsMjI5LDA.jpg",
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : Image.file(
                              File(images!.path),
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 76, 89, 146)),
                      onPressed: () {
                        _imageSource = ImageSource.gallery;
                        chooseImageFrom();
                      },
                      child: const Text(
                        "Select Image",
                        style: TextStyle(
                          color: Color.fromARGB(255, 249, 254, 255),
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )),
                ],
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
                            label: Center(child: Text('Supplier Id')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Supplier Name')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Contact Person')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Address')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Contact Number')),
                          ),
                          DataColumn(
                            label: Center(child: Text('Image')),
                          ),
                        ],
                        rows: List.generate(
                          allSuppliersData.length,
                          (int index) => DataRow(
                            cells: <DataCell>[
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allSuppliersData[index].supplierCode}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allSuppliersData[index].supplierName}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allSuppliersData[index].contactPerson}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allSuppliersData[index].supplierAddress}')),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                        '${allSuppliersData[index].supplierMobile}')),
                              ),
                              DataCell(
                                Center(
                                    child: Container(
                                        width: 44.0,
                                        height: 42.0,
                                        color: Colors.black,
                                        child: Image.network(
                                            "http://testapi.happykhata.com/${allSuppliersData[index].imageName}"))),
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

  XFile? images;
  ImageSource _imageSource = ImageSource.gallery;
  chooseImageFrom() async {
    ImagePicker _picker = ImagePicker();
    images = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  _AddSupply(context) async {
    String link = "${BaseUrl}api/v1/addSupplier";
    var formData = FormData.fromMap({
      "data": jsonEncode({
        "Supplier_SlNo": 0,
        "Supplier_Code": "${supplierId.toString().trim()}",
        "Supplier_Name": "${_supplierNameController.text.toString().trim()}",
        "Supplier_Mobile": "${_mobileController.text.toString().trim()}",
        "Supplier_Email": "${_emailController.text.toString().trim()}",
        "Supplier_Address": "${_addressController.text.toString().trim()}",
        "contact_person": "${_ownerNameController.text.toString().trim()}",
        "previous_due": "${_previousDueController.text.toString().trim()}"
      }),
      "image": await MultipartFile.fromFile(images!.path, filename: "fileName"),
    });
    try {
      Response response = await Dio().post(link,
          data: formData,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print(response.data);
      print("success============> ${response.data["success"]}");
      print("message =================> ${response.data["message"]}");
      print("supplierCode================>  ${response.data["supplierCode"]}");
    } catch (e) {
      return e;
    }
  }

  //Get Supplier_Id
  String? supplierId;
  getSupplierCode() async {
    String link = "${BaseUrl}api/v1/getSupplierId";
    try {
      Response response = await Dio().post(
        link,
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${GetStorage().read("token")}",
        }),
      );
      print(response.data);
      var supplierId = jsonDecode(response.data);
      print("SupplierId Code===========> $supplierId");
    } catch (e) {
      print(e);
    }
  }
}
