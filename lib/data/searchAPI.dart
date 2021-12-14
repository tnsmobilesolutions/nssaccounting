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
}
