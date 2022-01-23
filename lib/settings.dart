import 'package:flutter/material.dart';
//import 'package:nssaccounting/common_widgets/common_style.dart';
//import 'package:nssaccounting/data/auth.dart';
import 'package:nssaccounting/login.dart';
import 'package:nssaccounting/model/user.dart';
import 'package:nssaccounting/setting_icon_pages/manage_branch.dart';
import 'package:nssaccounting/setting_icon_pages/manage_devotee.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, this.loggedInUser}) : super(key: key);
  final AppUser? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          backgroundColor: Colors.teal[800],
          centerTitle: true,
          title: Text('Settings'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
            //backgroundColor: Colors.deepOrange[900],
          ),
        ),
        body: Center(
          // ignore: avoid_returning_null_for_void
          // onTap: () => null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManageBranch(),
                    ),
                  );
                },
                child: Container(
                  // height: 50.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0.0, 30.0),
                          blurRadius: 30.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 160.0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.5, horizontal: 12.0),
                        child: const Text(
                          'Manage Branch',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .button
                          //     ?.apply(color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(89.0),
                            topLeft: Radius.circular(89.0),
                            bottomRight: Radius.circular(200.0),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.account_tree_rounded,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80.0),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManageDevotee(),
                    ),
                  );
                },
                child: Container(
                  // height: 50.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0.0, 30.0),
                          blurRadius: 30.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 160.0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.5, horizontal: 12.0),
                        child: const Text(
                          'Manage Devotee',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .button
                          //     ?.apply(color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(89.0),
                            topLeft: Radius.circular(89.0),
                            bottomRight: Radius.circular(200.0),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.people_alt_rounded,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80.0),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  // height: 50.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0.0, 30.0),
                          blurRadius: 30.0,
                          color: Colors.black12)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 160.0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 13.5, horizontal: 12.0),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          // style: Theme.of(context)
                          //     .textTheme
                          //     .button
                          //     ?.apply(color: Colors.black),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal[300],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(89.0),
                            topLeft: Radius.circular(89.0),
                            bottomRight: Radius.circular(200.0),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.logout_rounded,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


















// import 'package:flutter/material.dart';
// import 'package:nssaccounting/common_widgets/common_style.dart';
// //import 'package:nssaccounting/data/auth.dart';
// import 'package:nssaccounting/login.dart';
// import 'package:nssaccounting/model/user.dart';
// import 'package:nssaccounting/setting_icon_pages/manage_branch.dart';
// import 'package:nssaccounting/setting_icon_pages/manage_devotee.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({Key? key, this.loggedInUser}) : super(key: key);
//   final AppUser? loggedInUser;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 24, top: 16, right: 16),
//         child: Column(
//           children: [
//             Text("Welcome - ${loggedInUser?.name}"),
//             SizedBox(height: 24),
//             GestureDetector(
//                 child: Align(
//                   alignment: Alignment.topRight,
//                   child: Text(
//                     'Manage Branch',
//                     style: CommonStyle.myStyle,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => ManageBranch()));
//                 }),
//             SizedBox(height: 8),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(height: 8),
//             GestureDetector(
//               child: Align(
//                 alignment: Alignment.topRight,
//                 child: Text(
//                   'Manage Deevote',
//                   style: CommonStyle.myStyle,
//                 ),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ManageDevotee(),
//                   ),
//                 );
//               },
//             ),
//             SizedBox(height: 8),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(height: 8),
//             GestureDetector(
//                 child: Align(
//                   alignment: Alignment.topRight,
//                   child: Text(
//                     'Logout',
//                     style: CommonStyle.myStyle,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => LoginScreen()));
//                 }),
//             Divider(
//               thickness: 2,
//             ),
//             SizedBox(height: 8),
//           ],
//         ),
//       ),
//       // endDrawer: Drawer(
//       //   child: ListView(
//       //     padding: EdgeInsets.zero,
//       //     children: <Widget>[
//       //       DrawerHeader(
//       //         decoration: BoxDecoration(
//       //           color: Colors.blue,
//       //         ),
//       //         child: Text("Welcome - ${loggedInUser?.name}"),
//       //       ),
//       //       ListTile(
//       //         leading: Icon(Icons.message),
//       //         title: Text('Manage Branch'),
//       //       ),
//       //       ListTile(
//       //         leading: Icon(Icons.account_circle),
//       //         title: Text('Manage Devotee'),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//     );

//     // return Scaffold(

//     //     appBar: AppBar(
//     //       title: Text("Settings"),
//     //     ),
//     //     body: Center(
//     //       child: Text("Welcome - ${loggedInUser?.name}"),
//     //     ));
//   }
// }
