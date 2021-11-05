import 'package:flutter/material.dart';
import 'package:nssaccounting/model/user.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, this.loggedInUser}) : super(key: key);
  final AppUser? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Center(
          child: Text("Welcome - ${loggedInUser?.name}"),
        ));
  }
}
