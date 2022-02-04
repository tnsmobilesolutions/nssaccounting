import 'package:nssaccounting/data/accountsAPI.dart';
import 'package:nssaccounting/model/account.dart';

class UserSession {
  static final UserSession _singleton = UserSession._internal();

  factory UserSession() {
    return _singleton;
  }

  UserSession._internal();

  // Load all branches

  // Load all acconts
  Future<List<Account?>> get allPaymentAccounts async {
    final allAccts = await AccountsAPI().getAllAccounts();
    return allAccts
        .where((element) => element?.accountType == "Payment")
        .toList();
  }
}
