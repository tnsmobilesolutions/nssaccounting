import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraBook extends StatefulWidget {
  const KendraBook({Key? key}) : super(key: key);
  @override
  State<KendraBook> createState() => _KendraBookState();
}

class _KendraBookState extends State<KendraBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Books Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "KeBook"),
        ),
      ),
    );
  }
}
