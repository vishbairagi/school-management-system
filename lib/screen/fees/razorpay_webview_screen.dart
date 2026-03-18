import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:school_management/constant/colors.dart';

class PaymentScreen extends StatefulWidget {
  final String orderId;
  final double amount;

  const PaymentScreen({
    super.key,
    required this.orderId,
    required this.amount,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Razorpay razorpay;

  @override
  void initState() {
    super.initState();

    razorpay = Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  // 👉 Open Razorpay on button click
  void openCheckout() {
    var options = {
      'key': 'rzp_test_SPo04XlYyw3Vyh',
      'amount': (widget.amount * 100).toInt(),
      'name': 'School Management',
      'description': 'Fees Payment',
      //'order_id': widget.orderId, // ✅ from backend
      'prefill': {
        'contact': '9999999999',
        'email': 'test@email.com'
      }
    };

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  // ✅ SUCCESS
  void handlePaymentSuccess(PaymentSuccessResponse response) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Payment Successful ✅"),
        content: Text("Payment ID:\n${response.paymentId}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, "success");
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // ❌ FAILURE
  void handlePaymentError(PaymentFailureResponse response) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Payment Failed ❌"),
        content: Text(response.message ?? "Something went wrong"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context, "failed");
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // 💳 WALLET
  void handleExternalWallet(ExternalWalletResponse response) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("External Wallet"),
        content: Text("Wallet: ${response.walletName}"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  // 🎨 UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: appColor
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Razorpay Payment",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              Card(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.payment,
                        color: appColor,
                        size: 60,
                      ),
                      const SizedBox(height: 20),

                      Text(
                        'Pay ₹${widget.amount} securely',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: openCheckout,
                          child: const Text(
                            'Proceed to Pay',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}