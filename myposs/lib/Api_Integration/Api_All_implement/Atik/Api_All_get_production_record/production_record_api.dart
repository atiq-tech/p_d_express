import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:myposs/Api_Integration/Api_Modelclass/production_record_model_class.dart';
import 'package:myposs/const_page.dart';

class ApiallProductionRecord {
  static GetApiProductionRecord(
      context, String? dateFrom, String? dateTo) async {
    String Link = "${BaseUrl}api/v1/getProductionRecord";
    List<ProductionRecordModelClass> allProductionRecordlist = [];
    ProductionRecordModelClass productionRecordModelClass;
    try {
      var response = await Dio().post(Link,
          data: {"dateFrom": "2023-03-13", "dateTo": "2023-03-21"},
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));

      var data = jsonDecode(response.data);

      for (var i in data) {
        productionRecordModelClass = ProductionRecordModelClass.fromJson(i);
        allProductionRecordlist.add(productionRecordModelClass);
      }
      print("production_record=========daaaataaa============production_record");
      print(
          "allProductionRecordlista================= ${allProductionRecordlist.length}");
    } catch (e) {
      print("Something is wrong all production_record=======:$e");
    }
    return allProductionRecordlist;
  }
}
