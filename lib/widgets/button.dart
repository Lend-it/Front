import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onPressed;

  Button({
    @required this.title,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: lightColor,
        ),
      ),
      onPressed: onPressed,
      color: secondaryColor,
      minWidth: double.infinity,
      height: 66,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(4.0),
          topLeft: Radius.circular(4.0),
          bottomRight: Radius.circular(4.0),
          bottomLeft: Radius.circular(4.0),
        ),
      ),
    );
  }
}
