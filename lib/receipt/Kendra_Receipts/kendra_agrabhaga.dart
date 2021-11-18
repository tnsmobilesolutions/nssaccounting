import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraAgrabhaga extends StatefulWidget {
  const KendraAgrabhaga({Key? key}) : super(key: key);
  @override
  State<KendraAgrabhaga> createState() => _KendraAgrabhagaState();
}

class _KendraAgrabhagaState extends State<KendraAgrabhaga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Agrabhaga Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(),
        ),
      ),
    );
  }
}
