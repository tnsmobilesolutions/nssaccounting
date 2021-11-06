import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nssaccounting/dashboard_pages/kendra.dart';
import 'package:nssaccounting/dashboard_pages/samilani.dart';
import 'package:nssaccounting/dashboard_pages/sm.dart';
import 'package:nssaccounting/dashboard_pages/ssm.dart';
import 'package:nssaccounting/model/user.dart';
import 'package:nssaccounting/settings.dart';
import 'package:nssaccounting/widgetConfig.dart';
import 'package:nssaccounting/widgetTile.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key, this.loggedInUser}) : super(key: key);

  final AppUser? loggedInUser;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<WidgetTileConfig> widgetTiles = WidgetConfig.widgetTiles;

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SSM(),
    SM(),
    Samilani(),
    Kendra(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.loggedInUser?.userId);
    return Scaffold(
      appBar: AppBar(
        title: Text("NSS Accounting"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SettingsScreen(
                              loggedInUser: widget.loggedInUser,
                            )),
                  );
                },
                child: Icon(Icons.settings),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: widgetTiles.length,
          itemBuilder: (BuildContext context, int index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => widgetTiles[index].widget),
              );
            },
            child: new Container(
                color: widgetTiles[index].backgroundColor,
                child: Column(
                  children: [
                    Text(widgetTiles[index].title),
                    Text(widgetTiles[index].subTitle)
                  ],
                )),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(
              widgetTiles[index].crossAxisCellCount,
              widgetTiles[index].mainAxisCellCount.toDouble()),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
      ),
      bottomNavigationBar: navbarWidget(context),
    );
  }

  BottomNavigationBar navbarWidget(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.safety_divider),
          label: 'SSM',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.safety_divider),
          label: 'SM',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.safety_divider),
          label: 'Samilani',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.safety_divider),
          label: 'Kendra',
          backgroundColor: Colors.blue,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).backgroundColor,
      onTap: _onItemTapped,
    );
  }
}
