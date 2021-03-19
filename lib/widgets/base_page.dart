import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/theme/colors.dart';

class BasePage extends StatelessWidget {
  final Widget body;

  BasePage({
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;

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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 64, bottom: 25),
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                      width: 150,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    color: lightColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
