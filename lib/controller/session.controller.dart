import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:http/http.dart';
import 'package:front/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionController {
  Api api = new Api();

  void saveToken(String token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString('token', token);
  }

  void cleanToken(BuildContext context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  void createSession(
    String email,
    String password,
    BuildContext context,
  ) async {
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
      saveToken(jsonDecode(response.body));
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRoutes.HOME_PAGE,
        (route) => false,
      );
    }
  }
}
