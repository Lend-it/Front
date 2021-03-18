import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class BaseAuthPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String body;

  BaseAuthPage({
    @required this.title,
    @required this.subtitle,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: primaryColor,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
