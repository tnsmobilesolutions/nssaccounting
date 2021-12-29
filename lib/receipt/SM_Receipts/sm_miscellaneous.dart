import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/auth.dart';
import 'package:nssaccounting/data/receiptAPI.dart';
import 'package:nssaccounting/model/receipt.dart';
import 'package:nssaccounting/search/receipt_preview.dart';
import 'package:nssaccounting/utility.dart';

class SMMiscellaneous extends StatefulWidget {
  const SMMiscellaneous({Key? key}) : super(key: key);
  @override
  State<SMMiscellaneous> createState() => _SMMiscellaneousState();
}

class _SMMiscellaneousState extends State<SMMiscellaneous> {
  DateTime? _dateTime;

  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SM Miscellaneous"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _dateTime == null
                          ? 'Choose Date'
                          : DateFormat.yMMMEd()
                              .format(_dateTime ?? DateTime.now()),
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
                        accountCode: "SMMisc",
                        amount: double.parse(_amountController.text),
                        devoteeId: "NA",
                        notMember: null,
                        paaliaName: null,
                        paymentMode: null,
                        paymentType: null,
                        preparedBy: Login.loggedInUser?.userId,
                        receiptDate: DateTime.now(),
                        receiptId: "",
                        receiptNo: Utility.getReceiptNo(),
                        remarks: _remarkController.text,
                        // transactionRefNo: _paymentMode == Payment.bank
                        //     ? _transactionController.text
                        //     : null,
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

                    // print(_amountController.text);
                    // print(_dateTime);

                    // print(_remarkController.text);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
