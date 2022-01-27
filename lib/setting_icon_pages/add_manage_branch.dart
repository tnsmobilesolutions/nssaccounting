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
      //backgroundColor: Colors.teal[100],
      appBar: AppBar(
        //backgroundColor: Colors.teal[800],
        title: Text("Add Branch"),
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
                      return 'Please Enter Sangha Name';
                    }
                    return null;
                  },
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please Enter Name';
                  //   } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  //     return 'Please Enter Correct Name';
                  //   }
                  //   return null;
                  // },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Sangha Name",
                    hintTextStr: "Enter Name",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                  ],
                  controller: _numDevController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter Number of Devotees';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('^[0-9]{1,4}'))
                  ],
                  controller: _estYearController,
                  validator: (value) {
                    if (value!.length < 4) {
                      return 'Enter a valid year';
                    }
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Year of Establishment",
                    hintTextStr: "Enter Year of establishment",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _addressController,

                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Address';
                    } else if (!RegExp(r'^[a-z A-Z 0-9 , / - .]+$')
                        .hasMatch(value)) {
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z , A-Z]"))
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter City Name';
                    } else if (!RegExp(r'^[a-z A-Z ,]+$').hasMatch(value)) {
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
                    if (value == null || value.isEmpty) {
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
                    if (value == null || value.isEmpty) {
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('^[0-9]{1,6}'))
                  ],
                  controller: _pinController,
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Enter atleast 6 digit';
                    }
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Pincode",
                    hintTextStr: "Enter Pincode",
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data Submitted.')),
                        );

                        Branch branch = Branch(
                          branchId: Uuid().v1(),
                          branchName: _nameController.text,
                          address: _addressController.text,
                          city: _cityController.text,
                          state: _stateController.text,
                          country: _countryController.text,
                          devotees: int.tryParse(_numDevController.text),
                          pin: int.tryParse(_pinController.text),
                          year: int.tryParse(_estYearController.text),
                        );

                        final branchId = BranchAPI().createNewBranch(branch);
                        print(branchId);

                        Navigator.pop(context);
                      }

                      //
                    },
                    // style: ElevatedButton.styleFrom(
                    //   primary: Colors.teal[500],
                    //   shadowColor: Colors.black12,
                    // ),
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
