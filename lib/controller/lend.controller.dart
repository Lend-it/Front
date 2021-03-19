import 'package:front/model/lend.model.dart';
import 'package:http/http.dart';
import 'package:front/services/api.dart';

class LendController {
  Api api = new Api();

  Future<Response> createNewLend(LendModel lend) async {
    final postLend = {
      "productname": lend.title,
      "startdate": lend.startDate,
      "enddate": lend.endDate,
      "description": lend.description,
      "requester": lend.user.email,
      "productcategoryid": int.parse(lend.category.id),
    };

    Response response = await api.post(
      route: "/api/requests",
      body: postLend,
    );

    return response;
  }
}
