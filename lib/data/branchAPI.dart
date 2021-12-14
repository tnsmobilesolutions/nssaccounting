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
}
