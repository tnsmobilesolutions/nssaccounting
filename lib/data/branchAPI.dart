import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/model/branch.dart';

class BranchAPI {
  Future<List<Branch?>> getAllBranches() {
    CollectionReference branches =
        FirebaseFirestore.instance.collection('branches');

    final lstBranches = branches.get().then((querySnapshot) {
      List<Branch?> lstBranch = [];
      querySnapshot.docs.forEach((element) {
        final branchData = element.data() as Map<String, dynamic>;
        final branch = Branch.fromMap(branchData);
        lstBranch.add(branch);
      });
      return lstBranch;
    });
    return lstBranches;
  }

  Future<String> createNewBranch(Branch branch) async {
    CollectionReference branchsCol =
        FirebaseFirestore.instance.collection('branches');
    final reference = await branchsCol.add({
      "branchId": branch.branchId,
      "branchName": branch.branchName,
      "address": branch.address,
      "city": branch.city,
      "state": branch.state,
      "country": branch.country,
      "pin": branch.pin,
      "devotees": branch.devotees,
      "year": branch.year,

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
}
