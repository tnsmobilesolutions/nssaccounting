import 'package:flutter/material.dart';
import 'package:nssaccounting/model/payment.dart';

class PaymentVoucherReceipt extends StatefulWidget {
  PaymentVoucherReceipt({Key? key, this.Payment}) : super(key: key);

  final PaymentDatas? Payment;

  @override
  State<PaymentVoucherReceipt> createState() => _PaymentVoucherReceiptState();
}

class _PaymentVoucherReceiptState extends State<PaymentVoucherReceipt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Receipt Preview '),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(26, 30, 26, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.Payment?.voucherNo ?? '',
                    style: commonTextStyle(),
                  ),
                ),
                SizedBox(height: 16),
                Divider(color: Colors.black, thickness: 2.0),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Voucher No', style: commonTextStyle()),
                    Text(widget.Payment?.voucherNo ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Paymenr Date', style: commonTextStyle()),
                    Text(widget.Payment?.paymentDate ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Amount', style: commonTextStyle()),
                    Text(widget.Payment?.amount ?? "",
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Account/Head', style: commonTextStyle()),
                    Text(widget.Payment?.accountHead ?? "",
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('Payment', style: commonTextStyle()),
                //     Text(widget.receipt?.paymentMode ?? '',
                //         style: commonTextStyle()),
                //   ],
                // ),
                // SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('Paid By', style: commonTextStyle()),
                //     Text(widget.receipt?.paidBy ?? '',
                //         style: commonTextStyle()),
                //   ],
                // ),
                // SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Received By', style: commonTextStyle()),
                    Text('widget.loggedInUser?.name', style: commonTextStyle()),
                    Text('data')
                  ],
                ),
                SizedBox(height: 30),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('Remark', style: commonTextStyle()),
                //     Text(widget.receipt?.remarks ?? '',
                //         style: commonTextStyle()),
                //   ],
                // ),
                // SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("SHARE"),
                      style: ElevatedButton.styleFrom(
                          elevation: 20, shadowColor: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("PRINT"),
                      style: ElevatedButton.styleFrom(
                          elevation: 20, shadowColor: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  TextStyle commonTextStyle() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);
  }
}
