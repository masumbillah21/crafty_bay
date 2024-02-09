import 'package:crafty_bay/global/screens/bottom_nav_screen.dart';
import 'package:crafty_bay/home/controllers/bottom_nav_controller.dart';
import 'package:crafty_bay/invoices/screens/invoice_screen.dart';
import 'package:crafty_bay/utilities/utilities.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewScreen extends StatefulWidget {
  static const routeName = '/payment';
  const PaymentWebViewScreen({super.key});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  final String _url = Get.arguments;
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.endsWith('success') ||
                request.url.endsWith('success&risk_level=1')) {
              showPopup(
                title: "Success",
                context: context,
                content: "Your payment has been succeeded.",
                firstButtonText: 'Continue',
                firstButtonAction: () {
                  Get.offAllNamed(InvoiceScreen.routeName);
                },
                secondButtonAction: () {
                  Get.offAllNamed(BottomNavScreen.routeName);
                  Get.find<BottomNavController>().backToHome();
                },
              );
              return NavigationDecision.prevent;
            } else if (request.url.endsWith('Failed')) {
              showPopup(
                title: "Failed",
                context: context,
                content: "Your payment failed to proceed.",
                firstButtonText: 'Continue',
                firstButtonAction: () {
                  Get.offAllNamed(InvoiceScreen.routeName);
                },
                secondButtonAction: () {
                  Get.offAllNamed(BottomNavScreen.routeName);
                  Get.find<BottomNavController>().backToHome();
                },
              );
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(_url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
