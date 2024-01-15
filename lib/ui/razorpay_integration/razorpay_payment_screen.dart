import 'package:flutter/material.dart';

import 'package:flutter_bloc_demo/ui/razorpay_integration/razorpat_service.dart';

class RazorpayPaymentScreen extends StatefulWidget {
  RazorpayPaymentScreen({Key? key}) : super(key: key);

  @override
  State<RazorpayPaymentScreen> createState() => _RazorpayPaymentScreenState();
}

class _RazorpayPaymentScreenState extends State<RazorpayPaymentScreen> {

  @override
  void initState() {
    RazorPayUtils().init();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {},
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(),
            ElevatedButton(
              onPressed: () {

                RazorPayUtils().performPayment();
              },
              child: const Text("Pay"),
            ),
          ],
        ),
      ),
    );
  }
}
