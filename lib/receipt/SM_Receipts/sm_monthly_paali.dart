import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/common_widgets/payment_widget.dart';

import '../../utility.dart';

class SMMonthlyPaali extends StatefulWidget {
  const SMMonthlyPaali({Key? key}) : super(key: key);
  @override
  State<SMMonthlyPaali> createState() => _SMMonthlyPaaliState();
}

class _SMMonthlyPaaliState extends State<SMMonthlyPaali> {
  Payment? _paymentMode = Payment.cash;
  PaymentType? _paymentType = PaymentType.online;

  DateTime? _fromTime;
  DateTime? _toTime;

  final _formKey = GlobalKey<FormState>();

  final _sanghaNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _transactionController = TextEditingController();
  final _paidController = TextEditingController();
  //final _receivedController = TextEditingController();
  final _remarkController = TextEditingController();

  final _paymentInfo = PaymentInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SM Monthly Paalli"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Month \nFrom Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _fromTime == null
                          ? 'Choose Date'
                          : DateFormat.yMMMEd()
                              .format(_fromTime ?? DateTime.now()),
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
                              _fromTime = date;
                            });
                          });
                        },
                        child: Icon(Icons.calendar_today_outlined)),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'To Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      _toTime == null
                          ? 'Choose Date'
                          : DateFormat.yMMMEd()
                              .format(_toTime ?? DateTime.now()),
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
                              _toTime = date;
                            });
                          });
                        },
                        child: Icon(Icons.calendar_today_outlined)),
                  ],
                ),
                SizedBox(height: 12),
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
                PaymentWidget(paymentInfo: _paymentInfo),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Submitted.')),
                      );
                    }
                    print(_sanghaNameController.text);
                    print(_nameController.text);
                    print(_amountController.text);
                    print(_fromTime);
                    print(_toTime);
                    print(_paymentMode);
                    if (_paymentMode == Payment.bank) {
                      print(_paymentType);
                      print(_transactionController.text);
                    }
                    print(_paidController.text);
                    //print(_receivedController.text);
                    print(_remarkController.text);
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
