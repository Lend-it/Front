import 'package:flutter/widgets.dart';
import 'package:front/model/user.model.dart';

class SessionModel extends ChangeNotifier {
  UserModel user;

  void updateSessionUser(UserModel user) {
    this.user = user;

    notifyListeners();
  }
}
