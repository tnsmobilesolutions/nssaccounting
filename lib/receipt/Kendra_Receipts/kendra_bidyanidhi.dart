import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraBidyanidhi extends StatefulWidget {
  const KendraBidyanidhi({Key? key}) : super(key: key);
  @override
  State<KendraBidyanidhi> createState() => _KendraBidyanidhiState();
}

class _KendraBidyanidhiState extends State<KendraBidyanidhi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Bidyanidhi Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: 'KeBidy'),
        ),
      ),
    );
  }
}
