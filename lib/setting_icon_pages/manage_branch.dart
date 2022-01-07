import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/setting_icon_pages/add_manage_branch.dart';
import 'package:nssaccounting/setting_icon_pages/edit_manage_branch.dart';

class ManageBranch extends StatefulWidget {
  ManageBranch({Key? key}) : super(key: key);

  @override
  _ManageBranchState createState() => _ManageBranchState();
}

class _ManageBranchState extends State<ManageBranch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Branch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              decoration:
                  InputDecoration(hintText: 'search', icon: Icon(Icons.search)),
            ),
            SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
              child: Text(
                'Name : Mumbai',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              child: Text(
                'Address : 500,Taloja',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              child: Text(
                'City : Mumbai',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              child: Text(
                'State : MH',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              child: Text(
                'Country : India',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              child: Text(
                'Pin : 40210',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              child: Text(
                'Numbers of Devotees : 83',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              child: Text(
                'Est. Year : 2012 ',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: CommonStyle.elevatedSubmitButtonStyle(),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManageEditPage()));
                },
                child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ManageAddBranch()));
        },
        child: Text('Add'),
      ),
    );
  }
}
