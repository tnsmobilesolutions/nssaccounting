import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/model/receipt.dart';

class SearchAPI {
  Future<List<Receipt>?> getAllReceipt() {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final lstReceipts = receipts.get().then((querySnapshot) {
      List<Receipt>? lstReceipt = [];
      querySnapshot.docs.forEach((element) {
        final receiptData = element.data() as Map<String, dynamic>;
        print(receiptData);
        final receipt = Receipt.fromMap(receiptData);
        lstReceipt.add(receipt);
      });
      return lstReceipt;
    });
    return lstReceipts;
  }

  Future<List<Receipt>?> getReceiptByName(String name) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final lstReceipts = receipts.get().then((querySnapshot) {
      List<Receipt>? lstReceipt = [];
      querySnapshot.docs.forEach((element) {
        final receiptData = element.data() as Map<String, dynamic>;
        print(receiptData);
        final receipt = Receipt.fromMap(receiptData);
        if ((receipt.paaliaName ?? '').startsWith(name)) {
          lstReceipt.add(receipt);
        }
      });
      return lstReceipt;
    });
    return lstReceipts;
  }

  Future<List<Receipt>?> getReceiptByReceiptDate(DateTime? date) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final lstReceipts = receipts.get().then((querySnapshot) {
      List<Receipt>? lstReceipt = [];
      querySnapshot.docs.forEach((element) {
        final receiptData = element.data() as Map<String, dynamic>;
        print(receiptData);
        final receipt = Receipt.fromMap(receiptData);
        if (receipt.receiptDate == date) {
          lstReceipt.add(receipt);
        }
      });
      return lstReceipt;
    });
    return lstReceipts;
  }

  Future<List<Receipt>?> getReceiptByAccount(String account) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final lstReceipts = receipts.get().then((querySnapshot) {
      List<Receipt>? lstReceipt = [];
      querySnapshot.docs.forEach((element) {
        final receiptData = element.data() as Map<String, dynamic>;
        print(receiptData);
        final receipt = Receipt.fromMap(receiptData);
        if ((receipt.accountCode ?? '').startsWith(account)) {
          lstReceipt.add(receipt);
        }
      });
      return lstReceipt;
    });
    return lstReceipts;
  }
}
