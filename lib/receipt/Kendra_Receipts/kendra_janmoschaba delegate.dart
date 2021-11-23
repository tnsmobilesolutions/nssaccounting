import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraJanmoschabaDelegate extends StatefulWidget {
  const KendraJanmoschabaDelegate({Key? key}) : super(key: key);
  @override
  State<KendraJanmoschabaDelegate> createState() =>
      _KendraJanmoschabaDelegateState();
}

class _KendraJanmoschabaDelegateState extends State<KendraJanmoschabaDelegate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Janmoschaba Delegate/Pranaami"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: 'KeIaDe'),
        ),
      ),
    );
  }
}
