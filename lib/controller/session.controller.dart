import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/model/session.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:http/http.dart';
import 'package:front/services/api.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionController {
  Api api = new Api();

  void saveToken(String token) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.setString('token', token);
  }

  void saveUser(UserModel user, BuildContext context) async {
    final session = Provider.of<SessionModel>(context, listen: false);

    session.updateSessionUser(user);
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
      final dynamic body = jsonDecode(response.body);
      saveToken(body['token']);
      saveUser(UserModel.fromJson(body['user']), context);
      Navigator.pushNamed(context, AppRoutes.HOME_PAGE);
    }
  }
}
