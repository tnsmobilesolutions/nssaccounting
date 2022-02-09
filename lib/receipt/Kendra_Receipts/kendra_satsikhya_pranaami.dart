import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraSatsikhyaPranaami extends StatefulWidget {
  const KendraSatsikhyaPranaami({Key? key}) : super(key: key);
  @override
  State<KendraSatsikhyaPranaami> createState() =>
      _KendraSatsikhyaPranaamiState();
}

class _KendraSatsikhyaPranaamiState extends State<KendraSatsikhyaPranaami> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Sat Sikhya Pranaami"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "Kendra Sat Sikhya Pranaami"),
        ),
      ),
    );
  }
}
