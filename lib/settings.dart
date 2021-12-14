import 'package:flutter/material.dart';
import 'package:nssaccounting/model/user.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, this.loggedInUser}) : super(key: key);
  final AppUser? loggedInUser;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Settings'),
    //   ),
    //   endDrawer: Drawer(
    //     child: ListView(
    //       padding: EdgeInsets.zero,
    //       children: <Widget>[
    //         DrawerHeader(
    //           decoration: BoxDecoration(
    //             color: Colors.blue,
    //           ),
    //           child: Text("Welcome - ${loggedInUser?.name}"),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.message),
    //           title: Text('Manage Branch'),
    //         ),
    //         ListTile(
    //           leading: Icon(Icons.account_circle),
    //           title: Text('Manage Devotee'),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Center(
          child: Text("Welcome - ${loggedInUser?.name}"),
        ));
  }
}
