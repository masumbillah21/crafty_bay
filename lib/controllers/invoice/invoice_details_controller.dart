import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/models/invoice/invoice_details_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class InvoiceDetailsController extends GetxController {
  bool _inProgress = false;
  List<InvoiceDetailsModel> _invoiceDetailsList = [];

  bool get inProgress => _inProgress;
  List<InvoiceDetailsModel>? get invoiceDetailsList => _invoiceDetailsList;

  Future<bool> getInvoiceDetailsList(int invoiceId) async {
    bool status = true;
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller()
        .apiGetRequest(url: Urls.invoiceProductList(invoiceId));
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse != null && res.jsonResponse.isNotEmpty) {
        List<InvoiceDetailsModel> data = [];
        res.jsonResponse.forEach((v) {
          data.add(InvoiceDetailsModel.fromJson(v));
        });
        _invoiceDetailsList = data;
      }
    } else {
      status = false;
    }
    return status;
  }
}
