import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/controllers/auth/auth_controller.dart';
import 'package:crafty_bay/models/invoice/invoice_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  bool _inProgress = false;
  List<InvoiceModel> _invoiceList = [];

  bool get inProgress => _inProgress;
  List<InvoiceModel>? get invoiceList => _invoiceList;

  Future<bool> getInvoiceList() async {
    bool status = true;
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
      url: Urls.listInvoice,
      token: AuthController.token.toString(),
    );

    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse != null && res.jsonResponse.isNotEmpty) {
        final List<InvoiceModel> data = [];
        res.jsonResponse.forEach((v) {
          data.add(InvoiceModel.fromJson(v));
        });
        _invoiceList = data;
      }
    } else {
      status = false;
    }
    return status;
  }
}
