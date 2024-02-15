import 'package:crafty_bay/global/widgets/app_navigation_drawer_widget.dart';
import 'package:crafty_bay/global/widgets/crafty_app_bar.dart';
import 'package:crafty_bay/invoices/controllers/invoice_controller.dart';
import 'package:crafty_bay/invoices/models/invoice_model.dart';
import 'package:crafty_bay/invoices/screens/invoice_product_screen.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceScreen extends StatelessWidget {
  static const routeName = "/invoice";
  const InvoiceScreen({super.key});

  void _callInvoice() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<InvoiceController>().getInvoiceList();
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _callInvoice();
    });
    return Scaffold(
      appBar: const CraftyAppBar(),
      drawer: AppNavigationDrawerWidget(),
      body: RefreshIndicator(
        onRefresh: () async {
          await Get.find<InvoiceController>().getInvoiceList();
        },
        child: GetBuilder<InvoiceController>(
            //init: Get.find<InvoiceController>(),
            builder: (invoice) {
          return Visibility(
            visible: !invoice.inProgress,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: invoice.invoiceList?.isNotEmpty ?? false
                ? Column(
                    children: [
                      Text(
                        "Your Invoice History",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const Divider(),
                      Expanded(
                        child: ListView.builder(
                          itemCount: invoice.invoiceList?.length ?? 0,
                          itemBuilder: (context, index) {
                            InvoiceModel item =
                                invoice.invoiceList!.reversed.toList()[index];
                            return ListTile(
                              onTap: () {
                                Get.toNamed(InvoiceProductScreen.routeName,
                                    arguments: item.id);
                              },
                              leading: Container(
                                alignment: Alignment.center,
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  item.id.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text(
                                  'Pay: ${item.paymentStatus} (৳${item.payable})'),
                              subtitle:
                                  Text('Delivery: ${item.deliveryStatus}'),
                              trailing: const Icon(Icons.arrow_forward_rounded),
                            );
                          },
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Text(
                      AppMessages.emptyMessage("Invoice"),
                    ),
                  ),
          );
        }),
      ),
    );
  }
}
