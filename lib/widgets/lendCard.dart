import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/user.model.dart';
import 'package:front/theme/colors.dart';

Widget LendCardHeader({String title, String category}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 7.0),
    child: IntrinsicHeight(
      child: Row(
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          VerticalDivider(
            width: 20,
            color: grayColor,
            thickness: 1,
            endIndent: 17,
            indent: 17,
          ),
          Chip(
            label: Text(
              category,
              style: TextStyle(color: lightColor),
            ),
            backgroundColor: secondaryLightColor,
          ),
        ],
      ),
    ),
  );
}

Widget LendCardHandler(
    {Function onPressed, String leading, IconData trailing}) {
  return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(
          left: 23,
          right: 23,
          top: 12,
          bottom: 14,
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              leading,
              style: TextStyle(fontSize: 16, color: lightColor),
            ),
            Icon(
              trailing,
              color: lightColor,
            )
          ],
        ),
      ));
}

Widget LendCardUserInfo({
  String profilePic,
  String userName,
  String userRating,
  String startDate,
  String endDate,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 11, top: 4, right: 23, left: 23),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(profilePic),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(userName),
                  Row(
                    children: <Widget>[
                      Icon(Icons.star, color: secondaryLightColor),
                      Text(userRating)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Icon(Icons.calendar_today_outlined),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: Text('$startDate até $endDate')),
          ],
        ),
      ],
    ),
  );
}

Widget LendCardDescription({String description}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 23.0),
    child: Text(description,
        style: TextStyle(fontSize: 16),
        maxLines: 2,
        overflow: TextOverflow.ellipsis),
  );
}

class LendCard extends StatelessWidget {
  final Function onPressed;
  final LendModel lend;
  final String leading;
  final IconData trailing;

  LendCard({
    @required this.lend,
    @required this.onPressed,
    @required this.leading,
    @required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            LendCardHeader(title: lend.title, category: lend.category.title),
            LendCardDescription(description: lend.description),
            Divider(
              height: 30,
              thickness: 1,
            ),
            LendCardUserInfo(
              profilePic: lend.user.photo,
              userName: lend.user.name,
              userRating: lend.user.rating,
              startDate: lend.startDate,
              endDate: lend.endDate,
            ),
            LendCardHandler(
              onPressed: onPressed,
              trailing: trailing,
              leading: leading,
            ),
          ],
        ),
      ),
    );
  }
}
