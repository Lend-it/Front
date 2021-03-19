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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: statusBarHeight,
              right: -26,
              child: SvgPicture.asset(
                'assets/logo_water_mark.svg',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 64, bottom: 25),
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                      width: 150,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: lightColor,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: lightColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 30),
                  body,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
