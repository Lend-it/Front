import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:front/widgets/base_page.dart';

class GeolocationPage extends StatefulWidget {
  @override
  _GeolocationPageState createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BasePage(
        body: Container(),
      ),
    );
  }
}
