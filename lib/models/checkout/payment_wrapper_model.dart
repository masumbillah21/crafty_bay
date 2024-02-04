import 'package:crafty_bay/models/checkout/payment_gateway_model.dart';

class PaymentWrapperModel {
  List<PaymentGatewayModel>? paymentMethodList;
  int? payable;
  int? vat;
  int? total;

  PaymentWrapperModel(
      {this.paymentMethodList, this.payable, this.vat, this.total});

  PaymentWrapperModel.fromJson(Map<String, dynamic> json) {
    if (json['paymentMethod'] != null) {
      paymentMethodList = <PaymentGatewayModel>[];
      json['paymentMethod'].forEach((v) {
        paymentMethodList!.add(PaymentGatewayModel.fromJson(v));
      });
    }
    payable = json['payable'];
    vat = json['vat'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paymentMethodList != null) {
      data['paymentMethod'] =
          paymentMethodList!.map((v) => v.toJson()).toList();
    }
    data['payable'] = payable;
    data['vat'] = vat;
    data['total'] = total;
    return data;
  }
}
