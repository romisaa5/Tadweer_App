import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

void showAwesomeDialog(String desc, String title, BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnOkText: 'OK',
    showCloseIcon: false,
    btnOkOnPress: () {
    },
  ).show();
}

String getFirebaseErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'weak-password':
      return 'The password you entered is too weak. Please choose a stronger password.';
    case 'email-already-in-use':
      return 'This email is already associated with another account.';
    case 'invalid-email':
      return 'Please enter a valid email address.';
    case 'operation-not-allowed':
      return 'This operation is not allowed. Please contact support.';
    default:
      return 'An unexpected error occurred. Please try again.';
  }
}
