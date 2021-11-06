import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/model/account.dart';

class Accounts {
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
}
