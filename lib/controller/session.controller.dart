import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:http/http.dart';
import 'package:front/services/api.dart';

class SessionController {
  Api api = new Api();

  void saveToken() {}

  void cleanToken() {}

  void createSession(
      String email, String password, BuildContext context) async {
    Response response = await api.post(
      route: "/session",
      body: {
        "useremail": email,
        "password": password,
      },
    );
    if (response.body.contains('error')) {
      var errorMessage = jsonDecode(response.body)['error'];
      print(errorMessage);
      NotificationPopup.notificate(
        title: errorMessage,
        context: context,
        status: 'fail',
      );
    } else {
      Navigator.pushNamed(context, AppRoutes.HOME_PAGE);
    }
  }
}
