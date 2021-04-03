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
      route: '/requests',
      body: lend.toJson(),
    );
    return response;
  }

  Future<Response> editLend(LendModel lend) async {
    Response response = await api.put(
      route: '/requests/${lend.id}',
      body: lend.toJson(),
    );
    return response;
  }

  Future<Response> deleteLend(String id) async {
    Response response = await api.delete(
      route: '/requests/$id',
    );
    return response;
  }

  Future<List<LendModel>> getLends() async {
    print("aloaloalo");
    Response response = await api.get(
      route: 'requests/request',
    );

    List<dynamic> requests = jsonDecode(response.body)['data']['requests'];
    print("lalalla");
    List<LendModel> lends = requests.map((lendData) {
      LendModel lend = LendModel.fromJson(lendData);
      return lend;
    }).toList();
    print("oioioi");
    return lends;
  }

  Future<List<LendModel>> getFilteredLends({String categoryId}) async {
    print("aloaloalo");
    Response response = await api.get(
      route: 'requests/request/$categoryId',
    );

    List<dynamic> requests = jsonDecode(response.body)['data']['requests'];
    print("lalalla");
    List<LendModel> lends = requests.map((lendData) {
      LendModel lend = LendModel.fromJson(lendData);
      return lend;
    }).toList();
    print("oioioi");
    return lends;
  }
}
