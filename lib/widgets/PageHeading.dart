import 'package:flutter/material.dart';
import 'package:front/theme/colors.dart';

class PageHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const PageHeading({
    @required this.title,
    this.subtitle,
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
            color: darkColor,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 12),
        Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.normal,
            color: darkColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
