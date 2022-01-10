import 'package:flutter/material.dart';
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
                SizedBox(height: 26),
                ElevatedButton(
                    onPressed: () {
                      Branch branch = Branch(
                        branchId: "",
                        branchName: _nameController.text,
                        address: _addressController.text,
                        city: _cityController.text,
                        state: _stateController.text,
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
