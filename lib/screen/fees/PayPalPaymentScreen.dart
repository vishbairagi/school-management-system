import 'package:flutter/material.dart';
import 'package:school_management/constant/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayPalPaymentScreen extends StatefulWidget {
  final double amount;

  const PayPalPaymentScreen({super.key, required this.amount});

  @override
  State<PayPalPaymentScreen> createState() => _PayPalPaymentScreenState();
}

class _PayPalPaymentScreenState extends State<PayPalPaymentScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // 🔥 Replace this with your PayPal payment URL (from backend)
    String paymentUrl =
        "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_xclick&business=sb-symkh49868874@business.example.com&amount=${widget.amount}&currency_code=USD";

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            // ✅ Success URL
            if (request.url.contains("success")) {
              Navigator.pop(context, "success");
              return NavigationDecision.prevent;
            }

            // ❌ Cancel URL
            if (request.url.contains("cancel")) {
              Navigator.pop(context, "cancel");
              return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PayPal Payment",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: appColor,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}