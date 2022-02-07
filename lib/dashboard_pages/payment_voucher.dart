import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/common_widgets/payment_widget.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/paymentAPI.dart';
import 'package:nssaccounting/model/account.dart';
import 'package:nssaccounting/model/payment.dart';
import 'package:nssaccounting/payment_voucher_receipt/payment_oucher_receipt.dart';
import 'package:nssaccounting/user_session.dart';
import 'package:nssaccounting/utility.dart';
import 'package:uuid/uuid.dart';

class PaymentVoucher extends StatefulWidget {
  const PaymentVoucher({Key? key}) : super(key: key);
  @override
  State<PaymentVoucher> createState() => _PaymentVoucherState();
}

class _PaymentVoucherState extends State<PaymentVoucher> {
  bool notMember = false;
  DateTime? _dateTime;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _transactionController = TextEditingController();
  final _approverNameController = TextEditingController();

  final _paymentInfo = PaymentInfo();

  // List<String> _location = ['bbsr', 'mumbai', 'pune', 'delhi'];
  Account? _selectedAccount;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Voucher"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Account Head',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    FutureBuilder(
                        future: UserSession().allPaymentAccounts,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return DropdownButton<Account>(
                              hint: Text(
                                  'Please choose an account'), // Not necessary for Option 1
                              value: _selectedAccount,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedAccount = newValue;
                                });
                              },
                              items: (snapshot.data as List<Account?>)
                                  .map<DropdownMenuItem<Account>>(
                                      (paymentHead) {
                                return DropdownMenuItem<Account>(
                                  child:
                                      new Text(paymentHead?.accountName ?? ""),
                                  value: paymentHead,
                                );
                              }).toList(),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ],
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Name';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9]+(?:[\w -]*[a-zA-Z0-9]+)*$')
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
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                PaymentWidget(paymentInfo: _paymentInfo),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Date',
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
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _approverNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Approver Name';
                    } else if (!RegExp(
                            r'^[a-zA-Z0-9]+(?:[\w -]*[a-zA-Z0-9]+)*$')
                        .hasMatch(value)) {
                      return 'Please Enter Correct Approver Name';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Enter Approver Name",
                    hintTextStr: "Enter Approver Name",
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  style: CommonStyle.elevatedSubmitButtonStyle(),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      PaymentDatas paymentDatas = PaymentDatas(
                        voucherNo: Uuid().v1(),
                        accountHead: _selectedAccount?.accountName,
                        partyName: _nameController.text,
                        amount: _amountController.text,
                        paymentType: Utility.getPaymentTypeString(
                            _paymentInfo.paymentType),
                        paymentMode: Utility.getPaymentModeString(
                            _paymentInfo.paymentMode),
                        transactinRefNo:
                            _paymentInfo.paymentMode == Payment.bank
                                ? _transactionController.text
                                : null,
                        preparedBy: '',
                        authorizedBy: '',
                        remark: '',
                      );

                      final paymnentVoucherId =
                          PaymentAPI().createNewPayment(paymentDatas);
                      print(paymnentVoucherId);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Submitted.')),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentVoucherReceipt(
                                    Payment: paymentDatas,
                                  )));
                    }
                    // print(_selectedLocation);
                    // String formattedDate =
                    //     DateFormat('yyyy-MM-dd – kk:mm').format(now);
                    // print(formattedDate);

                    // if (_formKey.currentState!.validate()) {
                    //   Receipt receipt = Receipt(
                    //     // accountCode: "SSMBSP",
                    //     amount: double.parse(_amountController.text),
                    //     devoteeId: "NA",

                    //     paaliaName: _nameController.text,
                    //     paymentMode: Utility.getPaymentModeString(
                    //         _paymentInfo.paymentMode),
                    //     paymentType: Utility.getPaymentTypeString(
                    //         _paymentInfo.paymentType),
                    //     preparedBy: Login.loggedInUser?.userId,
                    //     receiptDate: DateTime.now(),
                    //     receiptId: "",
                    //     receiptNo: Utility.getReceiptNo(),
                    //     transactionRefNo:
                    //         _paymentInfo.paymentMode == Payment.bank
                    //             ? _transactionController.text
                    //             : null,
                    //   );
                    //   final receiptId = ReceiptAPI().createNewReceipt(receipt);
                    //   print(receiptId);

                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('Data Submitted.')),
                    //   );
                    // }
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
