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
        if ((devotee.devoteeName ?? '').startsWith(devoteeName)) {
          lstDevotee.add(devotee);
        }
        //lstDevotee.add(devotee);
      });
      return lstDevotee;
    });
    return lstDevotees;
  }

  Future<void> createNewDevotee(Devotee devotee) async {
    CollectionReference devoteeCol =
        FirebaseFirestore.instance.collection('devotees');
    // final reference = await devoteeCol.add({
    //   "devoteeId": devotee.devoteeId,
    //   "branchName": devotee.branchName,
    //   "devoteeName": devotee.devoteeName,
    //   "ppid": devotee.ppid,
    //   "joiningYear": devotee.joiningYear,
    //   "contact": devotee.contact,
    //   "email": devotee.email,

    final reference =
        await devoteeCol.doc(devotee.devoteeId).set(devotee.toMap());

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
    // });
    // return reference.id;
  }

  Future<void> updateDevotee(Devotee devotee) async {
    // Implement Update Devotee logic here
    var collection = FirebaseFirestore.instance.collection('devotees');

    collection
        .doc(devotee.devoteeId) // <-- Doc ID where data should be updated.
        .update(devotee.toMap());
  }

  Future<void> deleteDevote(Devotee devotee) async {
    try {
      var collection = FirebaseFirestore.instance.collection("devotees");

      collection.doc(devotee.devoteeId).delete();
    } catch (e) {
      print(e);
    }
  }
}
