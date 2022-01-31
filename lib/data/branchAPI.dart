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

  Future<List<Branch?>> getBranchByName(String branchName) {
    CollectionReference branches =
        FirebaseFirestore.instance.collection('branches');

    final lstBranches = branches.get().then((querySnapshot) {
      List<Branch?> lstBranch = [];
      querySnapshot.docs.forEach((element) {
        final branchData = element.data() as Map<String, dynamic>;
        final branch = Branch.fromMap(branchData);
        if ((branch.branchName ?? '').startsWith(branchName)) {
          lstBranch.add(branch);
        }
      });
      return lstBranch;
    });
    return lstBranches;

    // Future queryData(String queryString) async {
    //   return FirebaseFirestore.instance
    //       .collection('branches')
    //       .where('branchName', isGreaterThanOrEqualTo: queryString)
    //       .get();
    // }
  }

  Future<void> createNewBranch(Branch branch) async {
    CollectionReference branchsCol =
        FirebaseFirestore.instance.collection('branches');
    final reference = await branchsCol.doc(branch.branchId).set(branch.toMap());
  }

  Future<void> updateBranch(Branch branch) async {
    // Implement Update branch logic here
    var collection = FirebaseFirestore.instance.collection('branches');
    collection
        .doc(branch.branchId) // <-- Doc ID where data should be updated.
        .update(branch.toMap());
  }
}
