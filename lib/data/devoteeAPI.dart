import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/model/devotee.dart';

class DevoteeAPI {
  Future<List<Devotee?>> getAllDevotees() {
    CollectionReference devotees =
        FirebaseFirestore.instance.collection('devotees');

    final lstDevotees = devotees.get().then((querySnapshot) {
      List<Devotee?> lstDevotee = [];
      querySnapshot.docs.forEach((element) {
        final devoteeData = element.data() as Map<String, dynamic>;
        final devotee = Devotee.fromMap(devoteeData);
        lstDevotee.add(devotee);
      });
      return lstDevotee;
    });
    return lstDevotees;
  }

  Future<List<Devotee?>> getDevoteeByName(String devoteeName) {
    CollectionReference devotees =
        FirebaseFirestore.instance.collection('devotees');

    final lstDevotees = devotees.get().then((querySnapshot) {
      List<Devotee?> lstDevotee = [];
      querySnapshot.docs.forEach((element) {
        final devoteeData = element.data() as Map<String, dynamic>;
        final devotee = Devotee.fromMap(devoteeData);
        lstDevotee.add(devotee);
      });
      return lstDevotee;
    });
    return lstDevotees;
  }

  Future<String> createNewDevotee(Devotee devotee) async {
    CollectionReference devoteeCol =
        FirebaseFirestore.instance.collection('devotees');
    final reference = await devoteeCol.add({
      "branchId": devotee.branchId,
      "branchName": devotee.branchName,
      "name": devotee.devoteeName,
      "ppid": devotee.ppid,
      "joiningYear": devotee.joiningYear,
      "contact": devotee.contact,
      "email": devotee.email,

      // "accountCode": branch.accountCode,
      // "amount": branch.amount,
      // "devoteeId": branch.devoteeId,
      // "paaliaName": branch.paaliaName,
      // "notMember": branch.notMember,
      // "paymentMode": branch.paymentMode,
      // "paymentType": branch.paymentType,
      // "preparedBy": branch.preparedBy,
      // "receiptDate": receipt.receiptDate,
      // "receiptId": receipt.receiptId,
      // "receiptNo": branch.branchNo,
      // "remarks": branch.remarks,
      // "transactionRefNo": branch.transactionRefNo,
      // "paidBy": branch.paidBy
    });
    return reference.id;
  }

  Future<void> updateDevotee(Devotee devotee) async {
    // Implement Update Devotee logic here
    var collection = FirebaseFirestore.instance.collection('devotees');
    collection
        .doc(devotee.branchId) // <-- Doc ID where data should be updated.
        .update(devotee.toMap());
  }
}
