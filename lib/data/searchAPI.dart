import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:nssaccounting/model/receipt.dart';

class SearchAPI {
  Future<List<Receipt>?> getAllReceipt() {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final lstReceipts = receipts.get().then(
      (querySnapshot) {
        List<Receipt>? lstReceipt = [];
        querySnapshot.docs.forEach(
          (element) {
            final receiptData = element.data() as Map<String, dynamic>;
            print(receiptData);
            final receipt = Receipt.fromMap(receiptData);
            lstReceipt.add(receipt);
          },
        );
        return lstReceipt;
      },
    );
    return lstReceipts;
  }

  Future<List<Receipt>?> getReceiptByName(String name) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    print('all receipt here');
    print(receipts);
    print(name);

    final lstReceipts = receipts.get().then(
      (querySnapshot) {
        List<Receipt>? lstReceipt = [];
        print(querySnapshot.docs.length);
        querySnapshot.docs.forEach(
          (element) {
            final receiptData = element.data() as Map<String, dynamic>;
            print(receiptData);
            final receipt = Receipt.fromMap(receiptData);
            if ((receipt.paaliaName ?? '').startsWith(name)) {
              lstReceipt.add(receipt);
            }
          },
        );
        return lstReceipt;
      },
    );
    return lstReceipts;
  }

  Future<List<Receipt>?> getReceiptByBranchName(String branchName) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    print('all receipt here');
    print(receipts);
    print(branchName);

    final lstReceipts = receipts.get().then(
      (querySnapshot) {
        List<Receipt>? lstReceipt = [];
        print(querySnapshot.docs.length);
        querySnapshot.docs.forEach(
          (element) {
            final receiptData = element.data() as Map<String, dynamic>;
            print(receiptData);
            final receipt = Receipt.fromMap(receiptData);
            if ((receipt.branchName ?? '').startsWith(branchName)) {
              lstReceipt.add(receipt);
            }
          },
        );
        return lstReceipt;
      },
    );
    return lstReceipts;
  }

  Future<Receipt?> getReceiptByReceiptNo(String receiptNo) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final lstReceipts = receipts.get().then(
      (querySnapshot) {
        List<Receipt>? lstReceipt = [];
        querySnapshot.docs.forEach(
          (element) {
            final receiptData = element.data() as Map<String, dynamic>;

            print(receiptData);
            final receipt = Receipt.fromMap(receiptData);
            if (receipt.receiptNo == receiptNo) {
              lstReceipt.add(receipt);
            }
          },
        );
        return lstReceipt[0];
      },
    );
    return lstReceipts;
  }

  Future<List<Receipt>?> getReceiptByReceiptDate(DateTime? date) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    final lstReceipts = receipts.get().then(
      (querySnapshot) {
        List<Receipt>? lstReceipt = [];
        querySnapshot.docs.forEach(
          (element) {
            final receiptData = element.data() as Map<String, dynamic>;
            print(receiptData);
            final receipt = Receipt.fromMap(receiptData);
            if (formatter.format(receipt.receiptDate!) ==
                formatter.format(date!)) {
              lstReceipt.add(receipt);
            }
          },
        );
        return lstReceipt;
      },
    );
    return lstReceipts;
  }

  Future<List<Receipt>?> getReceiptByPaaliDate(DateTime? paaliDate) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    final lstReceipts = receipts.get().then(
      (querySnapshot) {
        List<Receipt>? lstReceipt = [];
        querySnapshot.docs.forEach(
          (element) {
            final receiptData = element.data() as Map<String, dynamic>;
            print(receiptData);
            final receipt = Receipt.fromMap(receiptData);
            if (formatter.format(receipt.paaliDate!) ==
                formatter.format(paaliDate!)) {
              lstReceipt.add(receipt);
            }
          },
        );
        return lstReceipt;
      },
    );
    return lstReceipts;
  }

  Future<List<Receipt>?> getReceiptByAccount(String account) {
    CollectionReference receipts =
        FirebaseFirestore.instance.collection('receipts');

    final lstReceipts = receipts.get().then(
      (querySnapshot) {
        List<Receipt>? lstReceipt = [];
        querySnapshot.docs.forEach(
          (element) {
            final receiptData = element.data() as Map<String, dynamic>;
            print(receiptData);
            final receipt = Receipt.fromMap(receiptData);
            if ((receipt.accountCode ?? '').startsWith(account)) {
              lstReceipt.add(receipt);
            }
          },
        );
        return lstReceipt;
      },
    );
    return lstReceipts;
  }
}
