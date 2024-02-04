import 'package:crafty_bay/models/checkout/payment_wrapper_model.dart';

class PaymentGatewayListModel {
  List<PaymentWrapperModel>? paymentList;

  PaymentGatewayListModel({this.paymentList});

  PaymentGatewayListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      paymentList = <PaymentWrapperModel>[];
      json['data'].forEach((v) {
        paymentList!.add(PaymentWrapperModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (paymentList != null) {
      data['data'] = paymentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
