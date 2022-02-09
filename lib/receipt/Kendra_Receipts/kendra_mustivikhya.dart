import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraMustivikhya extends StatefulWidget {
  const KendraMustivikhya({Key? key}) : super(key: key);
  @override
  State<KendraMustivikhya> createState() => _KendraMustivikhyaState();
}

class _KendraMustivikhyaState extends State<KendraMustivikhya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Mustivikhya"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: 'Kendra Mustivikhya'),
        ),
      ),
    );
  }
}
