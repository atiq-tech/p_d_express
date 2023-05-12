import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:myposs/Api_Integration/Api_Modelclass/all_suppliers_class.dart';
import 'package:myposs/const_page.dart';

class ApiAllSuppliers {
  static GetApiAllSuppliers(context) async {
    List<AllSuppliersClass> allSupplierslist = [];
    AllSuppliersClass allSuppliersClass;
    try {
      var Response =
          await http.post(Uri.parse("${BaseUrl}api/v1/getSuppliers"), headers: {
        "Authorization": "Bearer ${GetStorage().read("token")}",
      }, body: {});

      print("Supplier data=====Supplier data");

      var data = jsonDecode(Response.body);

      for (var i in data) {
        allSuppliersClass = AllSuppliersClass.fromJson(i);
        allSupplierslist.add(allSuppliersClass);
        //  print(allSupplierslist);
      }
      print(
          "=====allSupplierslist==== ==========: ${allSupplierslist..length}");
    } catch (e) {
      print("Something is wrong:$e");
    }
    return allSupplierslist;
  }
}
