import 'package:flutter/material.dart';
import 'package:nssaccounting/Utility.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';

class PaymentInfo {
  Payment? paymentMode;
  PaymentType? paymentType;
  String? transactionRefNo;
}

class PaymentWidget extends StatefulWidget {
  PaymentInfo? paymentInfo;
  PaymentWidget({Key? key, this.paymentInfo}) : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  final _transactionController = TextEditingController();

  @override
  void initState() {
    _transactionController.text = widget.paymentInfo?.transactionRefNo ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //return Card getPaymentWidget() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 5),
                Flexible(
                  child: ListTile(
                    title: const Text('Cash'),
                    leading: Radio<Payment>(
                      value: Payment.cash,
                      groupValue: widget.paymentInfo?.paymentMode,
                      onChanged: (Payment? value) {
                        setState(() {
                          widget.paymentInfo?.paymentMode = value;
                        });
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: ListTile(
                    title: const Text('Bank'),
                    leading: Radio<Payment>(
                      value: Payment.bank,
                      groupValue: widget.paymentInfo?.paymentMode,
                      onChanged: (Payment? value) {
                        setState(() {
                          widget.paymentInfo?.paymentMode = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (widget.paymentInfo?.paymentMode == Payment.bank)
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Divider(),
                  ListTile(
                    title: Text('Online'),
                    leading: Radio<PaymentType>(
                        value: PaymentType.online,
                        groupValue: widget.paymentInfo?.paymentType,
                        onChanged: (PaymentType? value) {
                          setState(() {
                            widget.paymentInfo?.paymentType = value;
                          });
                        }),
                  ),
                  ListTile(
                    title: Text('Cheque'),
                    leading: Radio<PaymentType>(
                        value: PaymentType.cheque,
                        groupValue: widget.paymentInfo?.paymentType,
                        onChanged: (PaymentType? value) {
                          setState(() {
                            widget.paymentInfo?.paymentType = value;
                          });
                        }),
                  ),
                  ListTile(
                    title: Text('DD'),
                    leading: Radio<PaymentType>(
                        value: PaymentType.dd,
                        groupValue: widget.paymentInfo?.paymentType,
                        onChanged: (PaymentType? value) {
                          setState(() {
                            widget.paymentInfo?.paymentType = value;
                          });
                        }),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onChanged: (text) {
                      widget.paymentInfo?.transactionRefNo = text;
                      print(widget.paymentInfo?.transactionRefNo);
                    },
                    controller: _transactionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Transacton Number';
                      }
                      return null;
                    },
                    // style: TextStyle(height: 0.5),
                    decoration: CommonStyle.textFieldStyle(
                        labelTextStr: "Transacton Number",
                        hintTextStr: "Enter Transacton Number"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
