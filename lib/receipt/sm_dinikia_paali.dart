import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/common_widgets/natextformfield.dart';

enum Payment { cash, bank }
enum PaymentType { online, cheque, dd }

class SMDinikiaPaali extends StatefulWidget {
  const SMDinikiaPaali({Key? key}) : super(key: key);

  @override
  State<SMDinikiaPaali> createState() => _SMDinikiaPaaliState();
}

class _SMDinikiaPaaliState extends State<SMDinikiaPaali> {
  Payment? _paymentMode = Payment.cash;
  PaymentType? _paymentType = PaymentType.online;

  DateTime? _dateTime;

  final _formKey = GlobalKey<FormState>();

  final _sanghaNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _transactionController = TextEditingController();
  final _receivedController = TextEditingController();
  final _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SM Dinikia Paali'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _sanghaNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Sangha Name';
                    }
                    return null;
                  },
                  style: TextStyle(height: 0.5, color: Colors.red),
                  decoration: CommonStyle.textFieldStyle(
                      labelTextStr: "Sangha Name",
                      hintTextStr: "Enter Sangha Name"),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
                  style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                      labelTextStr: "Name", hintTextStr: "Enter Name"),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _amountController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Amount';
                    }
                    return null;
                  },
                  style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                      labelTextStr: "Amount", hintTextStr: "Enter Amount"),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      _dateTime == null ? 'Choose Date' : _dateTime.toString(),
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
                        child: Icon(Icons.calendar_today)),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Payment',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                    children: [
                      Column(
                        children: [
                          Text("Mode"),
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
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              controller: _transactionController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter transaction number';
                                }
                                return null;
                              },
                              style: TextStyle(height: 0.5),
                              decoration: CommonStyle.textFieldStyle(
                                  labelTextStr: "Transaction Number",
                                  hintTextStr: "Transaction Number"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _receivedController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Received By';
                    }
                    return null;
                  },
                  style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                      labelTextStr: "Received By", hintTextStr: "Received By"),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _remarkController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Your Remark';
                    }
                    return null;
                  },
                  style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                      labelTextStr: "Remark", hintTextStr: "Remark"),
                ),
                SizedBox(height: 18),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Submitted.')),
                      );
                      print(_sanghaNameController.text);
                      print(_nameController.text);
                      print(_amountController.text);
                      print(_dateTime);
                      print(_transactionController.text);
                      print(_receivedController.text);
                      print(_remarkController.text);
                    }
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
