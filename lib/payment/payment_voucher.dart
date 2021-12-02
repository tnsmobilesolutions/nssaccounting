import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/common_widgets/payment_widget.dart';
import 'package:nssaccounting/data/auth.dart';
import 'package:nssaccounting/data/receiptAPI.dart';
import 'package:nssaccounting/model/receipt.dart';
import 'package:nssaccounting/utility.dart';

class PaymentVoucher extends StatefulWidget {
  const PaymentVoucher({Key? key}) : super(key: key);

  @override
  State<PaymentVoucher> createState() => _PaymentVoucherState();
}

class _PaymentVoucherState extends State<PaymentVoucher> {
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _transactionController = TextEditingController();
  final _approverController = TextEditingController();

  final _paymentInfo = PaymentInfo();
  DateTime? _dateTime;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          controller: _nameController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Sangha Name';
            } else if (!RegExp(r'^[a-zA-Z0-9]+(?:[\w -]*[a-zA-Z0-9]+)*$')
                .hasMatch(value)) {
              return 'Please Enter Correct Name';
            }
            return null;
          },
          // style: TextStyle(height: 0.5),
          decoration: CommonStyle.textFieldStyle(
            labelTextStr: "Enter Name",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Paali Date',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              _dateTime == null
                  ? 'Choose Date'
                  : DateFormat.yMMMEd().format(_dateTime ?? DateTime.now()),
            ),
            ElevatedButton(
                onPressed: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025))
                      .then((date) {
                    setState(() {
                      _dateTime = date;
                    });
                  });
                },
                child: Icon(Icons.calendar_today_outlined)),
          ],
        ),
        SizedBox(height: 12),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: _approverController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Approver Name';
            } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
              return 'Please Enter Correct Name';
            }
            return null;
          },
          // style: TextStyle(height: 0.5),
          decoration: CommonStyle.textFieldStyle(
            labelTextStr: "Approver Name",
            hintTextStr: "Enter Approver Name",
          ),
        ),
        SizedBox(height: 18),
        ElevatedButton(
          style: CommonStyle.elevatedSubmitButtonStyle(),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Receipt receipt = Receipt(
                //accountCode: widget.accountCodeName,
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
                receiptId: "",
                receiptNo: Utility.getReceiptNo(),
                remarks: null,
                transactionRefNo: _paymentInfo.paymentMode == Payment.bank
                    ? _transactionController.text
                    : null,
              );
              final receiptId = ReceiptAPI().createNewReceipt(receipt);
              print(receiptId);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data Submitted.')),
              );
            }
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
