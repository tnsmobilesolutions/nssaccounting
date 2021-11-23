import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraSatabarshikiUtshav extends StatefulWidget {
  const KendraSatabarshikiUtshav({Key? key}) : super(key: key);
  @override
  State<KendraSatabarshikiUtshav> createState() =>
      _KendraSatabarshikiUtshavState();
}

class _KendraSatabarshikiUtshavState extends State<KendraSatabarshikiUtshav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Satabarshiki Utshav Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "KeSaUt"),
        ),
      ),
    );
  }
}
