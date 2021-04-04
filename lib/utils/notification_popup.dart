import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/theme/colors.dart';
import '../theme/custom_icons.dart';

class NotificationPopup {
  static void notificate({
    @required String title,
    @required BuildContext context,
    @required String status,
  }) {
    Size size = MediaQuery.of(context).size;

    Flushbar(
      shouldIconPulse: false,
      padding: EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 20,
      ),
      maxWidth: size.width * .9,
      messageText: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: lightColor,
        ),
      ),
      icon: Icon(
        status == 'success' ? CustomIcons.like : CustomIcons.dislike,
        size: 28.0,
        color: lightColor,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: status == 'success' ? primaryColor : dangerColor,
      margin: EdgeInsets.all(8),
      borderRadius: 8,
    )..show(context);
  }
}
