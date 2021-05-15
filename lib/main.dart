import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/routes/app_routes.dart';
import 'package:front/routes/routes.dart';
import 'package:front/theme/theme.dart';
import 'package:front/widgets/bottom_navigation.dart';
import 'package:provider/provider.dart';

import 'model/session.model.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print(message);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _fcm.subscribeToTopic('all');
    _fcm.getToken().then((value) => print(value));

    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      // Called on foreground
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage $message');
      },

      // Called when the app is closed and the user clicked on the notification
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch $message');
      },

      // Called when the app in the background and the user clicked on the notification
      onResume: (Map<String, dynamic> message) async {
        print('onResume $message');
      },
      // onBackgroundMessage: myBackgroundMessageHandler,
    );
  }

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
