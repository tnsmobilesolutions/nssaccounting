import 'package:flutter/material.dart';
import 'package:nssaccounting/common_widgets/kendra_widget.dart';

class KendraSthaiNityabhoga extends StatefulWidget {
  const KendraSthaiNityabhoga({Key? key}) : super(key: key);
  @override
  State<KendraSthaiNityabhoga> createState() => _KendraSthaiNityabhogaState();
}

class _KendraSthaiNityabhogaState extends State<KendraSthaiNityabhoga> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kendra Sthai Nityabhoga Fund"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: KendraWidget(accountCodeName: "Kendra Sthai Nityabhoga Fund"),
        ),
      ),
    );
  }
}
