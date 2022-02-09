import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraParichayaPatra extends StatefulWidget {
  const KendraParichayaPatra({Key? key}) : super(key: key);
  @override
  State<KendraParichayaPatra> createState() => _KendraParichayaPatraState();
}

class _KendraParichayaPatraState extends State<KendraParichayaPatra> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Parichaya Patra"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "Kendra Parichaya Patra"),
        ),
      ),
    );
  }
}
