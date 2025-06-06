class MyValidator {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$',
    ).hasMatch(password);
  }

  static bool isNamevalidator(String value) {
    return RegExp(r'^[a-zA-Z0-9._-]+( [a-zA-Z0-9._-]+)*$').hasMatch(value);
  }

  static bool isCategoryNameValid(String value) {
    return RegExp(r'^[a-zA-Z0-9][a-zA-Z0-9 _-]{2,}$').hasMatch(value);
  }
}
