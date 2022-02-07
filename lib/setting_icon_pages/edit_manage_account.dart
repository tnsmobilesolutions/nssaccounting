import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/accountsAPI.dart';
import 'package:nssaccounting/model/account.dart';
import 'package:uuid/uuid.dart';

class ManageEditAccount extends StatefulWidget {
  ManageEditAccount({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  _ManageEditAccount createState() => _ManageEditAccount();
}

class _ManageEditAccount extends State<ManageEditAccount> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.account.accountName ?? "";
    _codeController.text = widget.account.accountCode ?? "";
    _typeController.text = widget.account.accountType ?? "";
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.account.accountName ?? ""),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Name';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Name';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Account Name",
                    hintTextStr: "Enter Name",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _codeController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z , A-Z]"))
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Account Code';
                    } else if (!RegExp(r'^[a-z A-Z ,]+$').hasMatch(value)) {
                      return 'Please Enter Correct Code';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Account Code",
                    hintTextStr: "Enter Code",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _typeController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Account Type';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Account Type';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Account Type",
                    hintTextStr: "Enter Account Type",
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    style: CommonStyle.elevatedSubmitButtonStyle(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Account account = Account(
                          accountId: widget.account.accountId,
                          accountName: _nameController.text,
                          accountCode: _codeController.text,
                          accountType: _typeController.text,
                        );

                        // ignore: unused_local_variable
                        final accountId = AccountsAPI().updateAccount(account);
                        // print(account);
                        print(account.accountId);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data Updated.')),
                        );

                        Navigator.pop(context, account);
                      }
                    },
                    child: Text('UPDATE')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
