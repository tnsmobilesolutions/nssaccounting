//import 'dart:ui';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/devoteeAPI.dart';
import 'package:nssaccounting/model/devotee.dart';
import 'package:nssaccounting/setting_icon_pages/add_manage_devotee.dart';
import 'package:nssaccounting/setting_icon_pages/edit_manage_devotee.dart';

class ManageDevotee extends StatefulWidget {
  ManageDevotee({Key? key}) : super(key: key);

  @override
  _ManageDevoteeState createState() => _ManageDevoteeState();
}

class _ManageDevoteeState extends State<ManageDevotee> {
  Devotee? _selectedDevotee;

  List<Devotee?>? _filteredDevotees;

  List<String>? filteredSearchHistory;

  String? selectedTerm;

  bool _isSearchedSelected = false;

  var updateDevotee;

  Future<List<String>> filterSearchTerms({
    @required String? name,
  }) async {
    if (name != null && name.isNotEmpty) {
      final devotees = await DevoteeAPI().getDevoteeByName(name);
      print(devotees);
      setState(() {
        _filteredDevotees = devotees;
      });
      return devotees.map((d) => d?.devoteeName ?? '').toList();
    } else {
      return [];
    }
  }

  late FloatingSearchBarController controller;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = [];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Devotee"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 180,
                child: FloatingSearchBar(
                  automaticallyImplyBackButton: false,
                  closeOnBackdropTap: false,
                  controller: controller,
                  transition: CircularFloatingSearchBarTransition(),
                  physics: BouncingScrollPhysics(),
                  title: Text(
                    selectedTerm ?? 'Search',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  hint: 'Search Devotee',
                  actions: [
                    FloatingSearchBarAction.searchToClear(),
                  ],
                  //when searched item is started being searched
                  onQueryChanged: (query) async {
                    print("onQueryChanged: $query");

                    final lstDevotees = await filterSearchTerms(name: query);
                    print('Hiii');

                    print(lstDevotees);
                    setState(() {
                      filteredSearchHistory = lstDevotees;
                    });
                  },
                  onSubmitted: (query) {
                    print("onSubmitted: $query");
                    print('submitted');
                    setState(() {
                      // addSearchTerm(query);
                      selectedTerm = query;
                    });
                    controller.close();
                  },
                  builder: (context, transition) {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(6), // search history body
                      child: Material(
                        color: Colors.yellowAccent[700],
                        elevation: 4,
                        child: Builder(
                          builder: (context) {
                            if (filteredSearchHistory!.isEmpty &&
                                controller.query.isEmpty) {
                              return Container(
                                height: 56,
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Text(
                                  'Start searching',
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              );
                            } else if (filteredSearchHistory!.isEmpty) {
                              return ListTile(
                                title: Text(controller.query),
                                leading: const Icon(Icons.search),
                                onTap: () {
                                  print("Selected $selectedTerm");
                                  setState(() {
                                    // addSearchTerm(controller.query);
                                    selectedTerm = controller.query;
                                  });
                                  controller.close();
                                },
                              );
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: filteredSearchHistory!
                                    .map(
                                      (devotee) => ListTile(
                                        title: Text(
                                          devotee,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        leading: const Icon(Icons.history),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: () {
                                            setState(() {
                                              // deleteSearchTerm(devotee);
                                            });
                                          },
                                        ),
                                        onTap: () {
                                          print("onTap of ListTile: $devotee");
                                          setState(
                                            () {
                                              // putSearchTermFirst(branch);
                                              selectedTerm = devotee;

                                              _selectedDevotee =
                                                  _filteredDevotees?.firstWhere(
                                                      (element) =>
                                                          element
                                                              ?.devoteeName ==
                                                          devotee);
                                              print(_selectedDevotee);
                                              _isSearchedSelected = true;
                                            },
                                          );
                                          controller.close();
                                        },
                                      ),
                                    )
                                    .toList(),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              _isSearchedSelected
                  ? Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.yellowAccent[700]),
                            padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                            child: Text(
                              'Name: ${_selectedDevotee?.devoteeName}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.yellowAccent[700]),
                            padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                            child: Text(
                              'BranchName: ${_selectedDevotee?.branchName}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.yellowAccent[700]),
                            padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                            child: Text(
                              'PPID: ${_selectedDevotee?.ppid}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.yellowAccent[700]),
                            padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                            child: Text(
                              'Contact: ${_selectedDevotee?.contact}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.yellowAccent[700]),
                            padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                            child: Text(
                              'Email: ${_selectedDevotee?.email}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.yellowAccent[700]),
                            padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                            child: Text(
                              'Joining Year: ${_selectedDevotee?.joiningYear}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    padding: EdgeInsets.only(
                                        left: 30,
                                        top: 10,
                                        right: 30,
                                        bottom: 10),
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                                onPressed: () async {
                                  if (_selectedDevotee != null) {
                                    updateDevotee = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ManageDevoteeEdit(
                                          devotee: _selectedDevotee!,
                                        ),
                                      ),
                                    );
                                  }
                                  print(updateDevotee);

                                  setState(
                                    () {
                                      _selectedDevotee = updateDevotee;
                                    },
                                  );
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    final devoteeId = DevoteeAPI()
                                        .deleteDevote(_selectedDevotee!);
                                    print(devoteeId);
                                    print(_selectedDevotee);

                                    setState(
                                      () {
                                        _isSearchedSelected = false;
                                      },
                                    );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Document Deleted.')),
                                    );

                                    // Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green,
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          top: 10,
                                          right: 20,
                                          bottom: 10),
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                  child: Text('Delete')),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Text('Search Your Desired Devotee Name'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ManageDevoteeAdd()));
        },
        child: Text('Add'),
      ),
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  late final String searchTerm;

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 64,
            ),
            Text(
              'Start searching',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      );
    }

    //final fsb = FloatingSearchBar.of(context);

    return ListView(
      //padding: EdgeInsets.only(top: fsb.),//top: fsb.height + fsb.margins.vertical),
      children: List.generate(
        40,
        (index) => ListTile(
          title: Text('$searchTerm Start searching'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
