import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class LeadCardHeader extends StatelessWidget {
  final String title;
  final String category;

  LeadCardHeader({
    @required this.title,
    @required this.category,
  });

  @override
  Widget build(BuildContext context) {
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
}

class LeadCardHandler extends StatelessWidget {
  final Function onPressed;

  LeadCardHandler({
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
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
                'Emprestar',
                style: TextStyle(fontSize: 16, color: lightColor),
              ),
              Icon(
                Icons.favorite_border,
                color: lightColor,
              )
            ],
          ),
        ));
  }
}

class LeadCardUserInfo extends StatelessWidget {
  final String profilePic;
  final String userName;
  final String userRating;
  final String startDate;
  final String endDate;

  LeadCardUserInfo({
    @required this.profilePic,
    @required this.userName,
    @required this.userRating,
    @required this.startDate,
    @required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
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
}

class LeadCardDescription extends StatelessWidget {
  final String description;

  LeadCardDescription({
    @required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.0),
      child: Text(description,
          style: TextStyle(fontSize: 16),
          maxLines: 2,
          overflow: TextOverflow.ellipsis),
    );
  }
}

class LendCard extends StatelessWidget {
  final String title;
  final String category;
  final String userName;
  final String description;
  final String userRating;
  final String profilePic;
  final String startDate;
  final String endDate;
  final Function onPressed;

  LendCard({
    @required this.title,
    @required this.category,
    @required this.userName,
    @required this.description,
    @required this.userRating,
    @required this.profilePic,
    @required this.startDate,
    @required this.endDate,
    @required this.onPressed,
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
            LeadCardHeader(title: title, category: category),
            LeadCardDescription(description: description),
            Divider(
              height: 30,
              thickness: 1,
            ),
            LeadCardUserInfo(
                profilePic: profilePic,
                userName: userName,
                userRating: userRating,
                startDate: startDate,
                endDate: endDate),
            LeadCardHandler(onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
