import 'package:flutter/material.dart';

import '../theme/colors.dart';

class NotificationTile extends StatelessWidget {
  @required
  String title;
  @required
  String subtitle;

  NotificationTile({
    this.title,
    this.subtitle,
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
      ),
      height: 104,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: lightColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
          boxShadow: [
            BoxShadow(
              color: grayColor,
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 1),
            )
          ]),
    );
  }
}
