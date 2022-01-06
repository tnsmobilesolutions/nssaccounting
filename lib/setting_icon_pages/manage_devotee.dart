import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';

class ManageDevotee extends StatefulWidget {
  ManageDevotee({Key? key}) : super(key: key);

  @override
  _ManageDevoteeState createState() => _ManageDevoteeState();
}

class _ManageDevoteeState extends State<ManageDevotee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Devotee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'search By Devotee Name', icon: Icon(Icons.search)),
            ),
            SizedBox(height: 24),
            DataFeilds(),
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightBlue[100]),
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              child: Text(
                'Branch : Mumbai',
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
                'PPID : 201423',
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
                'Joining Year : 2014',
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
                'Contact : 7738261091',
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
                'Email : srinivaspanda@gmail.com',
                style: TextStyle(fontSize: 22),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                style: CommonStyle.elevatedSubmitButtonStyle(),
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Add'),
      ),
    );
  }
}

class DataFeilds extends StatelessWidget {
  const DataFeilds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.lightBlue[100]),
      padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
      child: Text(
        'Name : Srinivas Panda',
        style: TextStyle(fontSize: 22),
      ),
      width: double.infinity,
    );
  }
}
