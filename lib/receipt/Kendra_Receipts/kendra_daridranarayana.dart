import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/common_style.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraDaridraNarayana extends StatefulWidget {
  const KendraDaridraNarayana({Key? key}) : super(key: key);
  @override
  State<KendraDaridraNarayana> createState() => _KendraDaridraNarayanaState();
}

class _KendraDaridraNarayanaState extends State<KendraDaridraNarayana> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Daridra Narayana Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: 'Kendra Daridra Narayana Fund'),
        ),
      ),
    );
  }
}
