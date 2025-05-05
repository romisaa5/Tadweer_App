import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:toda_app/core/themes/colors.dart';

void showAwesomeDialog(String desc, String title, BuildContext context,
    {DialogType? dialogType, void Function()? btnOkOnPress}) {
  AwesomeDialog(
    context: context,
    dialogType: dialogType ?? DialogType.error,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    btnOkText: 'OK',
    btnOkColor: ColorsManger.kPrimaryColor,
    showCloseIcon: false,
    btnOkOnPress: btnOkOnPress ?? () {},
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
