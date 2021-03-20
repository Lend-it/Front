import 'package:front/model/lend.model.dart';
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
}
