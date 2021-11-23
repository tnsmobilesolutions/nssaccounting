import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraSwastyaSeva extends StatefulWidget {
  const KendraSwastyaSeva({Key? key}) : super(key: key);
  @override
  State<KendraSwastyaSeva> createState() => _KendraSwastyaSevaState();
}

class _KendraSwastyaSevaState extends State<KendraSwastyaSeva> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Swastya Seva Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "KeSwSe"),
        ),
      ),
    );
  }
}
