import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:nssaccounting/dashboard.dart';
import 'package:nssaccounting/data/auth.dart';
import 'package:nssaccounting/model/user.dart';
// import 'dashboard_screen.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

const RELEASE_MODE = true;

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 1);
  AppUser? _loggedInUser;

  Future<String?> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    try {
      if (RELEASE_MODE) {
        Login _login = Login();
        _loggedInUser = await _login.signInWithEmailAndPassword(data);
        print("Name: ${_loggedInUser?.name}");
        if (_loggedInUser != null) {
          return null;
        } else {
          return "Wrong credential";
        }
      } else {
        return Future.delayed(loginTime).then((_) {
          if (!users.containsKey(data.name)) {
            return 'User not exists';
          }
          if (users[data.name] != data.password) {
            return 'Password does not match';
          }
          return null;
        });
      }
    } catch (e) {
      print(e.toString());
      return "Exception occured. Please contact administrator.";
    }
  }

  Future<String?> _signUp(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return 'Please contact administrator.';
    });
  }

  Future<String?> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'NSS Accounting',
      logo: 'assets/images/nsslogo.png',
      onLogin: _authUser,
      onSignup: _signUp,
      hideSignUpButton: true,
      hideForgotPasswordButton: true,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => DashboardScreen(
            loggedInUser: _loggedInUser,
          ),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
