// import 'package:flutter/material.dart';
// import 'package:nssaccounting/dashboard_pages/kendra.dart';
// import 'package:nssaccounting/dashboard_pages/samilani.dart';
// import 'package:nssaccounting/dashboard_pages/sm.dart';
// import 'package:nssaccounting/dashboard_pages/ssm.dart';
// import 'package:nssaccounting/model/user.dart';
// import 'package:nssaccounting/search/search_main.dart';
// import 'package:nssaccounting/settings.dart';

// class DashboardScreen1 extends StatefulWidget {
//   DashboardScreen1({Key? key, this.loggedInUser}) : super(key: key);

//   final AppUser? loggedInUser;

//   @override
//   _DashboardScreen1State createState() => _DashboardScreen1State();
// }

// class _DashboardScreen1State extends State<DashboardScreen1> {
//   int _selectedIndex = 0;

//   static List<Widget> _widgetOptions = <Widget>[
//     SSM(),
//     SM(),
//     Samilani(),
//     Kendra(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("NSS Accounting"),
//           actions: [
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(right: 20),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => SearchMain()));
//                     },
//                     child: Icon(Icons.search),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(right: 20.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => SettingsScreen(
//                                   loggedInUser: widget.loggedInUser,
//                                 )),
//                       );
//                     },
//                     child: Icon(Icons.settings),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         body: Center(
//           // ignore: avoid_returning_null_for_void
//           // onTap: () => null,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               InkWell(
//                 onTap: () => '',
//                 child: Container(
//                   // height: 50.0,
//                   width: 200.0,
//                   decoration: BoxDecoration(
//                     boxShadow: const [
//                       BoxShadow(
//                           offset: Offset(0.0, 30.0),
//                           blurRadius: 30.0,
//                           color: Colors.black12)
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(22.0),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 50.0,
//                         width: 160.0,
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 13.5, horizontal: 12.0),
//                         child: const Text(
//                           'Bhakta Seva Pali',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                           // style: Theme.of(context)
//                           //     .textTheme
//                           //     .button
//                           //     ?.apply(color: Colors.black),
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.teal[200],
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(95.0),
//                             topLeft: Radius.circular(95.0),
//                             bottomRight: Radius.circular(200.0),
//                           ),
//                         ),
//                       ),
//                       const Icon(
//                         Icons.search,
//                         size: 30.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () => '',
//                 child: Container(
//                   // height: 50.0,
//                   width: 200.0,
//                   decoration: BoxDecoration(
//                     boxShadow: const [
//                       BoxShadow(
//                           offset: Offset(0.0, 30.0),
//                           blurRadius: 30.0,
//                           color: Colors.black12)
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(22.0),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 50.0,
//                         width: 160.0,
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 13.5, horizontal: 12.0),
//                         child: const Text(
//                           'Antevasi Pranami',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                           // style: Theme.of(context)
//                           //     .textTheme
//                           //     .button
//                           //     ?.apply(color: Colors.black),
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.teal[200],
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(95.0),
//                             topLeft: Radius.circular(95.0),
//                             bottomRight: Radius.circular(200.0),
//                           ),
//                         ),
//                       ),
//                       const Icon(
//                         Icons.add,
//                         size: 30.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () => '',
//                 child: Container(
//                   // height: 50.0,
//                   width: 200.0,
//                   decoration: BoxDecoration(
//                     boxShadow: const [
//                       BoxShadow(
//                           offset: Offset(0.0, 30.0),
//                           blurRadius: 30.0,
//                           color: Colors.black12)
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(22.0),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 50.0,
//                         width: 160.0,
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 13.5, horizontal: 12.0),
//                         child: const Text(
//                           'Prasad Pranami',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                           // style: Theme.of(context)
//                           //     .textTheme
//                           //     .button
//                           //     ?.apply(color: Colors.black),
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.teal[200],
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(95.0),
//                             topLeft: Radius.circular(95.0),
//                             bottomRight: Radius.circular(200.0),
//                           ),
//                         ),
//                       ),
//                       const Icon(
//                         Icons.delete_forever_rounded,
//                         size: 30.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () => '',
//                 child: Container(
//                   // height: 50.0,
//                   width: 200.0,
//                   decoration: BoxDecoration(
//                     boxShadow: const [
//                       BoxShadow(
//                           offset: Offset(0.0, 30.0),
//                           blurRadius: 30.0,
//                           color: Colors.black12)
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(22.0),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 50.0,
//                         width: 160.0,
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 13.5, horizontal: 12.0),
//                         child: const Text(
//                           'Paada Pranami',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                           // style: Theme.of(context)
//                           //     .textTheme
//                           //     .button
//                           //     ?.apply(color: Colors.black),
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.teal[200],
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(95.0),
//                             topLeft: Radius.circular(95.0),
//                             bottomRight: Radius.circular(200.0),
//                           ),
//                         ),
//                       ),
//                       const Icon(
//                         Icons.delete_forever_rounded,
//                         size: 30.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () => '',
//                 child: Container(
//                   // height: 50.0,
//                   width: 200.0,
//                   decoration: BoxDecoration(
//                     boxShadow: const [
//                       BoxShadow(
//                           offset: Offset(0.0, 30.0),
//                           blurRadius: 30.0,
//                           color: Colors.black12)
//                     ],
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(22.0),
//                   ),
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 50.0,
//                         width: 160.0,
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 13.5, horizontal: 12.0),
//                         child: const Text(
//                           'Miscellaneous',
//                           style: TextStyle(
//                             fontSize: 20,
//                           ),
//                           // style: Theme.of(context)
//                           //     .textTheme
//                           //     .button
//                           //     ?.apply(color: Colors.black),
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.teal[200],
//                           borderRadius: const BorderRadius.only(
//                             bottomLeft: Radius.circular(95.0),
//                             topLeft: Radius.circular(95.0),
//                             bottomRight: Radius.circular(200.0),
//                           ),
//                         ),
//                       ),
//                       const Icon(
//                         Icons.delete_forever_rounded,
//                         size: 30.0,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         // body: _widgetOptions.elementAt(_selectedIndex),
//         //bottomNavigationBar: navbarWidget(context),
//       ),
//     );
//   }

//   BottomNavigationBar navbarWidget(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.teal[800],
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.business),
//           label: 'SSM',
//           backgroundColor: Colors.blue,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'SM',
//           backgroundColor: Colors.blue,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.group_work),
//           label: 'Sammilani',
//           backgroundColor: Colors.blue,
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.center_focus_strong),
//           label: 'Kendra',
//           backgroundColor: Colors.blue,
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor: Colors.amberAccent,
//       onTap: _onItemTapped,
//     );
//   }
// }
