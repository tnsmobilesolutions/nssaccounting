import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/model/receipt.dart';

class ReceiptAPI {
  Future<String> createNewReceipt(Receipt receipt) async {
    CollectionReference receiptsCol =
        FirebaseFirestore.instance.collection('receipts');
    final reference = await receiptsCol.add({
      "accountCode": receipt.accountCode,
      "amount": receipt.amount,
      "devoteeId": receipt.devoteeId,
      "paaliaName": receipt.paaliaName,
      "notMember": receipt.notMember,
      "paymentMode": receipt.paymentMode,
      "paymentType": receipt.paymentType,
      "preparedBy": receipt.preparedBy,
      "receiptDate": receipt.receiptDate,
      "receiptId": receipt.receiptId,
      "receiptNo": receipt.receiptNo,
      "remarks": receipt.remarks,
      "transactionRefNo": receipt.transactionRefNo,
      "paidBy": receipt.paidBy
    });
    return reference.id;
  }
}
