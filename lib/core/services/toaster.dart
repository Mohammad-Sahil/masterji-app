import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/logger.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';

class ToasterS {
  final NavigatorService _navigatorService = locator<NavigatorService>();
  var log = getLogger("NotificationService");

  showSuccess(
      {String title = "Success",
      message = "Successfully",
      int duration = 2}) async {
    BuildContext context = await _navigatorService.getNavigatorKey();

    if (context != null) {
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        messageText: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        duration: Duration(seconds: duration),
      )..show(context);
    } else {
      log.e("Context is NULL");
    }
  }

  Future showError(
      {String title = "Error",
      message = "Something went wrong!",
      int duration = 2}) async {
    var context = _navigatorService.getNavigatorKey();

    if (context != null) {
      Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        titleText: Text(title, style: TextStyle(color: Colors.white)),
        messageText: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
        duration: Duration(seconds: duration),
      )..show(context);
    } else {
      log.e("Context is NULL");
    }
  }
}
