import 'package:crafty_bay/auth/controllers/auth_controller.dart';
import 'package:crafty_bay/checkout/controllers/create_invoice_controller.dart';
import 'package:crafty_bay/checkout/screens/payment_web_view_screen.dart';
import 'package:crafty_bay/users/screens/update_profile_screen.dart';
import 'package:crafty_bay/utilities/app_colors.dart';
import 'package:crafty_bay/utilities/app_messages.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';
  const CheckoutScreen({super.key});

  void _getPaymentDetailsAndMethod() async {
    await Get.find<CreateInvoiceController>().createInvoice();
  }

  void _isLogin() async {
    bool login = await AuthController().checkAuthState();
    var customer = Get.find<AuthController>().customer;
    if (!login) {
      AuthController.goToLogin();
    } else if (customer?.cusName?.isEmpty ?? true) {
      Get.offNamedUntil(UpdateProfileScreen.routeName, (route) => false);
      errorToast(AppMessages.emptyMessage("profile"));
    }
  }

  @override
  Widget build(BuildContext context) {
    _isLogin();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getPaymentDetailsAndMethod();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<CreateInvoiceController>(builder: (invoice) {
          return Visibility(
            visible: !invoice.inProgress,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total: "),
                    Text(
                        "৳${invoice.paymentGatewayList?.paymentList?.first.total ?? 0}"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("VAT: "),
                    Text(
                        "(+) ৳${invoice.paymentGatewayList?.paymentList?.first.vat ?? 0}"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Payable: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "৳${invoice.paymentGatewayList?.paymentList?.first.payable ?? 0}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Click on payment method below to make payment",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: invoice.paymentGatewayList?.paymentList?.first
                            .paymentMethodList?.length ??
                        0,
                    itemBuilder: (context, index) {
                      var item = invoice.paymentGatewayList?.paymentList?.first
                          .paymentMethodList![index];
                      return ListTile(
                        onTap: () {
                          Get.toNamed(PaymentWebViewScreen.routeName,
                              arguments: {'url': item!.redirectGatewayURL!});
                        },
                        leading: Image.network(item?.logo ?? ''),
                        title: Text(item?.name?.toUpperCase() ?? ''),
                        subtitle: Text(item?.type?.toUpperCase() ?? ''),
                        trailing: const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppColors.primaryColor,
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
