import 'package:flutter/material.dart';
import 'package:nssaccounting/model/receipt.dart';
import 'package:nssaccounting/model/user.dart';

class ReceiptPreview extends StatefulWidget {
  ReceiptPreview({Key? key, this.receipt, this.loggedInUser}) : super(key: key);

  final Receipt? receipt;
  final AppUser? loggedInUser;

  @override
  _ReceiptPreviewState createState() => _ReceiptPreviewState();
}

class _ReceiptPreviewState extends State<ReceiptPreview> {
  @override
  Widget build(BuildContext context) {
    print(widget.receipt?.receiptNo);
    print('${widget.loggedInUser?.name}');
    return Scaffold(
        appBar: AppBar(
          title: Text('Receipt Preview '),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(26, 30, 26, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.receipt?.receiptNo ?? '',
                    style: commonTextStyle(),
                  ),
                ),
                SizedBox(height: 16),
                Divider(color: Colors.black, thickness: 2.0),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Receipt No', style: commonTextStyle()),
                    Text(widget.receipt?.receiptNo ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Receipt Date', style: commonTextStyle()),
                    Text(widget.receipt?.receiptDate.toString() ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Name', style: commonTextStyle()),
                    Text(widget.receipt?.paaliaName ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Head', style: commonTextStyle()),
                    Text(widget.receipt?.accountCode ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment', style: commonTextStyle()),
                    Text(widget.receipt?.paymentMode ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Paid By', style: commonTextStyle()),
                    Text(widget.receipt?.preparedBy ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Received By', style: commonTextStyle()),
                    Text('${widget.loggedInUser?.name}',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Remark', style: commonTextStyle()),
                    Text(widget.receipt?.remarks ?? '',
                        style: commonTextStyle()),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("SHARE"),
                      style: ElevatedButton.styleFrom(
                          elevation: 20, shadowColor: Colors.black),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("PRINT"),
                      style: ElevatedButton.styleFrom(
                          elevation: 20, shadowColor: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  TextStyle commonTextStyle() {
    return TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);
  }
}
