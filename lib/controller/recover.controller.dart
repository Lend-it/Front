import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:http/http.dart';
import 'package:front/services/api.dart';

class RecoverController {
  Api api = new Api();

  void sendMail(
    String email,
    BuildContext context,
  ) async {
    Response response = await api.post(
      route: "/password/forgot",
      body: {
        "useremail": email,
      },
    );
    if (response.body.contains('error')) {
      var errorMessage = jsonDecode(response.body)['error'];
      NotificationPopup.notificate(
        title: errorMessage,
        status: 'fail',
        context: context,
      );
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.NEW_PASSWORD,
        (_) => false,
      );
    }
  }
}
