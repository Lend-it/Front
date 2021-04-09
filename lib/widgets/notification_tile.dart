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
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.caption,
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          size: 32,
        ),
        onTap: onTapHandler,
      ),
      height: 104,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1),
          )
        ],
      ),
    );
  }
}
