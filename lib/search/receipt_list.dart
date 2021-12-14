import 'package:flutter/material.dart';
import 'package:nssaccounting/main.dart';
import 'package:nssaccounting/model/receipt.dart';

class ReceiptList extends StatefulWidget {
  ReceiptList({Key? key, this.receipts}) : super(key: key);

  final List<Receipt>? receipts;

  @override
  _ReceiptListState createState() => _ReceiptListState();
}

class _ReceiptListState extends State<ReceiptList> {
  //final List<int> colorCodes = <int>[600, 500, 400];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: widget.receipts?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              //color: Colors.amber[colorCodes[index]],
              // child: Center(child: Text('Entry ${entries[index]}')),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.receipts?[index].receiptNo ?? ''),
                        Text(widget.receipts?[index].receiptDate.toString() ??
                            ''),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.receipts?[index].paaliaName ?? ''),
                        Text(widget.receipts?[index].amount.toString() ?? ''),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
