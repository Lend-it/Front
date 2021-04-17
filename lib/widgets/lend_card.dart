import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/theme/colors.dart';
import 'package:front/utils/dates.dart';

// Widget lendCardHeader({
//   String title,
//   String category,
// }) {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 7.0),
//     child: IntrinsicHeight(
//       child: Row(
//         children: <Widget>[
//           Text(
//             title,
//             textAlign: TextAlign.left,
//             style: TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 16,
//             ),
//           ),
//           VerticalDivider(
//             width: 20,
//             color: grayColor,
//             thickness: 1,
//             endIndent: 17,
//             indent: 17,
//           ),
//           Chip(
//             label: Text(
//               category,
//               style: TextStyle(color: lightColor),
//             ),
//             backgroundColor: secondaryLightColor,
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget lendCardHandler({
//   Function onPressed,
// }) {
//   return GestureDetector(
//     onTap: onPressed,
//     child: Container(
//       padding: EdgeInsets.only(
//         left: 23,
//         right: 23,
//         top: 12,
//         bottom: 14,
//       ),
//       decoration: BoxDecoration(
//         color: primaryColor,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(8),
//           bottomRight: Radius.circular(8),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[],
//       ),
//     ),
//   );
// }

// Widget lendCardUserInfo({
//   String profilePic,
//   String userName,
//   String userRating,
//   String startDate,
//   String endDate,
// }) {
//   return Padding(
//     padding: EdgeInsets.only(bottom: 11, top: 4, right: 23, left: 23),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             CircleAvatar(
//               radius: 20,
//               backgroundImage: NetworkImage(profilePic),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 7.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(userName),
//                   Row(
//                     children: <Widget>[
//                       Icon(Icons.star, color: secondaryLightColor),
//                       Text(userRating)
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: <Widget>[
//             Icon(Icons.calendar_today_outlined),
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 7.0),
//                 child: Text(
//                     '${Dates.formatDateDDMM(startDate)} até ${Dates.formatDateDDMM(endDate)}')),
//           ],
//         ),
//       ],
//     ),
//   );
// }

// Widget lendCardDescription({String description}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 23.0),
//     child: Text(
//       description,
//       style: TextStyle(fontSize: 16),
//       maxLines: 2,
//       overflow: TextOverflow.ellipsis,
//     ),
//   );
// }

class LendCard extends StatelessWidget {
  final Function onPressed;
  final LendModel lend;

  LendCard({
    @required this.lend,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(lend.title),
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
            )
            // lendCardFooter(),
          ],
        ),
      ),
    );
  }
}
