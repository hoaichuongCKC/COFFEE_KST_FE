extension StringX on String {
  String capitalize() {
    if (length > 0) {
      return '${this[0].toUpperCase()}${substring(1)}';
    }
    return this;
  }

  String convertToCountryVNPhoneCode() {
    return replaceFirst('0', '+84 ');
  }

  bool isUpperCase() {
    final regExp = RegExp('[A-Z]');
    return regExp.hasMatch(this);
  }

  bool isSpecialCharacters() {
    return contains(RegExp(r'[\-=@,\.;],[A-Z,a-z]'));
  }

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  String convertDistanceNumberPhone() {
    var phone = replaceRange(3, 3, ' ');
    phone = phone.replaceRange(7, 7, ' ');
    phone = phone.replaceRange(10, 10, ' ');
    return phone;
  }
}
