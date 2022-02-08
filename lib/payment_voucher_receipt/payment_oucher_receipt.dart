import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/model/payment.dart';
import 'package:nssaccounting/model/user.dart';

class PaymentVoucherReceipt extends StatefulWidget {
  PaymentVoucherReceipt({Key? key, this.Payment, this.loggedInUser})
      : super(key: key);

  final PaymentDatas? Payment;
  final AppUser? loggedInUser;

  @override
  State<PaymentVoucherReceipt> createState() => _PaymentVoucherReceiptState();
}

class _PaymentVoucherReceiptState extends State<PaymentVoucherReceipt> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
  String? paymentDate;

  @override
  void initState() {
    if (widget.Payment?.paymentDate != null) {
      final paymDt = widget.Payment?.paymentDate;
      paymentDate = formatter.format(paymDt!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment Receipt Preview '),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(26, 30, 26, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(child: Text("NSS ACCOUNTING")),
                // Center(child: Text("Payment Receipt")),
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
                    Text('Account/Head', style: commonTextStyle()),
                    Text(widget.Payment?.accountHead ?? "",
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment Date', style: commonTextStyle()),
                    Text(paymentDate ?? '', style: commonTextStyle()),
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
                    Text('Payment Mode', style: commonTextStyle()),
                    Text(widget.Payment?.paymentMode ?? "",
                        style: commonTextStyle()),
                  ],
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Authorized By', style: commonTextStyle()),
                    Text(widget.Payment?.authorizedBy ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Prepared By', style: commonTextStyle()),
                    Text("${widget.loggedInUser?.name}",
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),

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
