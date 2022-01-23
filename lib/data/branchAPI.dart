import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:nssaccounting/main.dart';
import 'package:nssaccounting/model/branch.dart';
//import 'package:material_floating_search_bar/material_floating_search_bar.dart';
//import 'package:flutter/material.dart';

class BranchAPI {
  Future<List<Branch?>> getAllBranches() {
    CollectionReference branches =
        FirebaseFirestore.instance.collection('branches');

    final lstBranches = branches.get().then((querySnapshot) {
      List<Branch?> lstBranch = [];
      querySnapshot.docs.forEach((element) {
        final branchData = element.data() as Map<String, dynamic>;
        final branch = Branch.fromMap(branchData);
        lstBranch.add(branch);
      });
      return lstBranch;
    });
    return lstBranches;
  }

  Future<List<Branch?>> getBranchByName(String branchName) {
    CollectionReference branches =
        FirebaseFirestore.instance.collection('branches');

    final lstBranches = branches.get().then((querySnapshot) {
      List<Branch?> lstBranch = [];
      querySnapshot.docs.forEach((element) {
        final branchData = element.data() as Map<String, dynamic>;
        final branch = Branch.fromMap(branchData);
        if ((branch.branchName ?? '').startsWith(branchName)) {
          lstBranch.add(branch);
        }
      });
      return lstBranch;
    });
    return lstBranches;

    // Future queryData(String queryString) async {
    //   return FirebaseFirestore.instance
    //       .collection('branches')
    //       .where('branchName', isGreaterThanOrEqualTo: queryString)
    //       .get();
    // }
  }

  Future<void> createNewBranch(Branch branch) async {
    CollectionReference branchsCol =
        FirebaseFirestore.instance.collection('branches');
    // final reference = await branchsCol.add({
    //   "branchId": branch.branchId,
    //   "branchName": branch.branchName,
    //   "address": branch.address,
    //   "city": branch.city,
    //   "state": branch.state,
    //   "country": branch.country,
    //   "pin": branch.pin,
    //   "devotees": branch.devotees,
    //   "year": branch.year,
    // });

    final reference = await branchsCol.doc(branch.branchId).set(branch.toMap());

    // branchsCol
    //     .doc(branch.branchId)
    //     .update({"branchId": reference.id}).whenComplete(() async {
    //   print("Completed");
    // }).catchError((e) => print(e));

    // return branch.branchId;
  }

  Future updateBranch(Branch branch) async {
    // Implement Update branch logic here
    return FirebaseFirestore.instance
        .collection('branches')
        .doc('${branch.branchId}') // <-- Doc ID where data should be updated.
        .update(branch.toMap());
  }
}

/*
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Bar App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const historyLength = 5;

  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder',
    // 'Anjaw',
    // 'Anuppur',
    // 'Araria',
    // 'Ariyalur',
    // 'Arwal',
    // 'Ashok Nagar',
    // 'Auraiya',
    // 'Aurangabad',
    // 'Aurangabad',
    // 'Azamgarh',
    // 'Wayanad',
    // 'West Champaran',
    // 'West Delhi',
    // 'West Garo Hills',
    // 'West Kameng',
    // 'West Khasi Hills',
    // 'West Siang',
    // 'West Sikkim',
    // 'West Singhbhum',
    // 'West Tripura',
    // 'Wokha',
    // 'Yadgir',
    // 'Yamuna Nagar',
    // 'Yanam',
    // 'Yavatmal',
    // 'Zunheboto',
  ];

  List<String> filteredSearchHistory;

  String selectedTerm;

  //this method filters the search like h, he, hey
  List<String> filterSearchTerms({
    @required String filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  //adds the recent search term
  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  // deletes the search history when someone touches 'x'
  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  // puts recent search item at top
  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  FloatingSearchBarController controller;

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
      body: FloatingSearchBar(
        controller: controller,
        body: FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(
            searchTerm: selectedTerm,
          ),
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: BouncingScrollPhysics(),
        title: Text(
          selectedTerm ?? 'The Search App',
          style: Theme.of(context).textTheme.headline6,
        ),
        hint: 'Search branch',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],

        //when searched item is started being searched
        onQueryChanged: (query) {
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
            borderRadius: BorderRadius.circular(6), // earch history body
            child: Material(
              color: Colors.yellow[100],
              elevation: 4,
              child: Builder(
                builder: (context) {
                  // if (filteredSearchHistory.isEmpty &&
                  //     controller.query.isEmpty) {
                  //   return Container(
                  //     height: 56,
                  //     width: double.infinity,
                  //     alignment: Alignment.center,
                  //     // child: Text(
                  //     //   'Start searching',
                  //     //   maxLines: 10,
                  //     //   overflow: TextOverflow.ellipsis,
                  //     //   style: Theme.of(context).textTheme.caption,
                  //     // ),
                  //   );
                  // } else
                  if (filteredSearchHistory.isEmpty) {
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
                      children: filteredSearchHistory
                          .map(
                            (term) => ListTile(
                              title: Text(
                                term,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              leading: const Icon(Icons.history),
                              trailing: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    deleteSearchTerm(term);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchTermFirst(term);
                                  selectedTerm = term;
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
    );
  }
}

class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

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
          title: Text('$searchTerm'),
          subtitle: Text(index.toString()),
        ),
      ),
    );
  }
}
*/