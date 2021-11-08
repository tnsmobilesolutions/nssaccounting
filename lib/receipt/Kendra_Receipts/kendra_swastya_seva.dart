import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';

enum Payment { cash, bank }
enum PaymentType { online, cheque, dd }

class KendraSwastyaSeva extends StatefulWidget {
  const KendraSwastyaSeva({Key? key}) : super(key: key);
  @override
  State<KendraSwastyaSeva> createState() => _KendraSwastyaSevaState();
}

class _KendraSwastyaSevaState extends State<KendraSwastyaSeva> {
  Payment? _paymentMode = Payment.cash;
  PaymentType? _paymentType = PaymentType.online;

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
        title: Text("Kendra Swastya Seva Fund"),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Submitted.')),
                      );
                    }
                    print(_sanghaNameController.text);
                    print(_nameController.text);
                    print(_amountController.text);

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
