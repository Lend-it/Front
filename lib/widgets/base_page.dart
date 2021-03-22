import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/theme/colors.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final Widget header;

  BasePage({
    @required this.body,
    @required this.header,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.17,
                  width: size.width,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                    top: statusBarHeight,
                    bottom: 0,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: header,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(-10),
                  ),
                ),
                Positioned(
                  top: statusBarHeight,
                  right: -26,
                  child: SvgPicture.asset(
                    'assets/logo_water_mark.svg',
                    width: 115,
                  ),
                ),
                Positioned(
                  bottom: -2,
                  child: Container(
                    width: size.width,
                    height: 20,
                    decoration: BoxDecoration(
                      color: lightColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
