// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/accountsAPI.dart';
import 'package:nssaccounting/model/account.dart';
import 'package:nssaccounting/setting_icon_pages/manage_account.dart';

class ManageAddAccount extends StatefulWidget {
  ManageAddAccount({
    Key? key,
  }) : super(key: key);

  @override
  _ManageAddAccountState createState() => _ManageAddAccountState();
}

class _ManageAddAccountState extends State<ManageAddAccount> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _codeController = TextEditingController();
  final _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal[100],
      appBar: AppBar(
        //backgroundColor: Colors.teal[800],
        title: Text("Add Account"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(22.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Account Name';
                    }
                    return null;
                  },
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
                      return 'Please Enter Code';
                    } else if (!RegExp(r'^[a-z A-Z ,]+$').hasMatch(value)) {
                      return 'Please Enter Correct Code';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Code",
                    hintTextStr: "Enter Account Code",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _typeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Account Type';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Type';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Type",
                    hintTextStr: "Enter Account Type",
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () async {
                      final isAccountExist = await AccountsAPI()
                          .isAccountExists(_nameController.text);
                      if (!isAccountExist) {
                        //TODO
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Data Submitted.')),
                          );

                          Account account = Account(
                            accountId: Uuid().v1(),
                            accountName: _nameController.text,
                            accountCode: _codeController.text,
                            accountType: _typeController.text,
                          );

                          final accountId =
                              AccountsAPI().createNewAccount(account);
                          print(accountId);

                          Navigator.pop(context);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Account already exists'),
                          ),
                        );
                      }
                    },
                    style: CommonStyle.elevatedSubmitButtonStyle(),
                    child: Text('ADD ACCOUNT')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
