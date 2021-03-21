import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:http/http.dart';
import 'package:front/model/user.model.dart';
import 'package:front/services/api.dart';

class UserController {
  Api api = new Api();

  void createNewUser(UserModel user, BuildContext context) async {
    Response response = await api.post(route: "/users", body: user.toJson());
    if (response.body.contains('error')) {
      var errorMessage = jsonDecode(response.body)['error'];
      print(errorMessage);
      new NotificationPopup().notificate(
        title: errorMessage,
        context: context,
        status: 'fail',
      );
    }
  }
}
