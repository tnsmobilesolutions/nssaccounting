import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraSanghaManjiuri extends StatefulWidget {
  const KendraSanghaManjiuri({Key? key}) : super(key: key);
  @override
  State<KendraSanghaManjiuri> createState() => _KendraSanghaManjiuriState();
}

class _KendraSanghaManjiuriState extends State<KendraSanghaManjiuri> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Sangha Manjuri"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "KeSaMan"),
        ),
      ),
    );
  }
}
