//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/data/accountsAPI.dart';
import 'package:nssaccounting/model/account.dart';

import 'package:nssaccounting/setting_icon_pages/add_manage_account.dart';
import 'package:nssaccounting/setting_icon_pages/edit_manage_account.dart';
//import 'package:uuid/uuid.dart';

class ManageAccount extends StatefulWidget {
  ManageAccount({Key? key}) : super(key: key);
  Account? currentBranch;
  @override
  _ManageAccountState createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  Account? _selectedAccount;
  List<Account?>? _filteredAccounts;
  var updatedAccount;

  //double _searchbarHeight = 60;

  List<String>? filteredSearchHistory;

  String? selectedTerm;

  bool _isSearchSelected = false;

  //this method filters the search like h, he, hey
  Future<List<String>> filterSearchTerms({
    @required String? filter,
  }) async {
    if (filter != null && filter.isNotEmpty) {
      final accounts = await AccountsAPI().getAllAccounts();
      setState(() {
        _filteredAccounts = accounts;
      });
      return accounts.map((b) => b?.accountName ?? "").toList();
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
        title: Text('Manage Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
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
                  hint: 'Search account',
                  actions: [
                    FloatingSearchBarAction.searchToClear(),
                  ],

                  //when searched item is started being searched
                  onQueryChanged: (query) async {
                    print("onQueryChanged: $query");
                    final lstAccounts = await filterSearchTerms(filter: query);
                    print(lstAccounts);
                    setState(() {
                      filteredSearchHistory = lstAccounts;
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
                                      (account) => ListTile(
                                        title: Text(
                                          account,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        leading: const Icon(Icons.history),
                                        trailing: IconButton(
                                          icon: const Icon(Icons.clear),
                                          onPressed: () {
                                            setState(() {
                                              // deleteSearchTerm(account);
                                            });
                                          },
                                        ),
                                        onTap: () {
                                          print("onTap of ListTile: $account");
                                          setState(
                                            () {
                                              // putSearchTermFirst(account);
                                              selectedTerm = account;

                                              _selectedAccount =
                                                  _filteredAccounts?.firstWhere(
                                                      (element) =>
                                                          element
                                                              ?.accountName ==
                                                          account);
                                              _isSearchSelected = true;
                                              print(_selectedAccount);
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
                              'Account Name: ${_selectedAccount?.accountName}',
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
                              'Account Code: ${_selectedAccount?.accountCode}',
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
                              'Account Type: ${_selectedAccount?.accountType}',
                              style: TextStyle(fontSize: 22),
                            ),
                            width: double.infinity,
                          ),
                          SizedBox(height: 12),
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
                                  if (_selectedAccount != null) {
                                    updatedAccount = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ManageEditAccount(
                                          account: _selectedAccount!,
                                        ),
                                      ),
                                    );

                                    if (updatedAccount != null) {
                                      setState(
                                        () {
                                          _selectedAccount = updatedAccount;
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
                                  if (_selectedAccount != null) {
                                    var collection = FirebaseFirestore.instance
                                        .collection('accounts');
                                    collection
                                        .doc(_selectedAccount!.accountId)
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
                        ],
                      ),
                    )
                  : Text('Search Account By Name'),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ManageAddAccount(),
            ),
          );
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

    return ListView(
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
