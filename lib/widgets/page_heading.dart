import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class PageHeading extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool inverted;

  const PageHeading({
    @required this.title,
    this.subtitle,
    this.inverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: this.inverted ? lightColor : darkColor,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 12),
        Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: this.inverted ? lightColor : darkColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
