import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/data/branchAPI.dart';
import 'package:nssaccounting/model/branch.dart';
//import 'package:nssaccounting/setting_icon_pages/add_manage_branch.dart';
import 'package:nssaccounting/setting_icon_pages/edit_manage_branch.dart';
//import 'package:uuid/uuid.dart';

class SearchBranch extends StatefulWidget {
  SearchBranch({
    Key? key,
  }) : super(key: key);

  @override
  _SearchBranchState createState() => _SearchBranchState();
}

class _SearchBranchState extends State<SearchBranch> {
  Branch? _selectedBranch;
  List<Branch?>? _filteredBranches;
  //bool _folded = true;

  bool _isSearchStarted = true;

  //double _searchbarHeight = 60;

  //static const historyLength = 5;

  //List<String>? _branchHistory;
  //  = [
  //   'atanu',
  //   'amrut',
  //   'abhishek',
  //   'aabha',
  //   'arnav',
  //   'badrinath',
  //   'binayak',
  //   'biswaprakash',
  //   'biswanath',
  //   'chetan',
  //   'chintu',
  //   'dinesh',
  //   'digambar',
  // ];

  List<String>? filteredSearchHistory;

  String? selectedTerm;

  //this method filters the search like h, he, hey
  Future<List<String>> filterSearchTerms({@required String? filter}) async {
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

  // //adds the recent search branch
  // void addSearchTerm(String branch) async {
  //   if (_branchHistory?.contains(branch)) {
  //     putSearchTermFirst(branch);
  //     return;
  //   }
  //   _branchHistory.add(branch);
  //   if (_branchHistory.length > historyLength) {
  //     _branchHistory.removeRange(0, _branchHistory.length - historyLength);
  //   }

  //   filteredSearchHistory = await filterSearchTerms(filter: null);
  // }

  // // deletes the search history when someone touches 'x'
  // void deleteSearchTerm(String branch) async {
  //   _branchHistory.removeWhere((t) => t == branch);
  //   filteredSearchHistory = await filterSearchTerms(filter: null);
  // }

  // // puts recent search item at top
  // void putSearchTermFirst(String branch) {
  //   deleteSearchTerm(branch);
  //   addSearchTerm(branch);
  // }

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
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        centerTitle: true,
        title: Text('Search Branch Name'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
          //backgroundColor: Colors.deepOrange[900],
        ),
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
                    //print("onQueryChanged: $query");
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
                                              // now _selectedBranch has all the information of searched branch
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
              // Center(
              //   child: AnimatedContainer(
              //     duration: const Duration(milliseconds: 400),
              //     width: _folded ? 56 : 200,
              //     height: 56,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(32),
              //       color: Colors.teal[300],
              //       boxShadow: kElevationToShadow[6],
              //     ),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: Container(
              //             padding: const EdgeInsets.only(left: 16),
              //             child: !_folded
              //                 ? const TextField(
              //                     decoration: InputDecoration(
              //                       hintText: 'Search',
              //                       hintStyle: TextStyle(color: Colors.white),
              //                       border: InputBorder.none,
              //                     ),
              //                   )
              //                 : null,
              //           ),
              //         ),
              //         Material(
              //           type: MaterialType.transparency,
              //           child: InkWell(
              //             borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(_folded ? 32 : 0),
              //               topRight: const Radius.circular(32),
              //               bottomLeft: Radius.circular(_folded ? 32 : 0),
              //               bottomRight: const Radius.circular(32),
              //             ),
              //             child: Padding(
              //               padding: const EdgeInsets.all(16.0),
              //               child: Icon(
              //                 _folded ? Icons.search : Icons.close,
              //                 color: Colors.white,
              //               ),
              //             ),
              //             onTap: () {
              //               setState(
              //                 () {
              //                   _folded = !_folded;
              //                 },
              //               );
              //             },
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),

              Builder(builder: (context) {
                return Column(
                  children: [
                    SizedBox(height: 20),
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
                    SizedBox(height: 12),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: CommonStyle.elevatedSubmitButtonStyle(),
          onPressed: () {
            if (_selectedBranch != null) {
              final updatedBranch = Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ManageEditPage(
                    branch: _selectedBranch!,
                  ),
                ),
              );
              print('Updated Branch = $updatedBranch');
              // function will be called here to print the updated branch
            }
          },
          child: Text(
            'Edit',
            style: TextStyle(fontSize: 24),
          ),
        ),
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


// class MyAlertDialog extends StatelessWidget {
//   final String title;
//   final String content;
//   final List<Widget> actions;

//   MyAlertDialog({
//     this.title,
//     this.content,
//     this.actions = const [],
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(
//         this.title,
//         style: Theme.of(context).textTheme.headline6,
//       ),
//       actions: this.actions,
//       content: Text(
//         this.content,
//         style: Theme.of(context).textTheme.bodyText2,
//       ),
//     );
//   }
// }