import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraBigraha extends StatefulWidget {
  const KendraBigraha({Key? key}) : super(key: key);
  @override
  State<KendraBigraha> createState() => _KendraBigrahaState();
}

class _KendraBigrahaState extends State<KendraBigraha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Bigraha Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "KeBigra"),
        ),
      ),
    );
  }
}
