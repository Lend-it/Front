import 'package:flutter/widgets.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/view/home/home_page.dart';
import 'package:front/view/profile/profile_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.HOME_PAGE: (tcx) => HomePage(),
    AppRoutes.PROFILE_PAGE: (tcx) => ProfilePage(),
  };
}
