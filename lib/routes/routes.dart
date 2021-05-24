import 'package:flutter/widgets.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/view/auth/new_password.dart';
import 'package:front/view/auth/recover_password.dart';
import 'package:front/view/auth/register_page.dart';
import 'package:front/view/geolocation/geolocation_page.dart';
import 'package:front/view/geolocation/map_page.dart';
import 'package:front/view/home/home_page.dart';
import 'package:front/view/lend/create_lend.dart';
import 'package:front/view/profile/profile_page.dart';
import 'package:front/view/lend/show_lend.dart';
import 'package:front/view/rating/rating_page.dart';

import 'app_routes.dart';
import 'package:front/view/auth/login_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.HOME_PAGE: (ctx) => HomePage(),
    AppRoutes.PROFILE_PAGE: (ctx) => ProfilePage(),
    AppRoutes.SHOW_LEND: (ctx) => ShowLend(),
    AppRoutes.LOGIN_PAGE: (ctx) => LoginPage(),
    AppRoutes.REGISTER_PAGE: (ctx) => RegisterPage(),
    AppRoutes.GEOLOCATION_PAGE: (ctx) => GeolocationPage(),
    AppRoutes.MAP_PAGE: (ctx) => MapPage(),
    AppRoutes.CREATE_LEND: (ctx) => CreateLend(),
    AppRoutes.RECOVER_PASSWORD: (ctx) => RecoverPassword(),
    AppRoutes.NEW_PASSWORD: (ctx) => NewPassword(),
    AppRoutes.RATING_PAGE: (ctx) => RatingPage(),
  };
}
