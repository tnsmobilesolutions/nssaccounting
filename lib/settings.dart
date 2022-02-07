import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/auth.dart';
import 'package:nssaccounting/login.dart';
import 'package:nssaccounting/model/user.dart';
import 'package:nssaccounting/setting_icon_pages/manage_account.dart';
import 'package:nssaccounting/setting_icon_pages/manage_branch.dart';
import 'package:nssaccounting/setting_icon_pages/manage_devotee.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key, this.loggedInUser}) : super(key: key);
  final AppUser? loggedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 16, right: 16),
        child: Column(
          children: [
            Text("Welcome - ${loggedInUser?.name}"),
            SizedBox(height: 24),
            GestureDetector(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Manage Branch',
                    style: CommonStyle.myStyle,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManageBranch()));
                }),
            SizedBox(height: 8),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 8),
            GestureDetector(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Manage Deevote',
                    style: CommonStyle.myStyle,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManageDevotee()));
                }),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 8),
            GestureDetector(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Manage Account',
                    style: CommonStyle.myStyle,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ManageAccount()));
                }),
            SizedBox(height: 8),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 8),
            GestureDetector(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Logout',
                    style: CommonStyle.myStyle,
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }),
            Divider(
              thickness: 2,
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
