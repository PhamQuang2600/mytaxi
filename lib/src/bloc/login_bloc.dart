import 'dart:async';

import 'package:mytaxi/src/firebase/firebase_auth.dart';
import 'package:mytaxi/src/validations/validator.dart';

class LoginBloc {
  var _firAuth = new FireAuth();
  StreamController _user = new StreamController();
  StreamController _pass = new StreamController();

  Stream get userStream => _user.stream;
  Stream get passStream => _pass.stream;

  bool isValid(String user, String pass) {
    if (Validation.isValidUser(user)) {
      _user.sink.addError("Tài khoản không hợp lệ!");
      return false;
    }
    _user.sink.add("OK");
    if (Validation.isValidPass(pass)) {
      _pass.sink.addError("Mật khẩu không hợp lệ!");
      return false;
    }
    _pass.sink.add("OK");
    return true;
  }

  void logIn(String user, String pass, Function onLoginSuccess,
      Function(String) onLoginError) {
    _firAuth.logIn(user, pass, onLoginSuccess, onLoginError);
  }

  void dispose() {
    _user.close();
    _pass.close();
  }
}
