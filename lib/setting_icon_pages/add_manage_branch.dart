// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/branchAPI.dart';
import 'package:nssaccounting/model/branch.dart';

class ManageAddBranch extends StatefulWidget {
  ManageAddBranch({Key? key}) : super(key: key);

  @override
  _ManageAddBranchState createState() => _ManageAddBranchState();
}

class _ManageAddBranchState extends State<ManageAddBranch> {
  final _formKey = GlobalKey<FormState>();

  List<int> digit = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _pinController = TextEditingController();
  final _estYearController = TextEditingController();
  final _numDevController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Branch"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(22.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Branch Name';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Name';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Branch Name",
                    hintTextStr: "Enter Name",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _numDevController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Number of Devotees';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Number';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Number of Devotees ",
                    hintTextStr: "Enter Number of Devotees",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _estYearController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Established Year';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Year';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Established Year ",
                    hintTextStr: "Enter Established Year",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _addressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Address';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Address';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Address",
                    hintTextStr: "Enter Address",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _cityController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter City Name';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct City Name';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "City ",
                    hintTextStr: "Enter City Name",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _stateController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter State Name';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct State Name';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "State ",
                    hintTextStr: "Enter State Name",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _countryController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Country Name';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Country Name';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Country ",
                    hintTextStr: "Enter Country Name",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _pinController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Pincode';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Pincode';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Pincode ",
                    hintTextStr: "Enter Pincode",
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      Branch branch = Branch(
                        branchId: Uuid().v1(),
                        branchName: _nameController.text,
                        address: _addressController.text,
                        city: _cityController.text,
                        state: _stateController.text,
                        country: _countryController.text,
                        devotees: int.parse(_numDevController.text),
                        pin: int.parse(_pinController.text),
                        year: int.parse(_estYearController.text),
                      );

                      final branchId = BranchAPI().createNewBranch(branch);
                      print(branchId);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data Submitted.')),
                      );
                      Navigator.pop(context);
                    },
                    style: CommonStyle.elevatedSubmitButtonStyle(),
                    child: Text('ADD BRANCH')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
