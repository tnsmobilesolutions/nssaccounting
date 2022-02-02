import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
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
                      return 'Please enter name';
                    }
                    return null;
                  },
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Devotee name",
                    hintTextStr: "Enter Name",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: _branchController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter sangha name';
                    }
                    return null;
                  },
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Sangha name",
                    hintTextStr: "Enter sangha name",
                  ),
                ),
                SizedBox(height: 16),
                // TextFormField(
                //   keyboardType: TextInputType.number,
                //   controller: _ppidController,
                //   validator: (value) {
                //     if (value!.isEmpty) {
                //       return 'Please Enter PPID';
                //     } else if (!RegExp(
                //             r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                //         .hasMatch(value)) {
                //       return 'Please Enter Correct PPID';
                //     }
                //     return null;
                //   },
                //   // style: TextStyle(height: 0.5),
                //   decoration: CommonStyle.textFieldStyle(
                //     labelTextStr: "PPID",
                //     hintTextStr: "Enter PPID",
                //   ),
                // ),
                //SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('^[0-9]{0,4}'))
                  ],
                  controller: _joinedController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    } else if (value.length < 4) {
                      return 'Enter a valid year';
                    }
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Year of joining",
                    hintTextStr: "Enter Year of joining",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('^[0-9]{1,10}'))
                  ],
                  controller: _contactController,
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length != 10 ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                            .hasMatch(value)) {
                      return 'Please enter atleast 10 digits';
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
                  validator: (value) {
                    String pattern =
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?)*$";
                    RegExp regex = RegExp(pattern);
                    if (value == null ||
                        value.isEmpty ||
                        !regex.hasMatch(value))
                      return 'Enter a valid email address';
                    else
                      return null;
                  },
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
                          devoteeId: Uuid().v1(),
                          branchName: _branchController.text,
                          devoteeName: _nameController.text,
                          ppid: Uuid().v1(),
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
