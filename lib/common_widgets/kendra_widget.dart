import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/common_widgets/payment_widget.dart';
import 'package:nssaccounting/data/auth.dart';
import 'package:nssaccounting/data/receiptAPI.dart';
import 'package:nssaccounting/model/receipt.dart';
import 'package:nssaccounting/search/receipt_preview.dart';
import 'package:nssaccounting/utility.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class KendraWidget extends StatefulWidget {
  KendraWidget({Key? key, this.accountCodeName}) : super(key: key);

  final String? accountCodeName;

  @override
  State<KendraWidget> createState() => _KendraWidgetState();
}

class _KendraWidgetState extends State<KendraWidget> {
  final _formKey = GlobalKey<FormState>();

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
              if (value!.isEmpty) {
                return 'Please Enter Sangha Name';
              } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                return 'Please Enter Correct Sangha Name';
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
              if (value!.isEmpty) {
                return 'Please Enter Your Name';
              } else if (!RegExp(r'^[a-zA-Z0-9]+(?:[\w -]*[a-zA-Z0-9]+)*$')
                  .hasMatch(value)) {
                return 'Please Enter Correct Name';
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
              if (value!.isEmpty ||
                  !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                      .hasMatch(value)) {
                return 'Please Enter Amount';
              }
              return null;
            },
            // style: TextStyle(height: 0.5),
            decoration: CommonStyle.textFieldStyle(
                labelTextStr: "Amount", hintTextStr: "Enter Amount"),
          ),
          SizedBox(height: 12),
          PaymentWidget(paymentInfo: _paymentInfo),
          SizedBox(height: 12),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _paidController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please Enter Paid By';
              } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                return 'Please Enter Correct Name';
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
                  accountCode: widget.accountCodeName,
                  amount: double.parse(_amountController.text),
                  devoteeId: "NA",
                  notMember: null,
                  paaliaName: _nameController.text,
                  paymentMode:
                      Utility.getPaymentModeString(_paymentInfo.paymentMode),
                  paymentType:
                      Utility.getPaymentTypeString(_paymentInfo.paymentType),
                  preparedBy: Login.loggedInUser?.userId,
                  receiptDate: DateTime.now(),
                  receiptId: Uuid().v1(),
                  receiptNo: Utility.getReceiptNo(),
                  remarks: _remarkController.text,
                  transactionRefNo: _paymentInfo.paymentMode == Payment.bank
                      ? _transactionController.text
                      : null,
                  paidBy: _paidController.text,
                );
                final receiptId = ReceiptAPI().createNewReceipt(receipt);
                print(receiptId);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data Submitted.')),
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ReceiptPreview(receipt: receipt)));
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
