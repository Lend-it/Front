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
    final bool isFromUser = session.user.id == lend.requester.id;
    final bool isRequestOpen = lend.lender == null;
    final String status = lend.finalized
        ? 'Fechado'
        : isRequestOpen
            ? 'Aberto'
            : 'Em Andamento';

    return Opacity(
      opacity: lend.finalized ? .7 : 1,
      child: Column(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: onPressed,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    child: Column(
                      children: [
                        lendCardHeader(context, isFromUser, status),
                        lendCardBody(context),
                        Divider(thickness: 1.2),
                        SizedBox(height: 4),
                        lendCardFooter(context),
                      ],
                    ),
                  ),
                ),
                if (isFromUser && !lend.finalized)
                  lendCardCTAs(context, isRequestOpen),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container lendCardCTAs(BuildContext context, bool isRequestOpen) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getLendCardCTA(
            context,
            () {},
            isRequestOpen ? Icons.edit_outlined : Icons.check,
            isRequestOpen ? 'Editar' : 'Devolver',
            true,
          ),
          getLendCardCTA(
            context,
            () {},
            isRequestOpen ? Icons.delete_outline : Icons.repeat,
            isRequestOpen ? 'Excluir' : 'Reabrir',
            false,
          ),
        ],
      ),
    );
  }

  Widget getLendCardCTA(
    BuildContext context,
    Function tapHandler,
    IconData icon,
    String text,
    bool isLeading,
  ) {
    BorderRadius borderRadius = BorderRadius.only(
      bottomLeft: isLeading ? Radius.circular(8) : Radius.circular(0),
      bottomRight: isLeading ? Radius.circular(0) : Radius.circular(8),
    );

    return Flexible(
      child: Material(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: tapHandler,
          child: Container(
            padding: EdgeInsets.only(
              left: isLeading ? 16 : 0,
              right: isLeading ? 0 : 16,
            ),
            height: 50,
            child: Row(
              mainAxisAlignment:
                  isLeading ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: lightColor,
                ),
                SizedBox(width: 4),
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: lightColor,
                      ),
                )
              ],
            ),
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
      padding: const EdgeInsets.only(top: 8, bottom: 4),
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
