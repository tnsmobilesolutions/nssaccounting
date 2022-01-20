import 'package:flutter/material.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nssaccounting/login.dart';
import 'package:nssaccounting/theme/theme.dart';
// import 'package:nssaccounting/widgetConfig.dart';
// import 'package:nssaccounting/widgetTile.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

import 'common_widgets/error.dart';
import 'common_widgets/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return CommonErrorScreen();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'NSS Accounting',
            theme: NATheme.themeData(),
            home: LoginScreen(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}
