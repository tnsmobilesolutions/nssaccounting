import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraNirvikalpaSiddhisthala extends StatefulWidget {
  const KendraNirvikalpaSiddhisthala({Key? key}) : super(key: key);
  @override
  State<KendraNirvikalpaSiddhisthala> createState() =>
      _KendraNirvikalpaSiddhisthalaState();
}

class _KendraNirvikalpaSiddhisthalaState
    extends State<KendraNirvikalpaSiddhisthala> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Nirvikalpa Siddhisthala Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "KeNiSi"),
        ),
      ),
    );
  }
}
