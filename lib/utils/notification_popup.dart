import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/theme/colors.dart';

class NotificationPopup {
  void successNotification({
    String title,
    BuildContext context,
  }) {
    print('@@@@@@');

    Flushbar(
      shouldIconPulse: false,
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 20,
      ),
      maxWidth: 350,
      messageText: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: lightColor,
        ),
      ),
      icon: Icon(
        Icons.thumb_up,
        size: 28.0,
        color: lightColor,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: primaryColor,
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }

  void failNotification({
    String title,
    BuildContext context,
  }) {
    Flushbar(
      shouldIconPulse: false,
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 20,
      ),
      maxWidth: 350,
      messageText: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: lightColor,
        ),
      ),
      icon: Icon(
        Icons.thumb_down,
        size: 28.0,
        color: lightColor,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: dangerColor,
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }
}
