import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/receiptAPI.dart';
import 'package:nssaccounting/data/searchAPI.dart';
import 'package:nssaccounting/model/receipt.dart';
import 'package:nssaccounting/model/user.dart';
import 'package:nssaccounting/search/receipt_list.dart';
import 'package:nssaccounting/search/receipt_preview.dart';

class ManageSDP extends StatefulWidget {
  ManageSDP({Key? key}) : super(key: key);

  @override
  _ManageSDPState createState() => _ManageSDPState();
}

class _ManageSDPState extends State<ManageSDP> {
  List<String> _options = ['Paalia Name', 'Paali Date', 'Branch Name'];
  String? _selectedOption;

  final _paaliaNameController = TextEditingController();
  final _paaliDateController = TextEditingController();
  final _branchNameController = TextEditingController();
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Dinikia Paali'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              DropdownButton(
                hint: Text('Search By'),
                dropdownColor: Colors.amberAccent,
                value: _selectedOption,
                onChanged: (value) {
                  setState(
                    () {
                      _selectedOption = value as String?;
                      print(_selectedOption.toString());
                    },
                  );
                },
                items: _options.map(
                  (val) {
                    return DropdownMenuItem(
                      child: new Text(val),
                      value: val,
                    );
                  },
                ).toList(),
              ),
              SizedBox(height: 40),
              getNameWidget(_selectedOption),
              getDateWidget(_selectedOption),
              getAccountWidget(_selectedOption),
              SizedBox(height: 40),
              ElevatedButton(
                style: CommonStyle.elevatedSubmitButtonStyle(),
                child: Text("Search"),
                onPressed: () async {
                  final List<Receipt>? allReceipts;

                  final searchAPI = SearchAPI();

                  if (_selectedOption == "Paalia Name") {
                    allReceipts = await searchAPI
                        .getReceiptByName(_paaliaNameController.text);
                  } else if (_selectedOption == 'Paali Date') {
                    allReceipts =
                        await searchAPI.getReceiptByPaaliDate(_dateTime);
                  } else if (_selectedOption == "Branch Name") {
                    allReceipts = await searchAPI
                        .getReceiptByBranchName(_branchNameController.text);
                  } else {
                    allReceipts = [];
                  }

                  print(allReceipts);
                  if (_selectedOption == "Receipt No") {
                    final singleReceipt = await searchAPI
                        .getReceiptByReceiptNo(_paaliDateController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ReceiptPreview(receipt: singleReceipt)));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReceiptList(
                          receipts: allReceipts,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getNameWidget(String? selectedOption) {
    if (selectedOption == "Paalia Name") {
      return TextFormField(
        keyboardType: TextInputType.name,
        controller: _paaliaNameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Paalia Name';
          } else if (!RegExp(r'^[a-zA-Z0-9]+(?:[\w -]*[a-zA-Z0-9]+)*$')
              .hasMatch(value)) {
            return 'Please Enter Correct Name';
          }
          return null;
        },
        // style: TextStyle(height: 0.5),
        decoration: CommonStyle.textFieldStyle(
          labelTextStr: "Enter Paalia Name",
          hintTextStr: "Enter Paalia Name",
        ),
      );
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }

  Widget getDateWidget(String? selectedOption) {
    if (_selectedOption == 'Paali Date') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            _dateTime == null
                ? 'Choose Paali Date'
                : DateFormat.yMMMEd().format(_dateTime ?? DateTime.now()),
          ),
          ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                ).then(
                  (date) {
                    setState(
                      () {
                        _dateTime = date;
                      },
                    );
                  },
                );
              },
              child: Icon(Icons.calendar_today_outlined)),
        ],
      );
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }

  Widget getAccountWidget(String? selectedOption) {
    if (selectedOption == "Branch Name") {
      return TextFormField(
        keyboardType: TextInputType.name,
        controller: _branchNameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Branch Name';
          } else if (!RegExp(r'^[a-zA-Z0-9]+(?:[\w -]*[a-zA-Z0-9]+)*$')
              .hasMatch(value)) {
            return 'Please Enter Correct Branch Name';
          }
          return null;
        },
        // style: TextStyle(height: 0.5),
        decoration: CommonStyle.textFieldStyle(
          labelTextStr: "Enter Branch Name",
          hintTextStr: "Enter Branch Name",
        ),
      );
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }
}
