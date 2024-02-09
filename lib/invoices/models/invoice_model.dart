class InvoiceModel {
  int? id;
  String? total;
  String? vat;
  String? payable;
  String? cusDetails;
  String? shipDetails;
  String? tranId;
  String? valId;
  String? deliveryStatus;
  String? paymentStatus;
  int? userId;
  String? createdAt;
  String? updatedAt;

  InvoiceModel(
      {this.id,
      this.total,
      this.vat,
      this.payable,
      this.cusDetails,
      this.shipDetails,
      this.tranId,
      this.valId,
      this.deliveryStatus,
      this.paymentStatus,
      this.userId,
      this.createdAt,
      this.updatedAt});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    vat = json['vat'];
    payable = json['payable'];
    cusDetails = json['cus_details'];
    shipDetails = json['ship_details'];
    tranId = json['tran_id'];
    valId = json['val_id'];
    deliveryStatus = json['delivery_status'];
    paymentStatus = json['payment_status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total'] = total;
    data['vat'] = vat;
    data['payable'] = payable;
    data['cus_details'] = cusDetails;
    data['ship_details'] = shipDetails;
    data['tran_id'] = tranId;
    data['val_id'] = valId;
    data['delivery_status'] = deliveryStatus;
    data['payment_status'] = paymentStatus;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
