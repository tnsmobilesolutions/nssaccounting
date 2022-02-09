import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/model/receipt.dart';

class ReceiptAPI {
  Future<String?> createNewReceipt(Receipt receipt) async {
    CollectionReference receiptsCol =
        FirebaseFirestore.instance.collection('receipts');

    await receiptsCol.doc(receipt.receiptId).set(receipt.toMap());
    return receipt.receiptId;
  }

  // Future<String?> getAccountNameFromCode(String code) async {
  //   CollectionReference accountCol =
  //       FirebaseFirestore.instance.collection('accounts');

  //   Future<List<Account?>> get allPaymentAccounts async {
  //   final allAccts = await AccountsAPI().getAllAccounts();
  //   return allAccts
  //       .where((element) => element?.accountType == "Payment")
  //       .toList();
  // }
  // }

}
