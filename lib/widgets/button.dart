import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class Button extends StatelessWidget {
  final String title;
  final Function onPressedHandler;

  Button({
    @required this.title,
    @required this.onPressedHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8.0,
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: double.infinity,
            height: 66,
          ),
          child: ElevatedButton(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: lightColor,
              ),
            ),
            onPressed: onPressedHandler,
            style: ElevatedButton.styleFrom(
              primary: secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              textStyle: TextStyle(
                color: secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
