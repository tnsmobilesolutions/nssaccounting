import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraPrasaadiDrabya extends StatefulWidget {
  const KendraPrasaadiDrabya({Key? key}) : super(key: key);
  @override
  State<KendraPrasaadiDrabya> createState() => _KendraPrasaadiDrabyaState();
}

class _KendraPrasaadiDrabyaState extends State<KendraPrasaadiDrabya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Prasasdi Drabya"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "Kendra Prasasdi Drabya"),
        ),
      ),
    );
  }
}
