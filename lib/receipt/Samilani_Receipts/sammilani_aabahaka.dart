import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/common_widgets/payment_widget.dart';

import '../../utility.dart';

class SammilaniAabahaka extends StatefulWidget {
  const SammilaniAabahaka({Key? key}) : super(key: key);
  @override
  State<SammilaniAabahaka> createState() => _SammilaniAabahakaState();
}

class _SammilaniAabahakaState extends State<SammilaniAabahaka> {
  Payment? _paymentMode = Payment.cash;
  PaymentType? _paymentType = PaymentType.online;

  final _formKey = GlobalKey<FormState>();

  final _sanghaNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _sammilaniNumberontroller = TextEditingController();
  final _amountController = TextEditingController();
  final _transactionController = TextEditingController();
  final _paidController = TextEditingController();
  final _remarkController = TextEditingController();

  final _paymentInfo = PaymentInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sammilani Aabahaka"),
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
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _sammilaniNumberontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Sammilani Number';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                      labelTextStr: "Sammilani Number",
                      hintTextStr: "Sammilani Number"),
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
                    print(_sammilaniNumberontroller.text);

                    print(_paymentMode);
                    if (_paymentMode == Payment.bank) {
                      print(_paymentType);
                      print(_transactionController.text);
                    }
                    print(_paidController.text);

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
