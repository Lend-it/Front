import 'package:flutter/material.dart';
import 'package:front/model/lend.model.dart';
import 'package:front/theme/colors.dart';

Widget modalButton({
  String title,
  Color color,
  Color textColor,
  Function onPressed,
}) {
  return ConstrainedBox(
    constraints: BoxConstraints.tightFor(
      width: double.infinity,
      height: 53,
    ),
    child: ElevatedButton(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: textColor,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    ),
  );
}

class ConfirmModal {
  static Future<void> showConfirmModal({
    LendModel lend,
    String title,
    String subtitle,
    String confirmButtonText,
    String declineButtonText,
    Function confirmPressed,
    BuildContext context,
  }) async {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          height: 320,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.warning_amber_rounded,
                  size: 50,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    modalButton(
                      color: secondaryColor,
                      onPressed: confirmPressed,
                      title: confirmButtonText,
                      textColor: lightColor,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    modalButton(
                      color: dangerColor.withOpacity(0.4),
                      onPressed: () => Navigator.pop(context),
                      title: declineButtonText,
                      textColor: dangerColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
