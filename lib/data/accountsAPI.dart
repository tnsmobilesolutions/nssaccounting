import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/model/account.dart';

class AccountsAPI {
  Future<List<Account?>> getAllAccounts() {
    CollectionReference accounts =
        FirebaseFirestore.instance.collection('accounts');

    final lstAccounts = accounts.get().then((querySnapshot) {
      List<Account?> lstAccts = [];
      querySnapshot.docs.forEach((element) {
        final accountData = element.data() as Map<String, dynamic>;
        final account = Account.fromMap(accountData);
        lstAccts.add(account);
      });
      return lstAccts;
    });
    return lstAccounts;
  }

  Future<bool> isAccountExists(String accountName) {
    CollectionReference branches =
        FirebaseFirestore.instance.collection('accounts');

    final result = branches.get().then(
      (querySnapshot) {
        bool isPresent = false;
        querySnapshot.docs.forEach(
          (element) {
            final branchData = element.data() as Map<String, dynamic>;
            final branch = Account.fromMap(branchData);
            if ((branch.accountName?.toLowerCase() ?? '') ==
                (accountName.toLowerCase())) {
              isPresent = true;
            }
          },
        );
        return isPresent;
      },
    );
    return result;
  }

  Future<void> createNewAccount(Account account) async {
    CollectionReference accountsCol =
        FirebaseFirestore.instance.collection('accounts');
    final reference =
        await accountsCol.doc(account.accountId).set(account.toMap());
  }

  Future<void> updateAccount(Account account) async {
    // Implement Update account logic here
    var collection = FirebaseFirestore.instance.collection('accounts');
    collection
        .doc(account.accountId) // <-- Doc ID where data should be updated.
        .update(account.toMap());
  }
}
