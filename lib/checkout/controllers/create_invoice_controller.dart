import 'package:crafty_bay/api/api_caller.dart';
import 'package:crafty_bay/api/api_response.dart';
import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/checkout/models/payment_gateway_list_model.dart';
import 'package:crafty_bay/utilities/urls.dart';
import 'package:get/get.dart';

class CreateInvoiceController extends GetxController {
  bool _inProgress = false;
  PaymentGatewayListModel? _paymentGatewayList = PaymentGatewayListModel();

  bool get inProgress => _inProgress;
  PaymentGatewayListModel? get paymentGatewayList => _paymentGatewayList;

  Future<bool> createInvoice() async {
    bool status = true;
    _inProgress = true;
    update();
    ApiResponse res = await ApiCaller().apiGetRequest(
      url: Urls.createInvoice,
      token: AuthController.token.toString(),
    );
    _inProgress = false;
    update();
    if (res.isSuccess) {
      if (res.jsonResponse['data'] != null &&
          res.jsonResponse['data'].isNotEmpty) {
        _paymentGatewayList =
            PaymentGatewayListModel.fromJson(res.jsonResponse);
      }
    } else {
      status = false;
    }
    return status;
  }
}
