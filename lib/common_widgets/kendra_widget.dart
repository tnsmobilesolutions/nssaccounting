import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/common_widgets/payment_widget.dart';
import 'package:nssaccounting/data/auth.dart';
import 'package:nssaccounting/data/receiptAPI.dart';
import 'package:nssaccounting/model/receipt.dart';

import '../utility.dart';

// ignore: must_be_immutable
class KendraWidget extends StatefulWidget {
  KendraWidget({Key? key}) : super(key: key);

  @override
  State<KendraWidget> createState() => _KendraWidgetState();
}

class _KendraWidgetState extends State<KendraWidget> {
  final _formKey = GlobalKey<FormState>();

  Payment? _paymentMode = Payment.cash;

  PaymentType? _paymentType = PaymentType.online;

  final _sanghaNameController = TextEditingController();

  final _nameController = TextEditingController();

  final _amountController = TextEditingController();

  final _transactionController = TextEditingController();

  final _paidController = TextEditingController();

  final _remarkController = TextEditingController();

  final _paymentInfo = PaymentInfo();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: _sanghaNameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Sangha Name';
              }
              return null;
            },
            // style: TextStyle(height: 0.5),
            decoration: CommonStyle.textFieldStyle(
              labelTextStr: "Sangha Name",
              hintTextStr: "Enter Sangha Name",
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Your Name';
              }
              return null;
            },
            // style: TextStyle(height: 0.5),
            decoration: CommonStyle.textFieldStyle(
              labelTextStr: "Name",
              hintTextStr: "Enter Name",
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            keyboardType: TextInputType.number,
            controller: _amountController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Amount';
              }
              return null;
            },
            // style: TextStyle(height: 0.5),
            decoration: CommonStyle.textFieldStyle(
                labelTextStr: "Amount", hintTextStr: "Enter Amount"),
          ),
          SizedBox(height: 12),
          Card(
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
                            groupValue: _paymentMode,
                            onChanged: (Payment? value) {
                              setState(() {
                                _paymentMode = value;
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
                            groupValue: _paymentMode,
                            onChanged: (Payment? value) {
                              setState(() {
                                _paymentMode = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_paymentMode == Payment.bank)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Divider(),
                        ListTile(
                          title: Text('Online'),
                          leading: Radio<PaymentType>(
                              value: PaymentType.online,
                              groupValue: _paymentType,
                              onChanged: (PaymentType? value) {
                                setState(() {
                                  _paymentType = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: Text('Cheque'),
                          leading: Radio<PaymentType>(
                              value: PaymentType.cheque,
                              groupValue: _paymentType,
                              onChanged: (PaymentType? value) {
                                setState(() {
                                  _paymentType = value;
                                });
                              }),
                        ),
                        ListTile(
                          title: Text('DD'),
                          leading: Radio<PaymentType>(
                              value: PaymentType.dd,
                              groupValue: _paymentType,
                              onChanged: (PaymentType? value) {
                                setState(() {
                                  _paymentType = value;
                                });
                              }),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
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
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: _paidController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Paid By';
              }
              return null;
            },
            // style: TextStyle(height: 0.5),
            decoration: CommonStyle.textFieldStyle(
              labelTextStr: "Paid By",
              hintTextStr: "Enter Paid By",
            ),
          ),
          SizedBox(height: 12),
          TextFormField(
            controller: _remarkController,
            // style: TextStyle(height: 0.5),
            decoration: CommonStyle.textFieldStyle(
                labelTextStr: "Remarks", hintTextStr: "Remarks"),
          ),
          SizedBox(height: 18),
          ElevatedButton(
            style: CommonStyle.elevatedSubmitButtonStyle(),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Receipt receipt = Receipt(
                  accountCode: "SMPrP",
                  amount: double.parse(_amountController.text),
                  devoteeId: "NA",
                  notMember: null,
                  paaliaName: _nameController.text,
                  paymentMode: Utility.getPaymentModeString(_paymentMode),
                  paymentType: Utility.getPaymentTypeString(_paymentType),
                  preparedBy: Login.loggedInUser?.userId,
                  receiptDate: DateTime.now(),
                  receiptId: "",
                  receiptNo: Utility.getReceiptNo(),
                  remarks: _remarkController.text,
                  transactionRefNo: _paymentMode == Payment.bank
                      ? _transactionController.text
                      : null,
                );
                final receiptId = ReceiptAPI().createNewReceipt(receipt);
                print(receiptId);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data Submitted.')),
                );
              }
              print(_sanghaNameController.text);
              print(_nameController.text);
              print(_amountController.text);
              print(_paymentMode);
              if (_paymentMode == Payment.bank) {
                print(_paymentInfo.paymentMode);
                print(_paymentInfo.paymentType);
                print(_transactionController.text);
              }
              print(_paidController.text);
              print(_remarkController.text);
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
