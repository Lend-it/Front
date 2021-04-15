import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:front/utils/notification_popup.dart';
import 'package:http/http.dart';
import 'package:front/model/rating.model.dart';
import 'package:front/services/api.dart';

class RatingController {
  Api api = new Api();

  void createNewRating(RatingModel rating, BuildContext context) async {
    print(rating);
    Response response = await api.post(
      route: "/rating/rating",
      body: rating.toJson(),
      header: {
        'reviewed': rating.reviewed,
        'reviewer': rating.reviewer,
        'requestid': rating.requestid,
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
    }
  }
}
