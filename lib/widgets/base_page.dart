import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/theme/colors.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final Widget header;

  BasePage({
    @required this.body,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryColor,
      body: Stack(
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
              Container(
                height: size.height * 0.08,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.only(top: 64, bottom: 25),
                child: header != null
                    ? header
                    : SvgPicture.asset(
                        'assets/logo.svg',
                        width: 150,
                      ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.8,
                decoration: BoxDecoration(
                  color: lightColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: body,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
