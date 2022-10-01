import 'package:flutter/foundation.dart';
import 'package:utardia/util/string.dart';

String? validatePassword(val) {
  if (kDebugMode) {
    print(val);
  }
  if (val.length != 8) return Strings.enterMinimumPassword;
  return (val!.isEmpty) ? Strings.pleaseEnterPassword : null;
}

String? validateAddress(val) {
  if (kDebugMode) {
    print(val);
  }
  return (val!.isEmpty) ? Strings.pleaseEnterAddress : null;
}

String? validateName(val) {
  if (kDebugMode) {
    print(val);
  }
  return (val!.isEmpty) ? Strings.pleaseEnterName : null;
}

String? validateLandMark(val) {
  if (kDebugMode) {
    print(val);
  }
  return (val!.isEmpty) ? Strings.pleaseEnterName : null;
}

String? validatePinCode(val) {
  if (kDebugMode) {
    print(val);
  }
  if (val!.length != 6) return Strings.enterpincode;
  return (val.isEmpty) ? Strings.enterpincode : null;
}

// String? validateRePassword(val) {
//   if (kDebugMode) {
//     print(val);
//   }
//   if (val!.isEmpty) {
//     return 'Please re-enter your new password';
//   }
//   if (val != provider.txtRePassword.text) {
//     return 'Password must be same..';
//   }
//   return null;
// }

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  String patternPhone = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = RegExp(pattern);
  RegExp regphone = RegExp(patternPhone);
  if (value == null || value.isEmpty) {
    return "Please enter email or phone number !!";
  } else {
    if (num.tryParse(value) != null) {
      //phone
      if (regphone.hasMatch(value)) {
        return null;
      } else {
        return "Enter valid phone number";
      }
    } else {
      if (regex.hasMatch(value)) {
        return null;
      } else {
        return "Enter valid email";
      }
      //email
    }
  }
}

String? phoneNumberValidator(String value) {
  String pattern = '(^[0-9]{10}\$)';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Please enter valid mobile number';
  } else {
    return null;
  }
}

String? validateEmail1(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]'
      r'{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  String patternPhone = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regphone = RegExp(patternPhone);
  RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return "Please enter email or phone number !!";
  } else {
    if (num.tryParse(value) != null) {
      //phone
      if (regphone.hasMatch(value)) {
        return null;
      } else {
        return "Enter valid phone number";
      }
    } else {
      if (regex.hasMatch(value)) {
        return null;
      } else {
        return "Enter valid email";
      }
      //email
    }
  }
  // if(!regex.hasMatch(value)) {
  //   return 'Enter email';
  // } else {
  //   return null;
  // }
}

void main() {
  if (kDebugMode) {
    print(validateEmail("aslam@gmail.com"));
    //print(validateEmail1("aslam@yahoo.com"));
  }
}
