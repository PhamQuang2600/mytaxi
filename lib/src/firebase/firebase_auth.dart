import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  FirebaseAuth _firebase = FirebaseAuth.instance;

  void signUp(String email, String name, String pass, String phone,
      Function onSignUpSuccess, Function(String) onSignUpError) {
    _firebase
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      _createUser(user.user!.uid, name, phone, onSignUpSuccess, onSignUpError);
    }).catchError((error) {
      _onSignUpErr(error.code, onSignUpError);
    });
  }

  void logIn(String email, String pass, Function onLoginSuccess,
      Function(String) onLoginError) {
    _firebase
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      onLoginSuccess();
    }).catchError((err) {
      _onLoginErr(err.code, onLoginError);
    });
  }

  _createUser(String userId, String name, String phone,
      Function onSignUpSuccess, Function(String) onSignUpError) {
    var user = {"name": name, "phone": phone};
    var refer = FirebaseDatabase.instance.ref().child("users");
    refer
        .child(userId)
        .set(user)
        .then((value) => onSignUpSuccess())
        .catchError((err) {
      onSignUpError("Đăng kí thất bại! Vui lòng thử lại");
    });
  }

  void _onSignUpErr(String code, Function(String) onSignUpError) {
    switch (code) {
      case "email-already-in-use":
        onSignUpError("Tài khoản đâ được sử dụng!");
        break;
      case "invalid-email":
        onSignUpError("Tài khoản hợp lệ!");
        break;
      case "operation-not-allowed":
        onSignUpError("Tài khoản không được cho phép!");
        break;
      case "weak-password":
        onSignUpError("Mật khẩu không đủ mạnh!");
        break;
      default:
        onSignUpError("Đăng kí thất bại! Vui lòng thử lại");
        break;
    }
  }

  void _onLoginErr(String code, Function(String) onLoginError) {
    switch (code) {
      case "invalid-email":
        onLoginError("Email không hợp lệ!");
        break;
      case "user-disabled":
        onLoginError("Tài khoản bị khóa!");
        break;
      case "user-not-found":
        onLoginError("Tài khoản không tồn tại!");
        break;
      case "wrong-password":
        onLoginError("Sai mật khẩu");
        break;
      default:
        onLoginError("Đăng nhập lỗi! Vui lòng thử lại");
        break;
    }
  }
}
