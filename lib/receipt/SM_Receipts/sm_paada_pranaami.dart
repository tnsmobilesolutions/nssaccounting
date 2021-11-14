import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';

class SMPaadaPranaami extends StatefulWidget {
  const SMPaadaPranaami({Key? key}) : super(key: key);
  @override
  State<SMPaadaPranaami> createState() => _SMPaadaPranaamiState();
}

class _SMPaadaPranaamiState extends State<SMPaadaPranaami> {
  DateTime? _dateTime;

  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _remarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SM Paada Pranaami"),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Submitted.')),
                      );
                    }

                    print(_amountController.text);
                    print(_dateTime);

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
