import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/devoteeAPI.dart';
import 'package:nssaccounting/model/devotee.dart';
import 'package:uuid/uuid.dart';

class ManageDevoteeAdd extends StatefulWidget {
  ManageDevoteeAdd({Key? key}) : super(key: key);

  @override
  _ManageDevoteeAddState createState() => _ManageDevoteeAddState();
}

class _ManageDevoteeAddState extends State<ManageDevoteeAdd> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _branchController = TextEditingController();
  final _ppidController = TextEditingController();
  final _joinedController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Devotee"),
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
                  controller: _branchController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Branch';
                    } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Please Enter Correct Branch';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Branch",
                    hintTextStr: "Enter Branch",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _ppidController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter PPID';
                    } else if (!RegExp(
                            r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                        .hasMatch(value)) {
                      return 'Please Enter Correct PPID';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "PPID",
                    hintTextStr: "Enter PPID",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _joinedController,
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length != 4 ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                            .hasMatch(value)) {
                      return 'Please Enter Joined Year';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Joined Year ",
                    hintTextStr: "Enter Joined Year",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _contactController,
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length != 10 ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                            .hasMatch(value)) {
                      return 'Please Enter Contact No';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Contact No ",
                    hintTextStr: "Enter Contact No ",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,

                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Please Enter Email';
                  //   } else if (!RegExp(
                  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  //       .hasMatch(value)) {
                  //     return 'Please Enter Email Address';
                  //   }
                  //   return null;
                  // },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Email Address",
                    hintTextStr: "Enter Email Address",
                  ),
                ),
                SizedBox(height: 26),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Devotee devotee = Devotee(
                          branchId: Uuid().v1(),
                          branchName: _branchController.text,
                          devoteeName: _nameController.text,
                          ppid: _ppidController.text,
                          joiningYear: int.parse(_joinedController.text),
                          contact: _contactController.text,
                          email: _emailController.text,
                        );

                        final devoteeId =
                            DevoteeAPI().createNewDevotee(devotee);
                        print(devoteeId);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data Submitted.')),
                        );
                        Navigator.pop(context);
                      }
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
