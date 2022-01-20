import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/branchAPI.dart';
import 'package:nssaccounting/model/branch.dart';

class ManageEditPage extends StatefulWidget {
  ManageEditPage({Key? key, required this.branch}) : super(key: key);

  final Branch branch;

  @override
  _ManageEditPageState createState() => _ManageEditPageState();
}

class _ManageEditPageState extends State<ManageEditPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _pinController = TextEditingController();
  final _devoteeController = TextEditingController();
  final _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.branch.branchName ?? ""),
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
                    labelTextStr: "Name",
                    hintTextStr: "Enter Name",
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
                  keyboardType: TextInputType.number,
                  controller: _pinController,
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
                    labelTextStr: "Pin ",
                    hintTextStr: "Enter Pin Name",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _devoteeController,
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
                    labelTextStr: "Devotee No",
                    hintTextStr: "Enter Devotee No",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _yearController,
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
                    labelTextStr: "Year of Joining",
                    hintTextStr: "Enter Year of Joining",
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    style: CommonStyle.elevatedSubmitButtonStyle(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Branch branch = Branch(
                            branchId: "",
                            branchName: _nameController.text,
                            address: _addressController.text,
                            city: _cityController.text,
                            state: _stateController.text,
                            country: _countryController.text,
                            pin: int.parse(_pinController.text),
                            devotees: int.parse(_devoteeController.text),
                            year: int.parse(_yearController.text));

                        final branchId = BranchAPI().createNewBranch(branch);
                        print(branchId);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data Submitted.')),
                        );

                        Navigator.pop(context);
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
