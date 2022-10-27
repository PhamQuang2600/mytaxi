import 'dart:async';

import 'package:mytaxi/src/firebase/firebase_auth.dart';
import 'package:mytaxi/src/validations/validator.dart';

class SignUpBloc {
  var _firAuth = new FireAuth();

  StreamController _user = new StreamController();
  StreamController _pass = new StreamController();
  StreamController _name = new StreamController();
  StreamController _phone = new StreamController();

  Stream get userStream => _user.stream;
  Stream get passStream => _pass.stream;
  Stream get nameStream => _name.stream;
  Stream get phoneStream => _phone.stream;

  bool isValid(String user, String pass, String name, String phone) {
    if (Validation.isValidName(name)) {
      _name.sink.addError("Tên không hợp lệ!");
      return false;
    }
    _name.sink.add("OK");
    if (Validation.isValidPhone(phone)) {
      _phone.sink.addError("Số điện thoại không hợp lệ!");
      return false;
    }
    _phone.sink.add("OK");
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

  void signUp(String user, String name, String pass, String phone,
      Function onSignUpSuccess, Function(String) onSignUpError) {
    _firAuth.signUp(user, name, pass, phone, onSignUpSuccess, onSignUpError);
  }

  void dispose() {
    _name.close();
    _phone.close();
    _pass.close();
    _user.close();
  }
}
