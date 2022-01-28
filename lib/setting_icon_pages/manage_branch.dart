//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/branchAPI.dart';
import 'package:nssaccounting/model/branch.dart';
import 'package:nssaccounting/setting_icon_pages/add_manage_branch.dart';
import 'package:nssaccounting/setting_icon_pages/edit_manage_branch.dart';
//import 'package:uuid/uuid.dart';

class ManageBranch extends StatefulWidget {
  ManageBranch({Key? key}) : super(key: key);
  Branch? currentBranch;
  @override
  _ManageBranchState createState() => _ManageBranchState();
}

class _ManageBranchState extends State<ManageBranch> {
  Branch? _selectedBranch;
  List<Branch?>? _filteredBranches;
  var updatedBranch = null;

  double _searchbarHeight = 60;

  List<String>? filteredSearchHistory;

  String? selectedTerm;

  bool _isSearchSelected = false;

  //this method filters the search like h, he, hey
  Future<List<String>> filterSearchTerms({
    @required String? filter,
  }) async {
    if (filter != null && filter.isNotEmpty) {
      final branches = await BranchAPI().getBranchByName(filter);
      setState(() {
        _filteredBranches = branches;
      });
      return branches.map((b) => b?.branchName ?? "").toList();
    } else {
      return [];
    }
  }

  late FloatingSearchBarController controller;

  // initiates the search
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
        // backgroundColor: Colors.deepOrange[900],
        title: Text('Manage Branch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // TextFormField(
              //   decoration: InputDecoration(
              //       hintText: 'search By Devotee Name',
              //       icon: Icon(Icons.search)),
              // ),
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
                  hint: 'Search branch',
                  actions: [
                    FloatingSearchBarAction.searchToClear(),
                  ],

                  //when searched item is started being searched
                  onQueryChanged: (query) async {
                    print("onQueryChanged: $query");
                    final lstBranches = await filterSearchTerms(filter: query);
                    print(lstBranches);
                    setState(() {
                      filteredSearchHistory = lstBranches;
                    });
                  },
                  onSubmitted: (query) {
                    print("onSubmitted: $query");

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
                                      (branch) => ListTile(
                                        title: Text(
                                          branch,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        leading: const Icon(Icons.history),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: () {
                                            setState(() {
                                              // deleteSearchTerm(branch);
                                            });
                                          },
                                        ),
                                        onTap: () {
                                          print("onTap of ListTile: $branch");
                                          setState(
                                            () {
                                              // putSearchTermFirst(branch);
                                              selectedTerm = branch;

                                              _selectedBranch =
                                                  _filteredBranches?.firstWhere(
                                                      (element) =>
                                                          element?.branchName ==
                                                          branch);
                                              _isSearchSelected = true;
                                              print(_selectedBranch);
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
              _isSearchSelected
                  ? Container(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.yellowAccent[700]),
                            padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                            child: Text(
                              'Branch Name: ${_selectedBranch?.branchName}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.yellowAccent[700]),
                            padding: EdgeInsets.fromLTRB(18, 5, 18, 5),
                            child: Text(
                              'Address: ${_selectedBranch?.address}',
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
                              'Number of devotees: ${_selectedBranch?.devotees}',
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
                              'Established year: ${_selectedBranch?.year}',
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
                              'City: ${_selectedBranch?.city}',
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
                              'State: ${_selectedBranch?.state}',
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
                              'Country: ${_selectedBranch?.country}',
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
                              'Pincode: ${_selectedBranch?.pin}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 22),
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
                                  if (_selectedBranch != null) {
                                    updatedBranch = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ManageEditPage(
                                          branch: _selectedBranch!,
                                        ),
                                      ),
                                    );

                                    // print(updatedBranch);
                                    // _isSearchSelected = false;
                                    if (updatedBranch != null) {
                                      setState(
                                        () {
                                          _selectedBranch = updatedBranch;
                                        },
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  'Edit',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                              ElevatedButton(
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
                                onPressed: () async {
                                  if (_selectedBranch != null) {
                                    var collection = FirebaseFirestore.instance
                                        .collection('branches');
                                    collection
                                        .doc(_selectedBranch!.branchId)
                                        .delete();

                                    setState(() {
                                      _isSearchSelected = false;
                                    });
                                  }
                                },
                                child: Text(
                                  'Delete',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ],
                          ),
                          // EditBranch().getContainer1(_selectedBranch)
                        ],
                      ),
                    )
                  : Text('Search Branch By Name'),
              SizedBox(height: 12),
            ],
          ),
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
