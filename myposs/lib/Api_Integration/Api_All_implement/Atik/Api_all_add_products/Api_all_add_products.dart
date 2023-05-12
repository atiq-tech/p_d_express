import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myposs/const_page.dart';
import 'package:myposs/provider/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class ApiAllAddProduct {
  static GetApiAllAddProduct(
    context,
    String? ProductCategory_ID,
    String? Product_Code,
    String? Product_Name,
    String? Product_Purchase_Rate,
    String? Product_ReOrederLevel,
    String? Product_SellingPrice,
    String? Product_SlNo,
    String? Product_WholesaleRate,
    String? Unit_ID,
    String? brand,
    bool? is_service,
    String? vat,
  ) async {
    String Link = "${BaseUrl}api/v1/addProduct";

    try {
      Response response = await Dio().post(Link,
          data: {
            "ProductCategory_ID": "$ProductCategory_ID",
            "Product_Code": "$Product_Code",
            "Product_Name": "$Product_Name",
            "Product_Purchase_Rate": "$Product_Purchase_Rate",
            "Product_ReOrederLevel": "$Product_ReOrederLevel",
            "Product_SellingPrice": "$Product_SellingPrice",
            "Product_SlNo": "$Product_SlNo",
            "Product_WholesaleRate": "$Product_WholesaleRate",
            "Unit_ID": "$Unit_ID",
            "brand": "$brand",
            "is_service": is_service,
            "vat": "$vat"
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${GetStorage().read("token")}",
          }));
      print("AddProduct AddProduct AddProduct:${response.data}");
      print("===========++++++=============");
      print("AddProduct AddProduct AddProduct");
      print("============+++++++++++++++=========");

      var data = jsonDecode(response.data);
      Provider.of<CounterProvider>(context, listen: false).getProducts(context);
      print("AddProduct AddProduct length is ${data}");
    } catch (e) {
      print("Something is wrong AddProduct=======:$e");
    }
  }
}
