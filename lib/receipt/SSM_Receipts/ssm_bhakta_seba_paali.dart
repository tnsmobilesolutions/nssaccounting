import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/utility.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/auth.dart';
import 'package:nssaccounting/data/receiptAPI.dart';
import 'package:nssaccounting/model/receipt.dart';

class SSMBhaktaSebaPaali extends StatefulWidget {
  const SSMBhaktaSebaPaali({Key? key}) : super(key: key);
  @override
  State<SSMBhaktaSebaPaali> createState() => _SSMBhaktaSebaPaaliState();
}

class _SSMBhaktaSebaPaaliState extends State<SSMBhaktaSebaPaali> {
  Payment? _paymentMode = Payment.cash;
  PaymentType? _paymentType = PaymentType.online;

  bool notMember = false;
  DateTime? _dateTime;

  final _formKey = GlobalKey<FormState>();

  final _sanghaNameController = TextEditingController();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _transactionController = TextEditingController();
  final _paidController = TextEditingController();
  final _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SSM Bhakta Seba Paali"),
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
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Checkbox(
                        value: this.notMember,
                        onChanged: (value) {
                          setState(() {
                            this.notMember = value!;
                          });
                        },
                      ), //Check
                      SizedBox(width: 40),
                      Text(
                        'Not a Member',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
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
                        accountCode: "SSMBSP",
                        amount: double.parse(_amountController.text),
                        devoteeId: "NA",
                        notMember: notMember,
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
                    print(notMember);
                    print(_dateTime);
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
