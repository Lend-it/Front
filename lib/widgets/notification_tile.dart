import 'package:flutter/material.dart';

import '../theme/colors.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTapHandler;

  NotificationTile({
    @required this.title,
    @required this.subtitle,
    @required this.onTapHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: primaryColor,
          size: 32,
        ),
        onTap: onTapHandler,
      ),
      height: 104,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: grayColor,
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 1),
          )
        ],
      ),
    );
  }
}
