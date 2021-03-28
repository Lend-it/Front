import 'dart:convert';

import 'package:front/model/category.model.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/user.model.dart';
import 'package:http/http.dart';
import 'package:front/services/api.dart';

class LendController {
  Api api = new Api();

  Future<Response> createNewLend(LendModel lend) async {
    Response response = await api.post(
      route: "/requests",
      body: lend.toJson(),
    );
    return response;
  }

  Future<Response> deleteLend(String id) async {
    Response response = await api.delete(
      route: "/requests/$id",
    );
    return response;
  }

  Future<List<LendModel>> getLends() async {
    Response response = await api.get(
      route: "/requests",
    );

    List<dynamic> requests = jsonDecode(response.body)['data']['requests'];

    List<LendModel> lends = requests.map((lend) {
      LendModel x = LendModel.fromJson(lend);
      return x;
    }).toList();

    return lends;
  }
}
