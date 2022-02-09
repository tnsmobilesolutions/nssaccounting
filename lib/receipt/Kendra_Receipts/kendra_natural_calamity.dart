import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraNaturalCalamity extends StatefulWidget {
  const KendraNaturalCalamity({Key? key}) : super(key: key);
  @override
  State<KendraNaturalCalamity> createState() => _KendraNaturalCalamityState();
}

class _KendraNaturalCalamityState extends State<KendraNaturalCalamity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Natural Calamity"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "Kendra Natural Calamity"),
        ),
      ),
    );
  }
}
