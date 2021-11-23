import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraBhogaPranaami extends StatefulWidget {
  const KendraBhogaPranaami({Key? key}) : super(key: key);
  @override
  State<KendraBhogaPranaami> createState() => _KendraBhogaPranaamiState();
}

class _KendraBhogaPranaamiState extends State<KendraBhogaPranaami> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Bhoga Pranaami"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: 'KeBhPr'),
        ),
      ),
    );
  }
}
