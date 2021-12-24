import 'dart:ui';

import 'package:flutter/material.dart';

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
        child: Center(
          child: Column(
            children: [
              // Container(
              //   child: Text('search'),
              //   width: double.infinity,
              //   decoration:
              //       BoxDecoration(border: Border.all(color: Colors.black)),
              // ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'search', icon: Icon(Icons.search)),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.cyanAccent[100]),
                padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                child: Text(
                  'name',
                  style: TextStyle(fontSize: 22),
                ),
                width: double.infinity,
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.cyanAccent[100]),
                padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                child: Text(
                  'name',
                  style: TextStyle(fontSize: 22),
                ),
                width: double.infinity,
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.cyanAccent[100]),
                padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                child: Text(
                  'name',
                  style: TextStyle(fontSize: 22),
                ),
                width: double.infinity,
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.cyanAccent[100]),
                padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                child: Text(
                  'name',
                  style: TextStyle(fontSize: 22),
                ),
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Add'),
      ),
    );
  }
}
