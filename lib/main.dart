import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/routes/routes.dart';
import 'package:front/theme/theme.dart';

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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          builder: (context) => Routes.routes[settings.name](context),
          settings: settings,
        );
      },
    );
  }
}
