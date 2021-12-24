import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/receiptAPI.dart';
import 'package:nssaccounting/data/searchAPI.dart';
import 'package:nssaccounting/model/receipt.dart';
import 'package:nssaccounting/model/user.dart';
import 'package:nssaccounting/search/receipt_list.dart';

class SearchMain extends StatefulWidget {
  SearchMain({
    Key? key,
  }) : super(key: key);

  @override
  _SearchMainState createState() => _SearchMainState();
}

class _SearchMainState extends State<SearchMain> {
  List<String> _options = ['Name', 'Receipt No', 'Date', 'Account/Head'];
  String? _selectedOption;

  final _nameController = TextEditingController();
  final _receiptNoController = TextEditingController();
  final _accountController = TextEditingController();
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
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
                  setState(() {
                    _selectedOption = value as String?;
                    print(_selectedOption.toString());
                  });
                },
                items: _options.map((val) {
                  return DropdownMenuItem(
                    child: new Text(val),
                    value: val,
                  );
                }).toList(),
              ),
              SizedBox(height: 40),
              getNameWidget(_selectedOption),
              getDateWidget(_selectedOption),
              getReceiptNoWidget(_selectedOption),
              getAccountWidget(_selectedOption),
              SizedBox(height: 40),
              ElevatedButton(
                  style: CommonStyle.elevatedSubmitButtonStyle(),
                  child: Text("Search"),
                  onPressed: () async {
                    print('search btn pressrd');

                    final List<Receipt>? allReceipts;

                    final searchAPI = SearchAPI();

                    if (_selectedOption == "Name") {
                      allReceipts = await searchAPI
                          .getReceiptByName(_nameController.text);
                    } else if (_selectedOption == 'Date') {
                      allReceipts =
                          await searchAPI.getReceiptByReceiptDate(_dateTime);
                    } else if (_selectedOption == "Account/Head") {
                      allReceipts = await searchAPI
                          .getReceiptByAccount(_accountController.text);
                    } else {
                      allReceipts = [];
                    }

                    print(allReceipts);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReceiptList(
                                  receipts: allReceipts,
                                )));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget getNameWidget(String? selectedOption) {
    if (selectedOption == "Name") {
      return TextFormField(
        keyboardType: TextInputType.name,
        controller: _nameController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your Name';
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
      );
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }

  Widget getDateWidget(String? selectedOption) {
    if (_selectedOption == 'Date') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
      );
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }

  Widget getReceiptNoWidget(String? selectedOption) {
    if (selectedOption == "Receipt No") {
      return TextFormField(
        keyboardType: TextInputType.name,
        controller: _receiptNoController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your Receipt No';
          } else if (!RegExp(r'^[a-zA-Z0-9]+(?:[\w -]*[a-zA-Z0-9]+)*$')
              .hasMatch(value)) {
            return 'Please Enter Correct Receipt No';
          }
          return null;
        },
        // style: TextStyle(height: 0.5),
        decoration: CommonStyle.textFieldStyle(
          labelTextStr: "Enter Receipt No",
          hintTextStr: "Enter Receipt No",
        ),
      );
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }

  Widget getAccountWidget(String? selectedOption) {
    if (selectedOption == "Account/Head") {
      return TextFormField(
        keyboardType: TextInputType.name,
        controller: _accountController,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your Account/Head No';
          } else if (!RegExp(r'^[a-zA-Z0-9]+(?:[\w -]*[a-zA-Z0-9]+)*$')
              .hasMatch(value)) {
            return 'Please Enter Correct Account/Head No';
          }
          return null;
        },
        // style: TextStyle(height: 0.5),
        decoration: CommonStyle.textFieldStyle(
          labelTextStr: "Enter Account/Head No",
          hintTextStr: "Enter Account/Head No",
        ),
      );
    } else {
      return SizedBox(width: 0, height: 0);
    }
  }
}
