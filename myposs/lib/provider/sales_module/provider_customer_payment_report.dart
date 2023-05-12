import '../../Api_Integration/Api_All_implement/Riaz/all_api_implement.dart';
import 'package:flutter/material.dart';

import '../../Api_Integration/Api_Modelclass/purchase_module/supplier_payment_report_model.dart';

class CustomerPaymentReportProvider extends ChangeNotifier {
  List<Payments> provideCustomerPaymentReportList = [];
  getCustomerPaymentData(
    context,
    String? customerId,
    String? dateFrom,
    String? dateTo,
  ) async {
    provideCustomerPaymentReportList =
        await AllApiImplement.FetchCustomerPaymentReport(
      context,
      customerId,
      dateFrom,
      dateTo,
    );
    notifyListeners();
  }
}
