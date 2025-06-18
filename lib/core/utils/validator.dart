class Validator {
  static String? validatePassword(String value) {
    if (value.isEmpty) return 'password is required';
    if (value.length < 6) return 'Password must be at least 6 characters long';
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
