import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/devoteeAPI.dart';
import 'package:nssaccounting/model/devotee.dart';

class ManageDevoteeEdit extends StatefulWidget {
  ManageDevoteeEdit({Key? key, required this.devotee}) : super(key: key);

  final Devotee devotee;

  @override
  _ManageDevoteeEditState createState() => _ManageDevoteeEditState();
}

class _ManageDevoteeEditState extends State<ManageDevoteeEdit> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _branchController = TextEditingController();
  final _ppidController = TextEditingController();
  final _joinedController = TextEditingController();
  final _contactController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _nameController.text = widget.devotee.devoteeName ?? "";
    _branchController.text = widget.devotee.branchName ?? "";
    _ppidController.text = widget.devotee.ppid ?? "";
    _joinedController.text = widget.devotee.joiningYear?.toString() ?? "";
    _contactController.text = widget.devotee.contact ?? "";
    _emailController.text = widget.devotee.email ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.devotee.devoteeName ?? ""),
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
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  controller: _ppidController,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Please Enter PPID';
                  //   } else if (!RegExp(
                  //           r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                  //       .hasMatch(value)) {
                  //     return 'Please Enter Correct PPID';
                  //   }
                  //   return null;
                  // },
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
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                            .hasMatch(value)) {
                      return 'Please Enter Joined Year';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Joined Year ",
                    hintTextStr: "Enter Joined Year ",
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
                    labelTextStr: "Contact No",
                    hintTextStr: "Enter Contact No",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Please Enter Correct Number';
                    }
                    return null;
                  },
                  style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Email Address",
                    hintTextStr: "Enter Email Address",
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    style: CommonStyle.elevatedSubmitButtonStyle(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Devotee devotee = Devotee(
                          devoteeId: widget.devotee.devoteeId,
                          branchName: _branchController.text,
                          devoteeName: _nameController.text,
                          ppid: _ppidController.text,
                          joiningYear: int.parse(_joinedController.text),
                          contact: _contactController.text,
                          email: _emailController.text,
                        );

                        final devoteeId = DevoteeAPI().updateDevotee(devotee);
                        print(devotee);
                        print(devoteeId);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data Updated.')),
                        );

                        Navigator.pop(context, devotee);
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
