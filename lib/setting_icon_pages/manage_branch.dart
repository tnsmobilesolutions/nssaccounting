import 'package:flutter/material.dart';
import 'package:nssaccounting/setting_icon_pages/search_branch.dart';

import 'add_manage_branch.dart';

class ManageBranch extends StatefulWidget {
  ManageBranch({Key? key}) : super(key: key);

  @override
  _ManageBranchState createState() => _ManageBranchState();
}

class _ManageBranchState extends State<ManageBranch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          backgroundColor: Colors.teal[800],
          centerTitle: true,
          title: Text('Manage Branch'),
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
                      builder: (context) => SearchBranch(),
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
                          'Search Branch',
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
                        Icons.search,
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
                      builder: (context) => ManageAddBranch(),
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
                          'Add Branch',
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
                        Icons.add,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 80.0),
              InkWell(
                //splashColor: Colors.teal[100],
                highlightColor: Colors.teal[100],
                onTap: () => '',
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
                          'Delete Branch',
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
                        Icons.delete_forever_rounded,
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
