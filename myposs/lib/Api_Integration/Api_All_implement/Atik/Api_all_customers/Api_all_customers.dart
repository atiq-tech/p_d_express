import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:myposs/Api_Integration/Api_Modelclass/all_customers_Class.dart';
import 'package:myposs/const_page.dart';

class ApiAllCustomers {
  static GetApiAllCustomers(context) async {
    //String Link = "${BaseUrl}api/v1/getCustomers";
    List<AllCustomersClass> allCustomerslist = [];
    AllCustomersClass allCustomersClass;
    try {
      var Response =
          await http.post(Uri.parse("${BaseUrl}api/v1/getCustomers"), headers: {
        "Authorization": "Bearer ${GetStorage().read("token")}",
      }, body: {});

      var data = jsonDecode(Response.body);

      for (var i in data) {
        allCustomersClass = AllCustomersClass.fromJson(i);
        allCustomerslist.add(allCustomersClass);
        // print(allCustomerslist);
      }
      print(
          "all Customers list===========================> ${allCustomerslist.length}  ");
    } catch (e) {
      print("Something is wrong all Customers list=======:$e");
    }
    return allCustomerslist;
  }
}
