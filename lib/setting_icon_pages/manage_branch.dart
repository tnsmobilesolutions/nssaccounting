//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/model/branch.dart';
import 'package:nssaccounting/setting_icon_pages/add_manage_branch.dart';
import 'package:nssaccounting/setting_icon_pages/edit_manage_branch.dart';
import 'package:nssaccounting/data/branchAPI.dart';

class ManageBranch extends StatefulWidget {
  ManageBranch({Key? key}) : super(key: key);

  @override
  _ManageBranchState createState() => _ManageBranchState();
}

class _ManageBranchState extends State<ManageBranch> {
  Branch? _branch;

  static const historyLength = 5;

  List<String> _searchHistory = [
    'atanu',
    'amrut',
    'abhishek',
    'aabha',
    'arnav',
    'badrinath',
    'binayak',
    'biswaprakash',
    'biswanath',
    'chetan',
    'chintu',
    'dinesh',
    'digambar',
  ];

  List<String>? filteredSearchHistory;

  String? selectedTerm;

  //this method filters the search like h, he, hey
  List<String> filterSearchTerms({
    @required String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      final branches = BranchAPI().getBranchByName(filter);
      return _searchHistory
          .where((branch) => branch.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.toList();
    }
  }

  //adds the recent search branch
  void addSearchTerm(String branch) {
    if (_searchHistory.contains(branch)) {
      putSearchTermFirst(branch);
      return;
    }
    _searchHistory.add(branch);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  // deletes the search history when someone touches 'x'
  void deleteSearchTerm(String branch) {
    _searchHistory.removeWhere((t) => t == branch);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  // puts recent search item at top
  void putSearchTermFirst(String branch) {
    deleteSearchTerm(branch);
    addSearchTerm(branch);
  }

  late FloatingSearchBarController controller;

  // initiates the search
  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
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
        title: Text('Manage Branch'),
      ),
      body: FloatingSearchBar(
        automaticallyImplyBackButton: false,
        closeOnBackdropTap: false,
        controller: controller,
        // body: FloatingSearchBarScrollNotifier(
        //   child: SearchResultsListView(
        //     searchTerm: selectedTerm,
        //   ),
        // ),
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
          print(query);
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query) {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(6), // search history body
            child: Material(
              color: Colors.yellow[100],
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
                        setState(() {
                          addSearchTerm(controller.query);
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
                                    deleteSearchTerm(branch);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchTermFirst(branch);
                                  selectedTerm = branch;
                                });
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
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: CommonStyle.elevatedSubmitButtonStyle(),
          onPressed: () {
            if (_branch != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ManageEditPage(
                            branch: _branch!,
                          )));
            }
          },
          child: Text(
            'Edit',
            style: TextStyle(fontSize: 24),
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
