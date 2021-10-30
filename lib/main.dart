import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nssaccounting/login.dart';
import 'package:nssaccounting/widgetConfig.dart';
import 'package:nssaccounting/widgetTile.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  final mySwatchColor = const MaterialColor(0xFFEDF2FF, const {
    50: const Color(0xFFEDF2FF),
    100: const Color(0xFFD1DEFE),
    200: const Color(0xFFB3C9FD),
    300: const Color(0xFF92B2FB),
    400: const Color(0xFF769DF8),
    500: const Color(0xFF5A89F6),
    600: const Color(0xFF527FEA),
    700: const Color(0xFF4873DC),
    800: const Color(0xFF4068D0),
    900: const Color(0xFF3355BA)
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSS Accounting',
      theme: ThemeData(
        primarySwatch: Colors.blue, // #F6F8FC
        // colorScheme: ColorScheme(primary: primary, primaryVariant: primaryVariant, secondary: secondary, secondaryVariant: secondaryVariant, surface: surface, background: background, error: error, onPrimary: onPrimary, onSecondary: onSecondary, onSurface: onSurface, onBackground: onBackground, onError: onError, brightness: brightness),
        scaffoldBackgroundColor: Colors.white, //Color(0xFFEDF2FF),
        backgroundColor: Colors.white,
        // inputDecorationTheme: InputDecorationTheme(

        // )
      ),
      home: LoginScreen(),
    );
  }
}
