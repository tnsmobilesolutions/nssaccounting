import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:nssaccounting/model/user.dart';

class Login {
  // FirebaseApp? _nssAcctApp;
  FirebaseAuth? _auth;
  static AppUser? _loggedInUser;

  Login() {
    // _nssAcctApp = Firebase.app('nssacounting');
    // _auth = FirebaseAuth.instanceFor(app: _nssAcctApp!);
    _auth = FirebaseAuth.instance;
  }

  static AppUser? get loggedInUser {
    return _loggedInUser;
  }

  Future<AppUser?> signInWithEmailAndPassword(LoginData data) async {
    try {
      UserCredential userCredential = await _auth!.signInWithEmailAndPassword(
          email: data.name, password: data.password);

      // final firestoreInstance = FirebaseFirestore.instance;
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final user = users
          .where("uid", isEqualTo: userCredential.user?.uid)
          .get()
          .then((querySnapshot) {
        final userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        final user = AppUser.fromMap(userData);
        _loggedInUser = user;
        return user;
      });
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void signOut() async {
    await _auth!.signOut();
  }
}
