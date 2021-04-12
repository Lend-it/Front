import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/routes/routes.dart';
import 'package:front/theme/theme.dart';
import 'package:front/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

import 'model/session.model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SessionModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Lend.it',
        debugShowCheckedModeBanner: false,
        theme: projectTheme,
        initialRoute: AppRoutes.LOGIN_PAGE,
        home: BottomNavigation(),
        onGenerateRoute: (settings) {
          return CupertinoPageRoute(
            builder: (context) => Routes.routes[settings.name](context),
            settings: settings,
          );
        },
      ),
    );
  }
}
