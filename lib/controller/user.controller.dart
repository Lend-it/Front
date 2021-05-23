import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:front/model/user.model.dart';
import 'package:front/services/api.dart';
import 'package:front/model/lend.model.dart';

class UserController {
  Api api = new Api();

  void createNewUser(UserModel user, BuildContext context) async {
    Response response =
        await api.post(route: "/users/user", body: user.toJson());
    if (response.body.contains('error')) {
      var errorMessage = jsonDecode(response.body)['error'];
      NotificationPopup.notificate(
        title: errorMessage,
        context: context,
        status: 'fail',
      );
    }

    Navigator.of(context).pop();
    NotificationPopup.notificate(
      title: 'Conta criada com sucesso',
      context: context,
      status: 'success',
    );
  }

  Future<void> updateUser({
    String name,
    String useremail,
    String whatsappnumber,
    BuildContext context,
  }) async {
    final user = {
      'name': name,
      'useremail': useremail,
      'whatsappnumber': whatsappnumber,
    };

    Response response = await api.put(route: "/users/user", body: user);
    if (response.body.contains('error')) {
      NotificationPopup.notificate(
        title: 'Não foi possível alterar seu perfil',
        context: context,
        status: 'fail',
      );
    } else {
      NotificationPopup.notificate(
        title: 'Perfil alterado com sucesso',
        context: context,
        status: 'success',
      );
    }
  }

  Future<void> updateUserLocation({
    LatLng position,
    String useremail,
    BuildContext context,
  }) async {
    final userPosition = {
      'latitude': position.latitude,
      'longitude': position.longitude,
      'useremail': useremail,
    };

    Response response = await api.patch(
      route: "/users/user/location",
      body: userPosition,
    );

    if (response.body.contains('error')) {
      NotificationPopup.notificate(
        title: 'Não foi possível alterar sua localização',
        context: context,
        status: 'fail',
      );
    } else {
      NotificationPopup.notificate(
        title: 'Localização alterada com sucesso',
        context: context,
        status: 'success',
      );
    }
  }

  Future<dynamic> getUserLends({@required String useremail}) async {
    Response response = await api.get(
      route: '/users/user/requests/$useremail',
    );

    dynamic requests = jsonDecode(response.body);
    dynamic userRequesterRates = requests['mergedUserWithRequester'];
    dynamic userLenderRates = requests['mergedUserWithLender'];

    List<LendModel> userRequests = List<LendModel>.from(
      userRequesterRates.map((lendData) {
        LendModel lend = LendModel.fromJson(lendData);
        return lend;
      }).toList(),
    );

    List<LendModel> userLends = List<LendModel>.from(
      userLenderRates.map((lendData) {
        LendModel lend = LendModel.fromJson(lendData);
        return lend;
      }).toList(),
    );

    return {
      "userRequests": userRequests,
      "userLends": userLends,
    };
  }
}
