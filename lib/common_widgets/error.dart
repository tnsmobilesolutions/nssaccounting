import 'package:flutter/material.dart';
import 'package:nssaccounting/theme/theme.dart';

class CommonErrorScreen extends StatelessWidget {
  const CommonErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSS Accounting',
      theme: NATheme.themeData(),
      home: Scaffold(
          body: Center(
        child: Text(
            "Some unexected error occured. Please restart the application or contact administrator if you still get the same error."),
      )),
    );
  }
}
