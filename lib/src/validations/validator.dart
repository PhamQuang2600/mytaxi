class Validation {
  static bool isValidName(String name) {
    return name == null || name.length < 2;
  }

  static bool isValidPhone(String phone) {
    return phone == null ||
        !phone.contains(RegExp(r'[0-9]')) ||
        phone.length != 10 ||
        phone[0] != '0';
  }

  static bool isValidUser(String user) {
    return user == null || user.length < 6 || !user.contains("@");
  }

  static bool isValidPass(String pass) {
    return pass == null || pass.length < 6;
  }
}
