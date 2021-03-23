import 'package:flutter/widgets.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/view/home/home_page.dart';
import 'package:front/view/profile/profile_page.dart';
import 'package:front/view/lend/show_lend.dart';

import 'app_routes.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.HOME_PAGE: (ctx) => HomePage(),
    AppRoutes.PROFILE_PAGE: (ctx) => ProfilePage(),
    AppRoutes.SHOW_LEND: (ctx) => ShowLend(),
  };
}
