import 'resources/managers/strings_manager.dart';

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return StringsManager.VALIDPASSORD;
  }
  RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\-\\/|=])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\-\\/|=]{8,}$');
  if (!passwordRegExp.hasMatch(value)) {
    return StringsManager.VALIDPASSORDREG;
  }
  return null;
}

String? confirmPasswordValidator(String? value, String password) {
  if (value == null || value.isEmpty) {
    return StringsManager.VALIDPASSORDCON;
  }
  if (value != password) {
    return StringsManager.VALIDPASSORDCONmatch;
  }
  return null;
}

String? stringValidator(String? value) {
  if (value == null || value.isEmpty) {
    return StringsManager.VALIDTEXT;
  }
  return null;
}

String? dateValidator(value) {
  if (value == null || value.isEmpty) {
    return StringsManager.VALIDDATE;
  }
  return null;
}

String? phoneValidator(phone) {
  if (phone == null || phone.number.isEmpty) {
    return StringsManager.VALIDPHONE;
  }

  if (!RegExp(r'^\d{10}$').hasMatch(phone.number)) {
    return StringsManager.VALIDPHONEREG;
  }
  return null;
}









// import 'resources/managers/strings_manager.dart';

// enum ValidationType { password, confirmPassword, string, date, phone }

// String? validate(ValidationType type, {String? value, String? confirmValue, dynamic phone}) {
//   switch (type) {
//     case ValidationType.password:
//       if (value?.isEmpty ?? true) return StringsManager.VALIDPASSORD;
//       if (!RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\-\\/|=])[A-Za-z\d!@#$%^&*()_+{}\[\]:;<>,.?~\-\\/|=]{8,}$').hasMatch(value!)) {
//         return StringsManager.VALIDPASSORDREG;
//       }
//       break;

//     case ValidationType.confirmPassword:
//       if (value?.isEmpty ?? true) return StringsManager.VALIDPASSORDCON;
//       if (value != confirmValue) return StringsManager.VALIDPASSORDCONmatch;
//       break;

//     case ValidationType.string:
//       return value?.isEmpty ?? true ? StringsManager.VALIDTEXT : null;

//     case ValidationType.date:
//       return value?.isEmpty ?? true ? StringsManager.VALIDDATE : null;

//     case ValidationType.phone:
//       if (phone?.number.isEmpty ?? true) return StringsManager.VALIDPHONE;
//       if (!RegExp(r'^\d{10}$').hasMatch(phone.number)) return StringsManager.VALIDPHONEREG;
//       break;
//   }
//   return null;
// }
