import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraGruhasanaPranaami extends StatefulWidget {
  const KendraGruhasanaPranaami({Key? key}) : super(key: key);
  @override
  State<KendraGruhasanaPranaami> createState() =>
      _KendraGruhasanaPranaamiState();
}

class _KendraGruhasanaPranaamiState extends State<KendraGruhasanaPranaami> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Gruhasana Pranaami"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: 'KeGrPr'),
        ),
      ),
    );
  }
}
