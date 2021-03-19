import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/theme/colors.dart';

class BaseAuthPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;

  BaseAuthPage({
    @required this.title,
    @required this.subtitle,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 64, bottom: 25),
              child: SvgPicture.asset(
                'assets/logo.svg',
                width: 150,
              ),
            ),
            Container(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: lightColor,
                  fontSize: 36,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: lightColor,
                  fontSize: 24,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            body,
          ],
        ),
      ),
    );
  }
}
