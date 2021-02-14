import 'dart:convert';

import 'package:http/http.dart';
import 'package:front/model/user.model.dart';
import 'package:front/services/api.dart';

class UserController {
  Api api = new Api();

  void createNewUser(UserModel user) async {
    Response response = await api.post(route: "/new-user", body: user.toJson());
    if (response.statusCode != 200) {
      throw jsonDecode(response.body);
    }
  }
}
