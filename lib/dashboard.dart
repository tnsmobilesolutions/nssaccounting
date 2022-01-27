import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nssaccounting/dashboard_pages/kendra.dart';
import 'package:nssaccounting/dashboard_pages/pv.dart';
import 'package:nssaccounting/dashboard_pages/samilani.dart';
import 'package:nssaccounting/dashboard_pages/sm.dart';
import 'package:nssaccounting/dashboard_pages/ssm.dart';
import 'package:nssaccounting/model/user.dart';
import 'package:nssaccounting/search/search_main.dart';
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
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SSM(),
    SM(),
    Samilani(),
    Kendra(),
    PaymentVoucher(),
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchMain()));
                  },
                  child: Icon(Icons.search),
                ),
              ),
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
                ),
              ),
            ],
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: navbarWidget(context),
    );
  }

  BottomNavigationBar navbarWidget(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'SSM',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'SM',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group_work),
          label: 'Sammilani',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.center_focus_strong),
          label: 'Kendra',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments_rounded),
          label: 'P Voucher',
          backgroundColor: Colors.blue,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amberAccent,
      onTap: _onItemTapped,
    );
  }
}
