import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Flushbar successFactory({
    String title = "Success",
    String msg = "",
  }) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      titleText: Text(title, style: TextStyle(color: Colors.white)),
      messageText: Text(msg, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 5),
    );
  }

  static Flushbar errorFactory({
    String title = "Error",
    String msg = "Something went wrong",
  }) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      titleText: Text(title, style: TextStyle(color: Colors.white)),
      messageText: Text(msg, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
    );
  }
}
