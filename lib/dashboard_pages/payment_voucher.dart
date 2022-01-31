import 'package:flutter/material.dart';

class PaymentVoucher extends StatefulWidget {
  PaymentVoucher({Key? key}) : super(key: key);

  @override
  State<PaymentVoucher> createState() => _PaymentVoucherState();
}

class _PaymentVoucherState extends State<PaymentVoucher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Voucher"),
      ),
      body: Text('Payment Voucher content goes here'),
    );
  }
}
