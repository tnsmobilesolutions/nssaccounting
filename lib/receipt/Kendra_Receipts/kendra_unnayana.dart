import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraUnnayana extends StatefulWidget {
  const KendraUnnayana({Key? key}) : super(key: key);
  @override
  State<KendraUnnayana> createState() => _KendraUnnayanaState();
}

class _KendraUnnayanaState extends State<KendraUnnayana> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Unnayana Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "Kendra Unnayana Fund"),
        ),
      ),
    );
  }
}
