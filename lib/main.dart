import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/routes/routes.dart';
import 'package:front/theme/theme.dart';
import 'package:front/widgets/bottom_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: projectTheme,
      initialRoute: AppRoutes.HOME_PAGE,
      home: BottomNavigation(),
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) => Routes.routes[settings.name](context),
          settings: settings,
        );
      },
    );
  }
}
