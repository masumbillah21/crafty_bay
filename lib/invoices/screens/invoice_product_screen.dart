import 'package:crafty_bay/invoices/controllers/invoice_details_controller.dart';
import 'package:crafty_bay/utilities/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InvoiceProductScreen extends StatelessWidget {
  static const routeName = "/invoice-product";
  const InvoiceProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = Get.arguments;
    Get.find<InvoiceDetailsController>().getInvoiceDetailsList(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoice Product'),
      ),
      body: GetBuilder<InvoiceDetailsController>(builder: (details) {
        return ListView.separated(
          itemCount: details.invoiceDetailsList?.length ?? 0,
          itemBuilder: (context, index) {
            var item = details.invoiceDetailsList![index];
            return ListTile(
              leading: Image.network(
                item.product?.image ?? '',
                errorBuilder: (context, _, __) =>
                    SvgPicture.asset(AssetsPath.logo),
              ),
              title: Text(item.product?.title ?? ''),
              subtitle: Text("Qyt: ${item.qty} | Total: ৳${item.salePrice}"),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        );
      }),
    );
  }
}
