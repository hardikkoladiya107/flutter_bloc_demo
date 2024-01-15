import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorPayUtils {
  static final RazorPayUtils _singleton = RazorPayUtils._internal();

  factory RazorPayUtils() {
    return _singleton;
  }

  RazorPayUtils._internal();

  Razorpay? _razorpay;

  init() {
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    response;
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    response;
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    response;
  }

  clear() {
    _razorpay?.clear();
  }

  performPayment() {
    var options = {
      'key': 'rzp_test_sR3bDQkkgrcvQM',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    _razorpay?.open(options);
  }
}
