import 'dart:convert';

import 'package:front/model/lend.model.dart';
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

  Future<Response> updateLender(String lenderId, String requestId) async {
    Response response = await api.patch(
      route: '/requests/request/$requestId',
      body: {
        "lender": lenderId,
      },
    );
    return response;
  }

  Future<Response> finalizeLend(String requestId) async {
    Response response = await api.patch(
      route: '/requests/request/$requestId/finalize',
      body: {},
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

  Future<List<LendModel>> getLends({
    String categoryId,
    String useremail,
    bool isRequester,
    bool isLender,
  }) async {
    String route = '/requests/request';
    if (categoryId != null) route = route + '/$categoryId';

    if (useremail != null && isRequester == true)
      route = route + '?requester=$useremail';

    if (useremail != null && isLender == true) {
      route = route + '?lender=$useremail';
    }

    Response response = await api.get(route: route);

    List<dynamic> requests = jsonDecode(response.body);
    List<LendModel> lends = requests.map((lendData) {
      LendModel lend = LendModel.fromJson(lendData);
      return lend;
    }).toList();

    return lends;
  }
}
