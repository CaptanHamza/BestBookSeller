import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

alertDialog(BuildContext context, String msg) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: ToastGravity.BOTTOM,
  );
}

validateEmail(String email) {
  final emailReg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  return emailReg.hasMatch(email);
}
