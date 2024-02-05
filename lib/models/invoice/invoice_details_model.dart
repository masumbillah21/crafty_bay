import 'package:crafty_bay/models/product/product_model.dart';

class InvoiceDetailsModel {
  int? id;
  int? invoiceId;
  int? productId;
  int? userId;
  String? qty;
  String? salePrice;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  InvoiceDetailsModel(
      {this.id,
      this.invoiceId,
      this.productId,
      this.userId,
      this.qty,
      this.salePrice,
      this.createdAt,
      this.updatedAt,
      this.product});

  InvoiceDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invoiceId = json['invoice_id'];
    productId = json['product_id'];
    userId = json['user_id'];
    qty = json['qty'];
    salePrice = json['sale_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
        json['product'] != null ? ProductModel.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['invoice_id'] = invoiceId;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['qty'] = qty;
    data['sale_price'] = salePrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}
