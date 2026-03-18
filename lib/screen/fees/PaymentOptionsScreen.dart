/*
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/constant/sizes.dart';
import 'package:school_management/screen/fees/razorpay_webview_screen.dart';

import 'PayPalPaymentScreen.dart';

class PaymentOptionsScreen extends StatelessWidget {
  final String invoiceId;
  final String amount; // already passed as string

  const PaymentOptionsScreen({
    super.key,
    required this.invoiceId,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Payment Method",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(HRSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Invoice Details
            Text(
              "Invoice ID: $invoiceId",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Amount: ₹$amount",
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: redColor),
            ),
            const SizedBox(height: 20),

            // Razorpay Option
            PaymentOptionCard(
              icon: Icons.payment,
              title: "Razorpay",
              onTap: () async {
                final result = await Get.to(() => PaymentScreen(
                  orderId: "order_DBJOWzybf0sJbb", // from backend
                  amount: double.tryParse(amount) ?? 0.0,
                ));

                if (result == "success") {
                  Fluttertoast.showToast(msg: "Payment Successful!");
                } else if (result == "failed") {
                  Fluttertoast.showToast(msg: "Payment Failed!");
                }
              },            ),

            // PayPal Option
            PaymentOptionCard(
              icon: Icons.payment,
              title: "PayPal",
              onTap: () async {
                final result = await Get.to(() => PayPalPaymentScreen(
                  amount: double.tryParse(amount) ?? 0.0,
                ));

                if (result != null) {
                  if (result["status"] == "success") {
                    Fluttertoast.showToast(msg: "PayPal Payment Successful ✅");
                  } else if (result["status"] == "error") {
                    Fluttertoast.showToast(msg: "PayPal Payment Failed ❌");
                  } else if (result["status"] == "cancelled") {
                    Fluttertoast.showToast(msg: "Payment Cancelled ⚠️");
                  }
                }
              },            ),

            // PhonePe Option
            PaymentOptionCard(
              icon: Icons.phone_android,
              title: "PhonePe",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("PhonePe clicked")),
                );
              },
            ),

            // Paytm Option
            PaymentOptionCard(
              icon: Icons.account_balance_wallet,
              title: "Paytm",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Paytm clicked")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const PaymentOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: HRSizes.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HRSizes.cardRadiusMd),
      ),
      child: ListTile(
        leading: Icon(icon, color: appColor),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}*/






import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:school_management/constant/colors.dart';
import 'package:school_management/constant/sizes.dart';
import 'package:school_management/screen/fees/razorpay_webview_screen.dart';
import 'package:school_management/screen/fees/PayPalPaymentScreen.dart';

import '../../authentication/Fees/fees_provider.dart';

class PaymentOptionsScreen extends StatelessWidget {
  final String invoiceId;
  final String amount;

  const PaymentOptionsScreen({
    super.key,
    required this.invoiceId,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Payment Method",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: appColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(HRSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            /// Invoice Details
            Text(
              "Invoice ID: $invoiceId",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Amount: ₹$amount",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: redColor),
            ),
            const SizedBox(height: 20),

            /// ================= RAZORPAY =================
            PaymentOptionCard(
              icon: Icons.payment,
              title: "Razorpay",
              onTap: () async {
                final result = await Get.to(() => PaymentScreen(
                  orderId: "order_DBJOWzybf0sJbb",
                  amount: double.tryParse(amount) ?? 0.0,
                ));

                if (result == "success") {
                  final provider =
                  Provider.of<FeesProvider>(context, listen: false);

                  bool isSaved = await provider.submitPayment(
                    invoiceId: invoiceId, // ✅ IMPORTANT
                    amount: amount,
                    method: "razorpay",
                  );

                  if (isSaved) {
                    await provider.fetchUnpaid();
                    await provider.fetchHistory();

                    Fluttertoast.showToast(
                        msg: "Payment Recorded ✅");

                    Get.back(); // 🔥 go back to fees screen
                  } else {
                    Fluttertoast.showToast(
                        msg: "Payment Save Failed ❌");
                  }
                } else {
                  Fluttertoast.showToast(msg: "Payment Failed ❌");
                }
              },
            ),

            /// ================= PAYPAL =================
            PaymentOptionCard(
              icon: Icons.payment,
              title: "PayPal",
              onTap: () async {
                final result = await Get.to(() => PayPalPaymentScreen(
                  amount: double.tryParse(amount) ?? 0.0,
                ));
                print("Payment Result: $result");

                if (result != null && result["status"] == "success") {
                  final provider =
                  Provider.of<FeesProvider>(context, listen: false);

                  bool isSaved = await provider.submitPayment(
                    invoiceId: invoiceId,
                    amount: amount,
                    method: "paypal",
                  );

                  if (isSaved) {
                    await provider.fetchUnpaid();
                    await provider.fetchHistory();

                    Fluttertoast.showToast(
                        msg: "PayPal Payment Recorded ✅");

                    Get.back();
                  } else {
                    Fluttertoast.showToast(
                        msg: "Payment Save Failed ❌");
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: "PayPal Payment Failed ❌");
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}




class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const PaymentOptionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: HRSizes.sm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HRSizes.cardRadiusMd),
      ),
      child: ListTile(
        leading: Icon(icon, color: appColor),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
