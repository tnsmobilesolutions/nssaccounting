import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/branchAPI.dart';
import 'package:nssaccounting/model/branch.dart';
import 'package:uuid/uuid.dart';

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
  void initState() {
    super.initState();
    _nameController.text = widget.branch.branchName ?? "";
    _addressController.text = widget.branch.address ?? "";
    _cityController.text = widget.branch.city ?? "";
    _stateController.text = widget.branch.state ?? "";
    _countryController.text = widget.branch.country ?? "";
    _pinController.text = widget.branch.pin?.toString() ?? "";
    _devoteeController.text = widget.branch.devotees?.toString() ?? "";
    _yearController.text = widget.branch.year?.toString() ?? "";
  }

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
                    labelTextStr: "Sangha Name",
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
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('^[0-9]'))
                  ],
                  controller: _devoteeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please Enter Correct Number';
                    }
                    return null;
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Devotee No",
                    hintTextStr: "Enter Total Devotee No",
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('^[0-9]{0,4}'))
                  ],
                  controller: _yearController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    } else if (value.length < 4) {
                      return 'Enter a valid year';
                    }
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Year of Establishment",
                    hintTextStr: "Enter Year of establishment",
                  ),
                ),
                SizedBox(height: 20),
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                  ],
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
                  ],
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
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('^[0-9]{0,6}'))
                  ],
                  controller: _pinController,
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Enter atleast 6 digit';
                    }
                  },
                  // style: TextStyle(height: 0.5),
                  decoration: CommonStyle.textFieldStyle(
                    labelTextStr: "Pin ",
                    hintTextStr: "Enter Pin Name",
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                    style: CommonStyle.elevatedSubmitButtonStyle(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Branch branch = Branch(
                            branchId: widget.branch.branchId,
                            branchName: _nameController.text,
                            address: _addressController.text,
                            city: _cityController.text,
                            state: _stateController.text,
                            country: _countryController.text,
                            pin: int.parse(_pinController.text),
                            devotees: int.parse(_devoteeController.text),
                            year: int.parse(_yearController.text));

                        // ignore: unused_local_variable
                        final branchId = BranchAPI().updateBranch(branch);
                        // print(branch);
                        print(branch.branchId);

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data Updated.')),
                        );

                        Navigator.pop(context, branch);
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






// import 'package:flutter/material.dart';
// import 'package:nssaccounting/common_widgets/common_style.dart';
// import 'package:nssaccounting/data/branchAPI.dart';
// import 'package:nssaccounting/model/branch.dart';

// class ManageEditPage extends StatefulWidget {
//   ManageEditPage({Key? key, required this.branch}) : super(key: key);

//   final Branch branch;

//   @override
//   _ManageEditPageState createState() => _ManageEditPageState();
// }

// class _ManageEditPageState extends State<ManageEditPage> {
//   final _formKey = GlobalKey<FormState>();

//   final _nameController = TextEditingController();
//   final _addressController = TextEditingController();
//   final _cityController = TextEditingController();
//   final _stateController = TextEditingController();
//   final _countryController = TextEditingController();
//   final _pinController = TextEditingController();
//   final _devoteeController = TextEditingController();
//   final _yearController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _nameController.text = widget.branch.branchName ?? "";
//     _addressController.text = widget.branch.address ?? "";
//     _cityController.text = widget.branch.city ?? "";
//     _stateController.text = widget.branch.state ?? "";
//     _countryController.text = widget.branch.country ?? "";
//     _pinController.text = widget.branch.pin?.toString() ?? "";
//     _devoteeController.text = widget.branch.devotees?.toString() ?? "";
//     _yearController.text = widget.branch.year?.toString() ?? "";
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.branch.branchName ?? ""),
//       ),
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: const EdgeInsets.all(22.0),
//             child: Column(
//               children: [
//                 TextFormField(
//                   keyboardType: TextInputType.name,
//                   controller: _nameController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter Name';
//                     } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
//                       return 'Please Enter Correct Name';
//                     }
//                     return null;
//                   },
//                   // style: TextStyle(height: 0.5),
//                   decoration: CommonStyle.textFieldStyle(
//                     labelTextStr: "Name",
//                     hintTextStr: "Enter Name",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   keyboardType: TextInputType.name,
//                   controller: _addressController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter Address';
//                     } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
//                       return 'Please Enter Correct Address';
//                     }
//                     return null;
//                   },
//                   // style: TextStyle(height: 0.5),
//                   decoration: CommonStyle.textFieldStyle(
//                     labelTextStr: "Address",
//                     hintTextStr: "Enter Address",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   keyboardType: TextInputType.name,
//                   controller: _cityController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter City Name';
//                     } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
//                       return 'Please Enter Correct City Name';
//                     }
//                     return null;
//                   },
//                   // style: TextStyle(height: 0.5),
//                   decoration: CommonStyle.textFieldStyle(
//                     labelTextStr: "City ",
//                     hintTextStr: "Enter City Name",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   keyboardType: TextInputType.name,
//                   controller: _stateController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter State Name';
//                     } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
//                       return 'Please Enter Correct State Name';
//                     }
//                     return null;
//                   },
//                   // style: TextStyle(height: 0.5),
//                   decoration: CommonStyle.textFieldStyle(
//                     labelTextStr: "State ",
//                     hintTextStr: "Enter State Name",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   keyboardType: TextInputType.name,
//                   controller: _countryController,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please Enter Country Name';
//                     } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
//                       return 'Please Enter Correct Country Name';
//                     }
//                     return null;
//                   },
//                   // style: TextStyle(height: 0.5),
//                   decoration: CommonStyle.textFieldStyle(
//                     labelTextStr: "Country ",
//                     hintTextStr: "Enter Country Name",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   controller: _pinController,
//                   validator: (value) {
//                     if (value!.isEmpty ||
//                         !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
//                             .hasMatch(value)) {
//                       return 'Please Enter Amount';
//                     }
//                     return null;
//                   },
//                   // style: TextStyle(height: 0.5),
//                   decoration: CommonStyle.textFieldStyle(
//                     labelTextStr: "Pin ",
//                     hintTextStr: "Enter Pin Name",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   controller: _devoteeController,
//                   validator: (value) {
//                     if (value!.isEmpty ||
//                         !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
//                             .hasMatch(value)) {
//                       return 'Please Enter Amount';
//                     }
//                     return null;
//                   },
//                   // style: TextStyle(height: 0.5),
//                   decoration: CommonStyle.textFieldStyle(
//                     labelTextStr: "Devotee No",
//                     hintTextStr: "Enter Devotee No",
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextFormField(
//                   keyboardType: TextInputType.number,
//                   controller: _yearController,
//                   validator: (value) {
//                     if (value!.isEmpty ||
//                         !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
//                             .hasMatch(value)) {
//                       return 'Please Enter Amount';
//                     }
//                     return null;
//                   },
//                   // style: TextStyle(height: 0.5),
//                   decoration: CommonStyle.textFieldStyle(
//                     labelTextStr: "Year of Joining",
//                     hintTextStr: "Enter Year of Joining",
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                     style: CommonStyle.elevatedSubmitButtonStyle(),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         Branch branch = Branch(
//                             branchId: widget.branch.branchId,
//                             branchName: _nameController.text,
//                             address: _addressController.text,
//                             city: _cityController.text,
//                             state: _stateController.text,
//                             country: _countryController.text,
//                             pin: int.parse(_pinController.text),
//                             devotees: int.parse(_devoteeController.text),
//                             year: int.parse(_yearController.text));

//                         final branchId = BranchAPI().createNewBranch(branch);
//                         print(branchId);

//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Data Submitted.')),
//                         );

//                         Navigator.pop(context);
//                       }
//                     },
//                     child: Text('UPDATE')),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
