import 'package:flutter/material.dart';

import '../../Api_Integration/Api_All_implement/Riaz/all_api_implement.dart';
import '../../Api_Integration/Api_Modelclass/Uzzal_All_Model_Class/all_purchase_modelclass.dart';

class GetPurchaseProvider extends ChangeNotifier {
  List<Purchases> providePurchaseList = [];
  getPurchaseData(
    context,
    String? dateFrom,
    String? dateTo,
  ) async {
    providePurchaseList = await AllApiImplement.FetchAllPurchaseData(
      context,
      dateFrom,
      dateTo,
    );
    notifyListeners();
  }
}
