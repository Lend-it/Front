import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/model/session.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/dates.dart';
import 'package:provider/provider.dart';

class LendCard extends StatelessWidget {
  final Function onPressed;
  final LendModel lend;

  LendCard({
    @required this.lend,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final SessionModel session =
        Provider.of<SessionModel>(context, listen: false);
    // final bool isFromUser = session.user.id == lend.requester.id;
    final bool isFromUser = true;
    final bool isRequestOpen = lend.lender == null;
    String status = lend.finalized
        ? 'Fechado'
        : isRequestOpen
            ? 'Aberto'
            : 'Em Andamento';

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              lendCardHeader(context, isFromUser, status),
              lendCardBody(context),
              Divider(thickness: 1.2),
              SizedBox(height: 6),
              lendCardFooter(context)
            ],
          ),
        ),
      ),
    );
  }

  Row lendCardFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(lend.requester.photo),
            ),
            SizedBox(width: 4),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    lend.requester.name,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: secondaryLightColor,
                      size: 18,
                    ),
                    Text(
                      lend.requester.rating,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: grayColor,
                          ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              color: grayColor,
              size: 18,
            ),
            SizedBox(width: 4),
            Text(
              '${Dates.formatDateDDMM(lend.startDate)} até ${Dates.formatDateDDMM(lend.endDate)}',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        )
      ],
    );
  }

  Padding lendCardBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '${lend.description.substring(0, 84)}${lend.description.length > 84 ? '...' : ''}',
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }

  Column lendCardHeader(BuildContext context, bool isFromUser, String status) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              lend.title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Container(
              height: 16,
              width: 1,
              color: Colors.black12,
              margin: EdgeInsets.symmetric(horizontal: 8),
            ),
            Chip(
              label: Text(
                lend.category.title,
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: lightColor,
                    ),
              ),
              backgroundColor: secondaryLightColor,
              visualDensity: VisualDensity(vertical: -3),
            )
          ],
        ),
        if (isFromUser)
          Text(
            'Status: $status',
            style: Theme.of(context).textTheme.caption,
          )
      ],
    );
  }
}
