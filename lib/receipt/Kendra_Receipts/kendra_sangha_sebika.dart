import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraSanghaSebika extends StatefulWidget {
  const KendraSanghaSebika({Key? key}) : super(key: key);
  @override
  State<KendraSanghaSebika> createState() => _KendraSanghaSebikaState();
}

class _KendraSanghaSebikaState extends State<KendraSanghaSebika> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Sangha Sevak"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "Kendra Sangha Sevak"),
        ),
      ),
    );
  }
}
