import 'package:crafty_bay/global/widgets/product_grid.dart';
import 'package:crafty_bay/invoices/controllers/invoice_details_controller.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceProductScreen extends StatelessWidget {
  static const routeName = "/invoice-product";
  const InvoiceProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = Get.arguments['id'] ?? 0;
    Get.find<InvoiceDetailsController>().getInvoiceDetailsList(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Product'),
      ),
      body: GetBuilder<InvoiceDetailsController>(builder: (details) {
        return Visibility(
          visible: !details.inProgress,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: details.invoiceDetailsList?.isNotEmpty ?? false
              ? GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.90,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: details.invoiceDetailsList?.length ?? 0,
                  itemBuilder: (context, index) {
                    var item = details.invoiceDetailsList![index];
                    return FittedBox(
                      child: ProductGrid(
                        productModel: item.product!,
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    AppMessages.emptyMessage('Product'),
                  ),
                ),
        );
      }),
    );
  }
}
